import 'dart:collection';

import 'package:dart_nats_streaming/dart_nats_streaming.dart';
import 'package:dart_nats_streaming/src/data_message.dart';
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
const CHANNEL_SETTINGS = '-settings';
const CHANNEL_ADMIN = 'admin';
const CHANNEL_LIST = 'channels';

@singleton
class NatsProvider {
  final stan = Client();
  final Map<String, Subscription?> _channelSubscriptions = {};
  final Map<String, Subscription?> _channelSettingsSubscriptions = {};

  late Subscription? _subscriptionToUserInbox;
  late Subscription? _subscriptionToPublicInbox;

  final Set<String> _userChannelIds = {};
  final Set<String> _publicChannelIds = {};
  final Map<String, Map<String, String>> _channel2settings = {};
  final Map<String, Map<String, String>> _channel2messages = {};

  late Future<void> Function(String, NatsMessage) _onMessage =
      (channel, message) async {};
  late Future<void> Function(String, NatsMessage) _onSaveMessage =
      (channel, message) async {
    if (!_channel2messages.containsKey(channel)) {
      _channel2messages[channel] = new HashMap<String, String>();
    }
    _channel2messages[channel]!
        .addAll({message.id: (message.payload as String)});
  };
  late Future<void> Function(String, NatsMessage) _onSystemMessage =
      (channel, message) async {
    var systemPayload = message.payload as SystemPayload;
    switch (systemPayload.action) {
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
      case SystemMessageType.subscribe:
        break;
      case SystemMessageType.unsubscribe:
        break;
      case SystemMessageType.delete_message:
        break;
    }
  };

  Future<bool> load() async {
    stan.onConnect(function: () {
      print('Stan connected..');
    });
    stan.onDisconnect(function: () {
      print('Stan disconnected..');
    });
    var connected = await connect();
    if (!connected) {
      throw NoConnectionException();
    }

    _listenUserChannels();
    _listenPublicChannels();

    // tests
    var newChannel = Uuid().v4();
    createPublicChannel(newChannel, {
      "name": "Избранное",
      "description": "Канал для заметок",
      "avatar_url":
          "https://avatars.mds.yandex.net/get-kinopoisk-image/1599028/8bfdb754-1cc2-469a-9437-54ed95b0cbc9/300x",
      "created_at": DateTime.now().toString(),
    });
    publishMessageToChannel(newChannel, "Моя первая заметка!");
    return true;
  }

  Map<String, Map<String, String>> get channel2settings => _channel2settings;

  set onMessage(Future<void> Function(String, NatsMessage) value) {
    _onMessage = value;
  }

  /// Connect to NATS streaming server
  Future<bool> connect() async {
    var clientID = await _userChannel();
    var connectResult = await stan.connect(
        host: Urls.natsHost,
        port: Urls.natsPort,
        clusterID: Urls.natsCluster,
        clientID: clientID);
    return connectResult;
  }

  /// Publish string [payload] to [channel]
  Future<bool> publishMessageToChannel(String channel, payload) async {
    var userChannel = await _userChannel();
    NatsMessage message = new NatsMessage(from: userChannel, to: channel);
    message.setPayload(payload);
    return stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  /// Delete [payload] from [channel]
  Future<bool> deleteMessageFromChannel(
      String channel, String messageId) async {
    var userChannel = await _userChannel();
    NatsMessage message =
        new NatsMessage(from: userChannel, to: channel + CHANNEL_SETTINGS);
    var channelMessages = _channel2messages[channel];
    // TODO: check permissions on delete
    if (channelMessages != null && channelMessages.containsKey(messageId))
      channelMessages.remove(messageId);
    message.setSystemPayload(SystemMessageType.delete_message, {messageId: ''});
    return stan.pubBytes(
        subject: channel + CHANNEL_SETTINGS,
        bytes: message.toBytes(),
        guid: message.id);
  }

  /// Create [channel] in user and public channel list
  Future<bool> createPublicChannel(
      String channel, Map<String, String> settings) async {
    var userChannel = await _userChannel();
    await registerPublicChannel(channel, userChannel);
    NatsMessage message =
        new NatsMessage(from: userChannel, to: channel + CHANNEL_SETTINGS);
    settings.addAll({CHANNEL_ADMIN: userChannel, channel: ''});
    message.setSystemPayload(
        SystemMessageType.create_channel, {channel: CREATE_CHANNEL});
    return stan.pubBytes(
        subject: channel + CHANNEL_SETTINGS,
        bytes: message.toBytes(),
        guid: message.id);
  }

  Future<void> registerPublicChannel(String channel, String userChannel) async {
    if (!_userChannelIds.contains(channel) &&
        !_publicChannelIds.contains(channel)) {
      _userChannelIds.add(channel);
      _publicChannelIds.add(channel);
      NatsMessage message;
      message =
          new NatsMessage(needAck: false, from: userChannel, to: userChannel);
      message.setSystemPayload(
          SystemMessageType.channels, {channel: CREATE_CHANNEL});
      await _sendMessage(userChannel, message);
      var publicChannel = this._publicChannel();
      message =
          new NatsMessage(needAck: false, from: userChannel, to: publicChannel);
      message.setSystemPayload(
          SystemMessageType.channels, {channel: CREATE_CHANNEL});
      await _sendMessage(publicChannel, message);
    } else {
      throw ChannelAlreadyExistException();
    }
  }

  /// Update [channel] in user and public channel list
  Future<bool> updatePublicChannel(
      String channel, Map<String, String> settings) async {
    await checkPermissions(channel);
    var userChannel = await _userChannel();
    NatsMessage message =
        new NatsMessage(from: userChannel, to: channel + CHANNEL_SETTINGS);
    settings.addAll({CHANNEL_ADMIN: userChannel, channel: ''});
    message.setSystemPayload(
        SystemMessageType.update_channel, {channel: UPDATE_CHANNEL});
    return stan.pubBytes(
        subject: channel + CHANNEL_SETTINGS,
        bytes: message.toBytes(),
        guid: message.id);
  }

  /// Delete [channel] in user and public channel list
  Future<bool> deletePublicChannel(String channel) async {
    await checkPermissions(channel);
    var userChannel = await _userChannel();
    NatsMessage message =
        new NatsMessage(from: userChannel, to: channel + CHANNEL_SETTINGS);
    message.setSystemPayload(
        SystemMessageType.delete_channel, {channel: DELETE_CHANNEL});
    unregisterPublicChannel(channel, userChannel);
    return stan.pubBytes(
        subject: channel + CHANNEL_SETTINGS,
        bytes: message.toBytes(),
        guid: message.id);
  }

  void unregisterPublicChannel(String channel, userChannel) async {
    if (_userChannelIds.contains(channel) &&
        _publicChannelIds.contains(channel)) {
      _userChannelIds.remove(channel);
      _publicChannelIds.remove(channel);

      NatsMessage message;
      message =
          new NatsMessage(needAck: false, from: userChannel, to: userChannel);
      message.setSystemPayload(
          SystemMessageType.channels, {channel: DELETE_CHANNEL});
      await _sendMessage(userChannel, message);
      var publicChannel = this._publicChannel();
      message =
          new NatsMessage(needAck: false, from: userChannel, to: publicChannel);
      message.setSystemPayload(
          SystemMessageType.channels, {channel: DELETE_CHANNEL});
      await _sendMessage(publicChannel, message);
    }
  }

  Future<void> checkPermissions(String channel) async {
    var channelSettings = _channel2settings[channel];
    var userChannel = await _userChannel();
    if (channelSettings![CHANNEL_ADMIN] != userChannel) {
      throw PermissionDeniedException();
    }
  }

  /// Subscribe user to existing [channel]
  Future<bool> subscribeToChannel(String channel) async {
    var userChannel = await _userChannel();
    if (!_userChannelIds.contains(channel)) {
      _userChannelIds.add(channel);
      NatsMessage message;
      message =
          new NatsMessage(needAck: false, from: userChannel, to: userChannel);
      message.setSystemPayload(
          SystemMessageType.channels, {channel: SUBSCRIBE_CHANNEL});
      await _sendMessage(userChannel, message);
    } else {
      throw SubscriptionAlreadyExistException();
    }

    NatsMessage message =
        new NatsMessage(from: userChannel, to: channel + CHANNEL_SETTINGS);
    message.setSystemPayload(SystemMessageType.subscribe,
        {channel: SUBSCRIBE_CHANNEL, userChannel: ''});
    return stan.pubBytes(
        subject: channel + CHANNEL_SETTINGS,
        bytes: message.toBytes(),
        guid: message.id);
  }

  /// Unsubscribe user from existing [channel]
  Future<bool> unsubscribeFromChannel(String channel) async {
    var userChannel = await _userChannel();
    NatsMessage message =
        new NatsMessage(from: userChannel, to: channel + CHANNEL_SETTINGS);
    message.setSystemPayload(SystemMessageType.unsubscribe,
        {channel: UNSUBSCRIBE_CHANNEL, userChannel: ''});
    return stan.pubBytes(
        subject: channel + CHANNEL_SETTINGS,
        bytes: message.toBytes(),
        guid: message.id);
  }

  Future<String> _userChannel() async {
    JwtPayload? authUser = await Token.getJwtPayloadObject();
    return authUser!.userId.toString();
  }

  String _publicChannel() => CHANNEL_LIST;

  Future<bool> _sendMessage(String channel, NatsMessage message) async {
    print("channel: $channel, message: $message");
    return await stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  NatsMessage _parseMessage(dataMessage) {
    var payload = (dataMessage as DataMessage).encodedPayload;
    var message = NatsMessage.fromBytes(payload);
    print("message: $message from ${payload.length} bytes");
    return message;
  }

  Future<void> _listenUserChannels() async {
    _subscriptionToUserInbox = await _subscribeToChannel(await _userChannel());
    await for (final dataMessage in _subscriptionToUserInbox!.stream) {
      NatsMessage message = _parseMessage(dataMessage);
      var systemPayload = message.getSystemPayload();
      if (systemPayload.action == SystemMessageType.channels) {
        systemPayload.data.forEach((channel, action) async {
          print("channel: $channel, action: $action");
          if (action == CREATE_CHANNEL || action == SUBSCRIBE_CHANNEL) {
            _userChannelIds.add(channel);
            await _subscribeToChannels(channel);
          } else if (action == DELETE_CHANNEL ||
              action == UNSUBSCRIBE_CHANNEL) {
            _userChannelIds.remove(channel);
            await _unsubscribeFromChannels(channel);
          }
        });
      }
      if (message.needAck) {
        stan.acknowledge(_subscriptionToUserInbox!, dataMessage);
      }
    }
  }

  Future<void> _subscribeToChannels(String channel) async {
    if (!_channelSubscriptions.containsKey(channel)) {
      var subscription = await _subscribeToChannel(channel);
      _listenBySubscription(channel, subscription);
      _channelSubscriptions[channel] = subscription;
    }
    var channelSettings = channel + CHANNEL_SETTINGS;
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
    var channelSettings = channel + CHANNEL_SETTINGS;
    if (!_channelSettingsSubscriptions.containsKey(channelSettings)) {
      _channelSettingsSubscriptions.remove(channelSettings);
    }
  }

  Future<void> _listenPublicChannels() async {
    _subscriptionToPublicInbox = await _subscribeToChannel(_publicChannel());
    await for (final dataMessage in _subscriptionToPublicInbox!.stream) {
      NatsMessage message = _parseMessage(dataMessage);
      var systemPayload = message.getSystemPayload();
      if (systemPayload.action == SystemMessageType.channels) {
        systemPayload.data.forEach((channel, action) {
          if (action == CREATE_CHANNEL) {
            _publicChannelIds.add(channel);
          } else if (action == DELETE_CHANNEL) {
            _publicChannelIds.remove(channel);
          }
        });
      }
      if (message.needAck) {
        stan.acknowledge(_subscriptionToPublicInbox!, dataMessage);
      }
    }
  }

  Future<Subscription?> _subscribeToChannel(channel) async {
    var clientID = await _userChannel();
    var durableName = "$clientID-$channel";
    // TODO: add device ID
    print("subscribe.channel: $channel, client: $clientID");
    var subscription =
        await stan.subscribe(subject: channel, durableName: durableName);
    return subscription;
  }

  Future<void> _listenBySubscription(channel, subscription) async {
    await for (final dataMessage in subscription!.stream) {
      NatsMessage message = _parseMessage(dataMessage);
      if (message.type == MessageType.system) {
        await _onSystemMessage(channel, message);
      } else {
        await _onSaveMessage(channel, message);
        await _onMessage(channel, message);
      }
      if (message.needAck) {
        stan.acknowledge(subscription!, dataMessage);
      }
    }
  }

  void _createOrUpdateChannel(String channel, SystemPayload systemPayload) {
    if (!_channel2settings.containsKey(channel)) {
      _channel2settings[channel] = new HashMap<String, String>();
    }
    _channel2settings[channel]!.addAll(systemPayload.data);
  }

  void _deleteChannel(String channel, SystemPayload systemPayload) {
    if (_channel2settings.containsKey(channel)) {
      _channel2settings.remove(channel);
    }
  }
}
