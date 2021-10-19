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
        createOrUpdateChannel(channel, systemPayload);
        break;
      case SystemMessageType.update_channel:
        createOrUpdateChannel(channel, systemPayload);
        break;
      case SystemMessageType.delete_channel:
        deleteChannel(channel, systemPayload);
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
        new NatsMessage(from: userChannel, to: channel + '-settings');
    var channelMessages = _channel2messages[channel];
    // TODO: check permissions on delete
    if (channelMessages != null && channelMessages.containsKey(messageId))
      channelMessages.remove(messageId);
    message.setSystemPayload(SystemMessageType.delete_message, {messageId: ''});
    return stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  /// Create [channel] in user and public channel list
  Future<bool> createPublicChannel(
      String channel, Map<String, String> settings) async {
    await checkPermissions(channel);
    var userChannel = await _userChannel();
    NatsMessage message =
        new NatsMessage(from: userChannel, to: channel + '-settings');
    settings.addAll({'admin': userChannel, channel: ''});
    message.setSystemPayload(SystemMessageType.create_channel, {channel: ''});
    return stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  /// Update [channel] in user and public channel list
  Future<bool> editPublicChannel(
      String channel, Map<String, String> settings) async {
    await checkPermissions(channel);
    var userChannel = await _userChannel();
    NatsMessage message =
        new NatsMessage(from: userChannel, to: channel + '-settings');
    settings.addAll({'admin': userChannel, channel: ''});
    message.setSystemPayload(SystemMessageType.update_channel, {channel: ''});
    return stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  /// Delete [channel] in user and public channel list
  Future<bool> deletePublicChannel(String channel) async {
    await checkPermissions(channel);
    var userChannel = await _userChannel();
    NatsMessage message =
        new NatsMessage(from: userChannel, to: channel + '-settings');
    message.setSystemPayload(SystemMessageType.delete_channel, {channel: ''});
    return stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  Future<void> checkPermissions(String channel) async {
    var channelSettings = _channel2settings[channel];
    var userChannel = await _userChannel();
    if (channelSettings!['admin'] != userChannel) {
      throw PermissionDeniedException();
    }
  }

  /// Subscribe user to existing [channel]
  Future<bool> subscribeToChannel(String channel) async {
    var userChannel = await _userChannel();
    NatsMessage message =
        new NatsMessage(from: userChannel, to: channel + '-settings');
    message.setSystemPayload(SystemMessageType.subscribe, {channel: ''});
    return stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  /// Unsubscribe user from existing [channel]
  Future<bool> unsubscribeFromChannel(String channel) async {
    var userChannel = await _userChannel();
    NatsMessage message =
        new NatsMessage(from: userChannel, to: channel + '-settings');
    message.setSystemPayload(SystemMessageType.unsubscribe, {channel: ''});
    return stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  Future<String> _userChannel() async {
    JwtPayload? authUser = await Token.getJwtPayloadObject();
    return authUser!.userId.toString();
  }

  String _publicChannel() => "channels";

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
        if (systemPayload.action == SystemMessageType.channels) {
          _userChannelIds.addAll(systemPayload.data.keys);
        }
        systemPayload.data.forEach((channel, value) async {
          print("listen.channel: $channel");
          if (!_channelSubscriptions.containsKey(channel)) {
            var subscription = await _subscribeToChannel(channel);
            _listenBySubscription(channel, subscription);
            _channelSubscriptions[channel] = subscription;
          }
          var channelSettings = channel + '-settings';
          if (!_channelSettingsSubscriptions.containsKey(channelSettings)) {
            var subscription = await _subscribeToChannel(channelSettings);
            _listenBySubscription(channelSettings, subscription);
            _channelSettingsSubscriptions[channelSettings] = subscription;
          }
        });
      }
      if (message.needAck) {
        stan.acknowledge(_subscriptionToUserInbox!, dataMessage);
      }
    }
  }

  Future<void> _listenPublicChannels() async {
    _subscriptionToPublicInbox = await _subscribeToChannel(_publicChannel());
    await for (final dataMessage in _subscriptionToPublicInbox!.stream) {
      NatsMessage message = _parseMessage(dataMessage);
      var systemPayload = message.getSystemPayload();
      if (systemPayload.action == SystemMessageType.channels) {
        _publicChannelIds.addAll(systemPayload.data.keys);
      }
      if (message.needAck) {
        stan.acknowledge(_subscriptionToPublicInbox!, dataMessage);
      }
    }
  }

  Future<Subscription?> _subscribeToChannel(channel) async {
    var clientID = await _userChannel();
    var durableName = "$clientID-$channel";
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

  void createOrUpdateChannel(String channel, SystemPayload systemPayload) {
    if (!_channel2settings.containsKey(channel)) {
      _channel2settings[channel] = new HashMap<String, String>();
    }
    _channel2settings[channel]!.addAll(systemPayload.data);
  }

  void deleteChannel(String channel, SystemPayload systemPayload) {
    if (_channel2settings.containsKey(channel)) {
      _channel2settings.remove(channel);
    }
  }
}
