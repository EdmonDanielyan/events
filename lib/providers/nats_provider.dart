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

  late Subscription? subscriptionToUserChannelList;
  late Subscription? subscriptionToPublicChannelList;
  late Map<String, String> userChannels = {};
  late Map<String, String> publicChannels = {};
  late Map<String, Subscription?> channelSubscriptions = {};

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
    var clientID = await _userChannelList();

    subscriptionToUserChannelList = await _subscribeToChannel(clientID);
    _listenUserChannelList();

    subscriptionToPublicChannelList =
        await _subscribeToChannel(_publicChannelList());
    _listenPublicChannelList();
    return true;
  }

  Future<bool> connect() async {
    var clientID = await _userChannelList();
    var connectResult = await stan.connect(
        host: Urls.natsHost,
        port: Urls.natsPort,
        clusterID: Urls.natsCluster,
        clientID: clientID);
    return connectResult;
  }

  Future<bool> publishMessageToChannel(channel, payload) async {
    NatsMessage message = new NatsMessage();
    message.setPayload(payload);
    return stan.pubBytes(subject: channel, bytes: message.toBytes());
  }

  Future<bool> createPublicChannel(channel) async {
    bool result = false;
    if (!userChannels.containsKey(channel) &&
        !publicChannels.containsKey(channel)) {
      userChannels[channel] = "";
      publicChannels[channel] = "";
      NatsMessage message;

      message = new NatsMessage();
      message.setSystemPayload(SystemMessageType.favorites, userChannels);
      var userChannelList = await _userChannelList();
      result = await stan.pubBytes(
          subject: userChannelList, bytes: message.toBytes());

      message = new NatsMessage();
      message.setSystemPayload(SystemMessageType.channels, userChannels);
      var publicChannelList = this._publicChannelList();
      result = await stan.pubBytes(
          subject: publicChannelList, bytes: message.toBytes());
    }
    return result;
  }

  Future<bool> deletePublicChannel(channel) async {
    bool result = false;
    if (userChannels.containsKey(channel) &&
        publicChannels.containsKey(channel)) {
      userChannels.remove(channel);
      publicChannels.remove(channel);
      NatsMessage message;

      message = new NatsMessage();
      message.setSystemPayload(SystemMessageType.favorites, userChannels);
      var userChannelList = await _userChannelList();
      result = await stan.pubBytes(
          subject: userChannelList, bytes: message.toBytes());

      message = new NatsMessage();
      message.setSystemPayload(SystemMessageType.channels, userChannels);
      var publicChannelList = this._publicChannelList();
      result = await stan.pubBytes(
          subject: publicChannelList, bytes: message.toBytes());
    }
    return result;
  }

  Future<bool> subscribeToChannel(channel) async {
    bool result = false;
    if (!userChannels.containsKey(channel)) {
      userChannels[channel] = "";
      NatsMessage message = new NatsMessage();
      message.setSystemPayload(SystemMessageType.favorites, userChannels);
      var userChannel = await _userChannelList();
      result =
          await stan.pubBytes(subject: userChannel, bytes: message.toBytes());
    }
    return result;
  }

  Future<bool> unsubscribeFromChannel(channel) async {
    bool result = false;
    if (userChannels.containsKey(channel)) {
      userChannels.remove(channel);
      NatsMessage message = new NatsMessage();
      message.setSystemPayload(SystemMessageType.favorites, userChannels);
      var userChannel = await _userChannelList();
      result =
          await stan.pubBytes(subject: userChannel, bytes: message.toBytes());
    }
    return result;
  }

  Future<void> listenBySubscription(subscription) async {
    await for (final dataMessage in subscription!.stream) {
      var payload = (dataMessage as DataMessage).encodedPayload;
      var message = NatsMessage.fromBytes(payload);
      print("listen.message: $message");
      stan.acknowledge(subscription!, dataMessage);
    }
  }

  Future<String> _userChannelList() async {
    JwtPayload? authUser = await Token.getJwtPayloadObject();
    return authUser!.userId.toString();
  }

  String _publicChannelList() => "channelList";

  Future<void> _listenUserChannelList() async {
    await for (final dataMessage in subscriptionToUserChannelList!.stream) {
      var payload = (dataMessage).encodedPayload;
      var message = NatsMessage.fromBytes(payload);
      var systemPayload = message.getSystemPayload();
      if (systemPayload.action == SystemMessageType.favorites) {
        userChannels.addAll(systemPayload.data);
        systemPayload.data.forEach((channel, value) async {
          print("listen.channel: $channel");
          if (!channelSubscriptions.containsKey(channel)) {
            var subscription = await _subscribeToChannel(channel);
            listenBySubscription(subscription);
            channelSubscriptions[channel] = subscription;
          }
        });
      }
    }
  }

  Future<void> _listenPublicChannelList() async {
    await for (final dataMessage in subscriptionToPublicChannelList!.stream) {
      var payload = (dataMessage).encodedPayload;
      var message = NatsMessage.fromBytes(payload);
      var systemPayload = message.getSystemPayload();
      if (systemPayload.action == SystemMessageType.channels) {
        publicChannels.addAll(systemPayload.data);
      }
    }
  }

  Future<Subscription?> _subscribeToChannel(channel) async {
    var clientID = await _userChannelList();
    var durableName = "$clientID-$channel";
    print("subscribe.channel: $channel, client: $clientID");
    var subscription =
        await stan.subscribe(subject: channel, durableName: durableName);
    return subscription;
  }
}
