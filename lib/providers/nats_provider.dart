import 'package:dart_nats_streaming/dart_nats_streaming.dart';
import 'package:dart_nats_streaming/src/data_message.dart';
import 'package:dart_nats_streaming/src/subscription.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';

@singleton
class NatsProvider {
  final stan = Client();
  final Map<String, String> _userChannels = {};
  final Map<String, String> _publicChannels = {};
  final Map<String, Subscription?> _channelSubscriptions = {};

  late Subscription? _subscriptionToUserChannels;
  late Subscription? _subscriptionToPublicChannels;

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

    _subscriptionToUserChannels =
        await _subscribeToChannel(await _userChannel());
    _listenUserChannels();

    _subscriptionToPublicChannels = await _subscribeToChannel(_publicChannel());
    _listenPublicChannels();

    // registerPublicChannel("99999.F");
    // publishMessageToChannel("99999.F", "TEST");
    return true;
  }

  Map<String, String> get userChannels => _userChannels;

  Map<String, String> get publicChannels => _publicChannels;

  Map<String, Subscription?> get channelSubscriptions => _channelSubscriptions;

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

  /// Register [channel] in user and public channel list
  Future<bool> registerPublicChannel(channel) async {
    bool result = false;
    if (!_userChannels.containsKey(channel) &&
        !_publicChannels.containsKey(channel)) {
      _userChannels[channel] = "";
      _publicChannels[channel] = "";
      NatsMessage message;

      var userChannel = await _userChannel();
      message =
          new NatsMessage(needAck: false, from: userChannel, to: userChannel);
      message.setSystemPayload(SystemMessageType.channels, _userChannels);
      result = await _sendMessage(userChannel, message);

      var publicChannel = this._publicChannel();
      message =
          new NatsMessage(needAck: false, from: userChannel, to: publicChannel);
      message.setSystemPayload(SystemMessageType.channels, _publicChannels);
      result = await _sendMessage(publicChannel, message);

      subscribeToChannel(channel);
    }
    return result;
  }

  /// Unregister [channel] in user and public channel list
  Future<bool> unregisterPublicChannel(channel) async {
    bool result = false;
    if (_userChannels.containsKey(channel) &&
        _publicChannels.containsKey(channel)) {
      this._userChannels.remove(channel);
      this._publicChannels.remove(channel);
      NatsMessage message;

      var userChannel = await _userChannel();
      message =
          new NatsMessage(needAck: false, from: userChannel, to: userChannel);
      message.setSystemPayload(SystemMessageType.channels, this._userChannels);
      result = await _sendMessage(userChannel, message);

      var publicChannel = this._publicChannel();
      message =
          new NatsMessage(needAck: false, from: userChannel, to: publicChannel);
      message.setSystemPayload(
          SystemMessageType.channels, this._publicChannels);
      result = await _sendMessage(publicChannel, message);

      unsubscribeFromChannel(channel);
    }
    return result;
  }

  /// Subscribe user to existing [channel]
  Future<bool> subscribeToChannel(channel) async {
    bool result = false;
    if (!_userChannels.containsKey(channel)) {
      _userChannels[channel] = "";
      var userChannel = await _userChannel();
      NatsMessage message =
          new NatsMessage(needAck: false, from: userChannel, to: userChannel);
      message.setSystemPayload(SystemMessageType.channels, _userChannels);
      result = await _sendMessage(userChannel, message);
    }
    return result;
  }

  /// Unsubscribe user from existing [channel]
  Future<bool> unsubscribeFromChannel(channel) async {
    bool result = false;
    if (_userChannels.containsKey(channel)) {
      _userChannels.remove(channel);
      var userChannel = await _userChannel();
      NatsMessage message =
          new NatsMessage(needAck: false, from: userChannel, to: userChannel);
      message.setSystemPayload(SystemMessageType.channels, _userChannels);
      result = await _sendMessage(userChannel, message);
    }
    return result;
  }

  Future<String> _userChannel() async {
    // JwtPayload? authUser = await Token.getJwtPayloadObject();
    // return authUser!.userId.toString();
    return "99999";
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

  Future<void> _listenBySubscription(subscription) async {
    await for (final dataMessage in subscription!.stream) {
      NatsMessage message = _parseMessage(dataMessage);
      if (message.needAck) {
        stan.acknowledge(subscription!, dataMessage);
      }
    }
  }

  Future<void> _listenUserChannels() async {
    await for (final dataMessage in _subscriptionToUserChannels!.stream) {
      NatsMessage message = _parseMessage(dataMessage);
      var systemPayload = message.getSystemPayload();
      if (systemPayload.action == SystemMessageType.channels) {
        _userChannels.addAll(systemPayload.data);
        systemPayload.data.forEach((channel, value) async {
          print("listen.channel: $channel");
          if (!_channelSubscriptions.containsKey(channel)) {
            var subscription = await _subscribeToChannel(channel);
            _listenBySubscription(subscription);
            _channelSubscriptions[channel] = subscription;
          }
        });
      }
      if (message.needAck) {
        stan.acknowledge(_subscriptionToUserChannels!, dataMessage);
      }
    }
  }

  Future<void> _listenPublicChannels() async {
    await for (final dataMessage in _subscriptionToPublicChannels!.stream) {
      NatsMessage message = _parseMessage(dataMessage);
      var systemPayload = message.getSystemPayload();
      if (systemPayload.action == SystemMessageType.channels) {
        _publicChannels.addAll(systemPayload.data);
      }
      if (message.needAck) {
        stan.acknowledge(_subscriptionToPublicChannels!, dataMessage);
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
}
