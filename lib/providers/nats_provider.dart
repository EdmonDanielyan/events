import 'package:dart_nats_streaming/dart_nats_streaming.dart';
import 'package:dart_nats_streaming/src/subscription.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/token.dart';

@singleton
class NatsProvider {
  final stan = Client();

  late Subscription? channelListSubscription;
  late List<String> clientChannels = [];

  late Map<String, Subscription?> channel2Subscription = {};
  late Map<String, Subscription?> subscribedChannels = {};

  Future<bool> load() async {
    if (channel2Subscription.isNotEmpty) {
      stan.close();
      clientChannels.clear();
      channel2Subscription.clear();
      subscribedChannels.clear();
    }
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

    var clientID = await getClientID();
    publishSubscriptionToChannel(clientID);

    channelListSubscription = await subscribeToChannel("channels");
    onChannelListSubscription();
    return true;
  }

  Future<bool> connect() async {
    var clientID = await getClientID();
    var connectResult = await stan.connect(
        host: Urls.natsHost,
        port: Urls.natsPort,
        clusterID: Urls.natsCluster,
        clientID: clientID);
    return connectResult;
  }

  Future<Subscription?> subscribeToChannel(channel) async {
    if (subscribedChannels.containsKey(channel)){
      return subscribedChannels[channel];
    } else {
      var clientID = await getClientID();
      var durableName = "$clientID-$channel";
      print("subscribe # channel: $channel, durableName: $durableName");
      var subscription = await stan.subscribe(
          subject: channel, durableName: durableName);
      subscribedChannels[channel] = subscription;
      return subscription;
    }
  }

  Future<bool> publishSubscriptionToChannel(channel) async {
    var clientID = await getClientID();
    var publishResult = await publishMessageToChannel(clientID, channel);
    if (publishResult && !clientChannels.contains(channel)){
      clientChannels.add(channel);
    }
    return publishResult;
  }

  Future<bool> publishMessageToChannel(channel, message) async {
    return stan.pubString(subject: channel, string: message);
  }

  Future<String> getClientID() async {
    JwtPayload? authUser = await Token.getJwtPayloadObject();
    return authUser!.userId.toString();
  }

  Future<void> onChannelListSubscription() async {
    await for (final dataMessage in channelListSubscription!.stream) {
      var channelForSubscription = dataMessage.toString();
      print("onChannelListSubscription: $channelForSubscription");
      if (clientChannels.contains(channelForSubscription)) {
        if (!subscribedChannels.containsKey(channelForSubscription)) {
          var subscription = await subscribeToChannel(channelForSubscription);
          onChannelSubscription(subscription);
        }
      }
      stan.acknowledge(channelListSubscription!, dataMessage);
    }
  }

  Future<void> onChannelSubscription(subscription) async {
    await for (final dataMessage in subscription!.stream) {
      print("onChannelSubscription: ${dataMessage.toString()}");
      stan.acknowledge(subscription!, dataMessage);
    }
  }
}
