import 'dart:collection';

import 'package:dart_nats_streaming/dart_nats_streaming.dart';

// ignore: implementation_imports
import 'package:dart_nats_streaming/src/data_message.dart';

// ignore: implementation_imports
import 'package:dart_nats_streaming/src/subscription.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:uuid/uuid.dart';

const CREATE_CHANNEL = 'created';
const DELETE_CHANNEL = 'deleted';
const UPDATE_CHANNEL = 'updated';
const SUBSCRIBE_CHANNEL = 'subscribed';
const UNSUBSCRIBE_CHANNEL = 'unsubscribed';
const CHANNEL_ADMIN = 'admin';
const DELETE_MESSAGE = 'deleted';
const UPDATE_MESSAGE = 'updated';

const PUBLIC_CHANNEL = 'ink.chats.public';
const USER_ADMIN_CHANNEL = 'ink.chats.private.admin.';
const USER_MAIN_CHANNEL = 'ink.chats.private.main.';
const GROUP_ADMIN_CHANNEL = 'ink.chats.group.admin.';
const GROUP_MAIN_CHANNEL = 'ink.chats.group.main.';

@singleton
class NatsProvider {
  Future<bool> load() async {
    _stan.onConnect(function: () {
      print('Stan connected..');
    });
    _stan.onDisconnect(function: () {
      print('Stan disconnected..');
    });
    var connected = await _connect();
    if (!connected) {
      throw NoConnectionException();
    }
    _listenPublicChannel();
    _listenUserSettingsChannel();
    _listenUserChannel();
    return true;
  }

  Map<String, Map<String, String>> get channelSettings => _channelSettings;

  Map<String, Map<String, NatsMessage>> get channelMessages => _channelMessages;

  set onMessage(Future<void> Function(String, NatsMessage) value) {
    _onMessage = value;
  }

  /// Send [text] message to [channel]
  Future<bool> sendTextMessageToChannel(String channel, String text) async {
    var userId = await _getUserId();
    NatsMessage message = NatsMessage(from: userId, to: channel);
    message.setPayload(text);
    return _sendMessage(channel, message);
  }

  /// Send [document] message to [channel]
  Future<bool> sendDocumentMessageToChannel(
      String channel, List<int> document) async {
    var userId = await _getUserId();
    NatsMessage message = NatsMessage(from: userId, to: channel);
    message.setBinaryPayload(document);
    return _sendMessage(channel, message);
  }

  /// Send system message which contains [fields] to [channel] by [type]
  Future<bool> sendSystemMessageToChannel(String channel,
      SystemMessageType type, Map<String, String> fields) async {
    if (NATS_SYSTEM_MESSAGE_TYPES.contains(type)) {
      throw PermissionDeniedException(
          message: "unable to send NATS system messages");
    }
    var userId = await _getUserId();
    NatsMessage message = NatsMessage(from: userId, to: channel);
    message.setSystemPayload(type, fields);
    return _sendMessage(channel, message);
  }

  /// Delete [messageId] from [channel]
  Future<bool> deleteMessageFromChannel(
      String channel, String messageId) async {
    var userId = await _getUserId();
    var channelSettings = _getGroupAdminChannel(channel);
    NatsMessage message = NatsMessage(from: userId, to: channelSettings);
    var channelMessages = _channelMessages[channel];
    if (channelMessages != null && channelMessages.containsKey(messageId)) {
      var channelMessage = channelMessages[messageId];
      if (channelMessage!.from == userId) {
        channelMessages.remove(messageId);
      }
    }
    message.setSystemPayload(
        SystemMessageType.delete_message, {messageId: DELETE_MESSAGE});
    return _stan.pubBytes(
        subject: channelSettings, bytes: message.toBytes(), guid: message.id);
  }

  /// Update [text] in [channel] by [messageId]
  Future<bool> updateMessageInChannel(
      String channel, String messageId, String text) async {
    var userId = await _getUserId();
    var channelSettings = _getGroupAdminChannel(channel);
    NatsMessage message = NatsMessage(from: userId, to: channelSettings);
    var channelMessages = _channelMessages[channel];
    if (channelMessages != null && channelMessages.containsKey(messageId)) {
      var channelMessage = channelMessages[messageId];
      if (channelMessage!.from == userId) {
        channelMessage.payload = text;
        channelMessages[messageId] = channelMessage;
      }
    }
    message.setSystemPayload(SystemMessageType.update_message,
        {messageId: UPDATE_MESSAGE, 'body': text});
    return _stan.pubBytes(
        subject: channelSettings, bytes: message.toBytes(), guid: message.id);
  }

  /// Create channel with [settings]
  Future<String> createChannel(Map<String, String> settings) async {
    var channel = _generateGroupMainChannel();
    var userId = await _getUserId();
    await _registerPublicChannel(channel, userId);
    var channelSettings = _getGroupAdminChannel(channel);
    NatsMessage message = NatsMessage(from: userId, to: channelSettings);
    settings.addAll({CHANNEL_ADMIN: userId, channel: ''});
    message.setSystemPayload(
        SystemMessageType.create_channel, {channel: CREATE_CHANNEL});
    _stan.pubBytes(
        subject: channelSettings, bytes: message.toBytes(), guid: message.id);
    return channel;
  }

  /// Update [channel]
  Future<bool> updateChannel(
      String channel, Map<String, String> settings) async {
    await _checkPermissions(channel);
    var userId = await _getUserId();
    var channelSettings = _getGroupAdminChannel(channel);
    NatsMessage message = NatsMessage(from: userId, to: channelSettings);
    settings.addAll({CHANNEL_ADMIN: userId, channel: ''});
    message.setSystemPayload(
        SystemMessageType.update_channel, {channel: UPDATE_CHANNEL});
    return _stan.pubBytes(
        subject: channelSettings, bytes: message.toBytes(), guid: message.id);
  }

  /// Delete [channel]
  Future<bool> deleteChannel(String channel) async {
    await _checkPermissions(channel);
    var userId = await _getUserId();
    var channelSettings = _getGroupAdminChannel(channel);
    NatsMessage message = NatsMessage(from: userId, to: channelSettings);
    message.setSystemPayload(
        SystemMessageType.delete_channel, {channel: DELETE_CHANNEL});
    _unregisterPublicChannel(channel, userId);
    return _stan.pubBytes(
        subject: channelSettings, bytes: message.toBytes(), guid: message.id);
  }

  /// Subscribe user to existing [channel]
  Future<bool> subscribeToChannel(String channel) async {
    var userId = await _getUserId();
    if (!_userChannels.contains(channel)) {
      _userChannels.add(channel);
      NatsMessage message;
      message = NatsMessage(from: userId, to: userId);
      message.setSystemPayload(
          SystemMessageType.channels, {channel: SUBSCRIBE_CHANNEL});
      await _sendMessage(userId, message);
    } else {
      throw SubscriptionAlreadyExistException();
    }
    var channelSettings = _getGroupAdminChannel(channel);
    NatsMessage message = NatsMessage(from: userId, to: channelSettings);
    message.setSystemPayload(SystemMessageType.subscribe_to_channel,
        {channel: SUBSCRIBE_CHANNEL, userId: ''});
    return _stan.pubBytes(
        subject: channelSettings, bytes: message.toBytes(), guid: message.id);
  }

  /// Unsubscribe user from existing [channel]
  Future<bool> unsubscribeFromChannel(String channel) async {
    var userId = await _getUserId();
    var channelSettings = _getGroupAdminChannel(channel);
    NatsMessage message = NatsMessage(from: userId, to: channelSettings);
    message.setSystemPayload(SystemMessageType.unsubscribe_from_channel,
        {channel: UNSUBSCRIBE_CHANNEL, userId: ''});
    return _stan.pubBytes(
        subject: channelSettings, bytes: message.toBytes(), guid: message.id);
  }

  //////////////////////////////// NATS Protocol ///////////////////////////////

  Future<bool> _connect() async {
    var clientID = await _getUserId();
    var connectResult = await _stan.connect(
        host: Urls.natsHost,
        port: Urls.natsPort,
        clusterID: Urls.natsCluster,
        clientID: clientID);
    return connectResult;
  }

  Future<String> _getUserId() async {
    JwtPayload? authUser = await Token.getJwtPayloadObject();
    return authUser!.userId.toString();
  }

  Future<String> _getDeviceVirtualId() async {
    var deviceVirtualId = await Token.getDeviceVirtualId();
    return deviceVirtualId!;
  }

  String _getPublicChannel() => PUBLIC_CHANNEL;

  String _getUserAdminChannel(String userId) => USER_ADMIN_CHANNEL + userId;

  String _getUserMainChannel(String userId) => USER_MAIN_CHANNEL + userId;

  String _getGroupAdminChannel(String mainChannel) =>
      mainChannel.replaceFirst('.main.', '.admin.');

  String _generateGroupMainChannel() => GROUP_MAIN_CHANNEL + Uuid().v4();

  Future<void> _registerPublicChannel(String channel, String userId) async {
    var userAdminChannel = _getUserAdminChannel(userId);
    if (!_userChannels.contains(channel) &&
        !_publicChannels.contains(channel)) {
      _userChannels.add(channel);
      _publicChannels.add(channel);
      NatsMessage message;
      message = NatsMessage(from: userId, to: userAdminChannel);
      message.setSystemPayload(
          SystemMessageType.channels, {channel: CREATE_CHANNEL});
      await _sendMessage(userId, message);
      var publicChannel = this._getPublicChannel();
      message = NatsMessage(from: userId, to: publicChannel);
      message.setSystemPayload(
          SystemMessageType.channels, {channel: CREATE_CHANNEL});
      await _sendMessage(publicChannel, message);
    } else {
      throw ChannelAlreadyExistException();
    }
  }

  void _unregisterPublicChannel(String channel, userId) async {
    var userAdminChannel = _getUserAdminChannel(userId);
    if (_userChannels.contains(channel) && _publicChannels.contains(channel)) {
      _userChannels.remove(channel);
      _publicChannels.remove(channel);
      NatsMessage message;
      message = NatsMessage(from: userId, to: userAdminChannel);
      message.setSystemPayload(
          SystemMessageType.channels, {channel: DELETE_CHANNEL});
      await _sendMessage(userId, message);
      var publicChannel = this._getPublicChannel();
      message = NatsMessage(from: userId, to: publicChannel);
      message.setSystemPayload(
          SystemMessageType.channels, {channel: DELETE_CHANNEL});
      await _sendMessage(publicChannel, message);
    }
  }

  Future<void> _checkPermissions(String channel) async {
    var channelSettings = _channelSettings[channel];
    var userId = await _getUserId();
    if (channelSettings![CHANNEL_ADMIN] != userId) {
      throw PermissionDeniedException();
    }
  }

  Future<bool> _sendMessage(String channel, NatsMessage message) async {
    return await _stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  NatsMessage _parseMessage(dataMessage) {
    var payload = (dataMessage as DataMessage).encodedPayload;
    var message = NatsMessage.fromBytes(payload);
    return message;
  }

  Future<void> _listenUserSettingsChannel() async {
    var userId = await _getUserId();
    var userAdminChannel = _getUserAdminChannel(userId);
    _subscriptionToUserSettingsChannel =
        await _subscribeToChannel(userAdminChannel);
    await for (final dataMessage
        in _subscriptionToUserSettingsChannel!.stream) {
      NatsMessage message = _parseMessage(dataMessage);
      var systemPayload = message.getSystemPayload();
      if (systemPayload.type == SystemMessageType.channels) {
        systemPayload.fields.forEach((channel, action) async {
          if (action == CREATE_CHANNEL || action == SUBSCRIBE_CHANNEL) {
            _userChannels.add(channel);
            await _subscribeToChannels(channel);
          } else if (action == DELETE_CHANNEL ||
              action == UNSUBSCRIBE_CHANNEL) {
            _userChannels.remove(channel);
            await _unsubscribeFromChannels(channel);
          }
        });
      }
      if (message.needAck) {
        _stan.acknowledge(_subscriptionToUserSettingsChannel!, dataMessage);
      }
    }
  }

  Future<void> _listenUserChannel() async {
    var userId = await _getUserId();
    var userMainChannel = _getUserMainChannel(userId);
    var subscription = await _subscribeToChannel(userMainChannel);
    _listenBySubscription(userMainChannel, subscription);
  }

  Future<void> _subscribeToChannels(String channel) async {
    if (!_channelSubscriptions.containsKey(channel)) {
      var subscription = await _subscribeToChannel(channel);
      _listenBySubscription(channel, subscription);
      _channelSubscriptions[channel] = subscription;
    }
    var channelSettings = _getGroupAdminChannel(channel);
    if (!_channelSettingsSubscriptions.containsKey(channelSettings)) {
      var subscription = await _subscribeToChannel(channelSettings);
      _listenBySubscription(channelSettings, subscription);
      _channelSettingsSubscriptions[channelSettings] = subscription;
    }
  }

  Future<void> _unsubscribeFromChannels(String channel) async {
    if (_channelSubscriptions.containsKey(channel)) {
      _channelSubscriptions.remove(channel);
    }
    var channelSettings = _getGroupAdminChannel(channel);
    if (!_channelSettingsSubscriptions.containsKey(channelSettings)) {
      _channelSettingsSubscriptions.remove(channelSettings);
    }
  }

  Future<void> _listenPublicChannel() async {
    var publicChannel = _getPublicChannel();
    _subscriptionToPublicChannel = await _subscribeToChannel(publicChannel);
    await for (final dataMessage in _subscriptionToPublicChannel!.stream) {
      NatsMessage message = _parseMessage(dataMessage);
      var systemPayload = message.getSystemPayload();
      if (systemPayload.type == SystemMessageType.channels) {
        systemPayload.fields.forEach((channel, action) {
          if (action == CREATE_CHANNEL) {
            _publicChannels.add(channel);
          } else if (action == DELETE_CHANNEL) {
            _publicChannels.remove(channel);
          }
        });
      }
      if (message.needAck) {
        _stan.acknowledge(_subscriptionToPublicChannel!, dataMessage);
      }
    }
  }

  Future<Subscription?> _subscribeToChannel(channel) async {
    var clientId = await _getUserId();
    var deviceVirtualId = await _getDeviceVirtualId();
    var durableName = "$clientId-$deviceVirtualId-$channel";
    var subscription =
        await _stan.subscribe(subject: channel, durableName: durableName);
    return subscription;
  }

  Future<void> _listenBySubscription(channel, subscription) async {
    sendSystemMessageToChannel(channel, SystemMessageType.echo_message, {});
    await for (final dataMessage in subscription!.stream) {
      NatsMessage message = _parseMessage(dataMessage);
      if (message.type == MessageType.system) {
        await _onSystemMessage(channel, message);
      }
      await _onSaveMessage(channel, message);
      await _onMessage(channel, message);
      if (message.needAck) {
        _stan.acknowledge(subscription!, dataMessage);
      }
    }
  }

  void _createOrUpdateChannel(String channel, SystemPayload systemPayload) {
    if (!_channelSettings.containsKey(channel)) {
      _channelSettings[channel] = HashMap<String, String>();
    }
    _channelSettings[channel]!.addAll(systemPayload.fields);
  }

  void _deleteChannel(String channel, SystemPayload systemPayload) {
    if (_channelSettings.containsKey(channel)) {
      _channelSettings.remove(channel);
    }
  }

  late Future<void> Function(String, NatsMessage) _onMessage =
      (channel, message) async {
    print("onMessage.channel: $channel, message: $message");
  };

  late Future<void> Function(String, NatsMessage) _onSaveMessage =
      (channel, message) async {
    if (!_channelMessages.containsKey(channel)) {
      _channelMessages[channel] = HashMap<String, NatsMessage>();
    }
    _channelMessages[channel]!.addAll({message.id: message});
  };

  late Future<void> Function(String, NatsMessage) _onSystemMessage =
      (channel, message) async {
    var systemPayload = message.payload as SystemPayload;
    switch (systemPayload.type) {
      case SystemMessageType.channels:
        break;
      case SystemMessageType.create_channel:
        _createOrUpdateChannel(channel, systemPayload);
        break;
      case SystemMessageType.update_channel:
        _createOrUpdateChannel(channel, systemPayload);
        break;
      case SystemMessageType.delete_channel:
        _deleteChannel(channel, systemPayload);
        break;
      default:
        break;
    }
  };

  Set<String> get userChannels => _userChannels;
  Set<String> get publicChannels => _publicChannels;

  final _stan = Client();
  final Map<String, Subscription?> _channelSubscriptions = {};
  final Map<String, Subscription?> _channelSettingsSubscriptions = {};
  final Set<String> _userChannels = {};
  final Set<String> _publicChannels = {};
  final Map<String, Map<String, String>> _channelSettings = {};
  final Map<String, Map<String, NatsMessage>> _channelMessages = {};
  late Subscription? _subscriptionToUserSettingsChannel;
  late Subscription? _subscriptionToPublicChannel;
}
