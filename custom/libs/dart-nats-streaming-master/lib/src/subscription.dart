import 'dart:async';

import 'package:dart_nats/dart_nats.dart' as nats;
import 'package:dart_nats_streaming/src/data_message.dart';
import 'package:dart_nats_streaming/src/protocol.dart';
import 'package:logging/logging.dart';

class Subscription {
  static final _logger = Logger('Subscription');
  final nats.Subscription subscription;
  final List<void Function(DataMessage dataMessage)> _listeners = [];

  List<void Function(DataMessage dataMessage)> get listeners => _listeners;

  String get subject => subscriptionRequest.subject;
  final String ackInbox;
  int redeliveryCounter = 0;
  int maxInFlight = 1;

  Stream<DataMessage>? _stream;

  final SubscriptionRequest subscriptionRequest;

  Stream<DataMessage> get stream => _stream ??=
      subscription.stream!.transform(_protoTransformer).asBroadcastStream();

  Subscription(
      {required this.subscriptionRequest,
      required this.subscription,
      required this.ackInbox});

  StreamSubscription<DataMessage> listen(
      void Function(DataMessage dataMessage) onData,
      {Function? onError,
      void Function()? onDone,
      bool? cancelOnError}) {
    var listener = stream.listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
    _listeners.add(onData);

    return listener;
  }

  final StreamTransformer<nats.Message, DataMessage> _protoTransformer =
      StreamTransformer.fromHandlers(
    handleData: (nats.Message message, EventSink<DataMessage> sink) {
      var messageProto = MsgProto.fromBuffer(message.data);
      var stanMessage = DataMessage.fromProto(messageProto);

      _logger.info(
          'Subject: [${stanMessage.subject}] Sequence: [${stanMessage.sequence}] isRedelivery: [${stanMessage.isRedelivery}]');

      sink.add(stanMessage);
    },
  );
}
