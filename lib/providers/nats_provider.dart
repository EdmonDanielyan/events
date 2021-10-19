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

  late Future<void> Function(String, NatsMessage) _onMessage =
      (channel, message) async {};
  late Future<void> Function(String, NatsMessage) _onSystemMessage;

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

    _onSystemMessage = (channel, message) async {
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
          // TODO: Handle this case.
          break;
        case SystemMessageType.unsubscribe:
          // TODO: Handle this case.
          break;
        case SystemMessageType.delete_message:
          // TODO: Handle this case.
          break;
      }
    };

    _listenUserChannels();
    _listenPublicChannels();

    createPublicChannel("99999.F");
    publishMessageToChannel("99999.F", "TEST");
    return true;
  }

  Map<String, Subscription?> get channelSubscriptions => _channelSubscriptions;

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
  Future<bool> publishMessageToChannel(channel, payload) async {
    var userChannel = await _userChannel();
    NatsMessage message = new NatsMessage(from: userChannel, to: channel);
    message.setPayload(payload);
    return stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  /// Delete [payload] from [channel]
  Future<bool> deleteMessageInChannel(channel, payload) async {
    bool result = false;
    return result;
  }

  /// Create [channel] in user and public channel list
  Future<bool> createPublicChannel(channel) async {
    bool result = false;
    return result;
  }

  /// Update [channel] in user and public channel list
  Future<bool> editPublicChannel(channel) async {
    bool result = false;
    return result;
  }

  /// Delete [channel] in user and public channel list
  Future<bool> deletePublicChannel(channel) async {
    bool result = false;
    return result;
  }

  /// Subscribe user to existing [channel]
  Future<bool> subscribeToChannel(channel) async {
    bool result = false;
    return result;
  }

  /// Unsubscribe user from existing [channel]
  Future<bool> unsubscribeFromChannel(channel) async {
    bool result = false;
    return result;
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
      }
      await _onMessage(channel, message);
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
