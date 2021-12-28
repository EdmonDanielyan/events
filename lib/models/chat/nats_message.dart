import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:messagepack/messagepack.dart';
import 'package:uuid/uuid.dart';

//////////////////////////////// NATS Protocol ///////////////////////////////
abstract class Message {
  abstract String id;
  abstract PayloadType type;
  abstract DateTime createdAt;
  abstract bool needAck;
  abstract String from;
  abstract String to;

  List<int> toBytes();
}

class BaseMessage extends Message {
  late String id;
  late PayloadType type;
  late DateTime createdAt;
  late bool needAck;
  late String from;
  late String to;
  late Packer _packer;
  late Int64 sequence;

  BaseMessage(id, type, needAck, createdAt, from, to) {
    this.type = type ?? PayloadType.empty;
    this.id = id ?? Uuid().v4();
    this.needAck = needAck ?? true;
    this.createdAt = (createdAt ?? DateTime.now()).toUtc();
    this.from = from ?? "";
    this.to = to ?? "";
    this.sequence = Int64.ZERO;

    print('''

      CREATED AT ${this.createdAt};
    
    ''');
  }

  Packer packer() {
    _packer = Packer();
    _packer.packString(id);
    var messageType = '-' + describeEnum(this.type);
    this.id += messageType;
    _packer.packString(describeEnum(type));
    _packer.packString(createdAt.toString());
    _packer.packBool(needAck);
    _packer.packString(from);
    _packer.packString(to);
    return _packer;
  }

  @override
  List<int> toBytes() {
    return _packer.takeBytes();
  }

  @override
  String toString() {
    return '{id: $id, type: $type, createdAt: $createdAt, needAck: $needAck, from: $from, to: $to, sequence: $sequence}';
  }
}

class SystemPayload {
  final MessageType type;
  final Map<String, String> fields;

  SystemPayload(this.type, this.fields);

  void pack(Packer packer) {
    packer.packString(describeEnum(type));
    packer.packMapLength(fields.length);
    fields.forEach((key, value) {
      packer.packString(key);
      packer.packString(value);
    });
  }

  static SystemPayload fromUnpacker(Unpacker unpacker) {
    final action = unpacker.unpackString()!;

    final dataMapLength = unpacker.unpackMapLength();
    Map<String, String> data = {};
    for (int i = 0; i < dataMapLength; i++) {
      data[unpacker.unpackString()!] = unpacker.unpackString()!;
    }
    return SystemPayload(action.toMessageType(), data);
  }

  @override
  String toString() {
    return '{type: $type, fields: $fields}';
  }
}

class NatsMessage extends BaseMessage {
  late Object? payload = "";

  NatsMessage({id, type, needAck, createdAt, from, to})
      : super(id, type, needAck, createdAt, from, to);

  void setPayload(String payload) {
    this.type = PayloadType.message;
    this.payload = payload;
    super.packer().packString(payload);
  }

  void setBinaryPayload(List<int> payload) {
    this.type = PayloadType.document;
    this.payload = payload;
    super.packer().packBinary(payload);
  }

  void setSystemPayload(messageType, fields) {
    this.type = PayloadType.system;
    this.payload = SystemPayload(messageType, fields);
    (this.payload as SystemPayload).pack(super.packer());
  }

  String getPayload() {
    return this.payload as String;
  }

  Uint8List getBinaryPayload() {
    return this.payload as Uint8List;
  }

  SystemPayload getSystemPayload() {
    return this.payload as SystemPayload;
  }

  static NatsMessage fromBytes(Uint8List bytes) {
    final unpacker = Unpacker(bytes);
    NatsMessage message = NatsMessage();
    message.id = unpacker.unpackString()!;
    message.type = unpacker.unpackString()!.toPayloadType();
    message.createdAt = DateTime.parse(unpacker.unpackString()!);
    message.needAck = unpacker.unpackBool()!;
    message.from = unpacker.unpackString()!;
    message.to = unpacker.unpackString()!;

    if (message.type == PayloadType.system) {
      message.payload = SystemPayload.fromUnpacker(unpacker);
    } else {
      message.payload = message.type == PayloadType.document
          ? unpacker.unpackBinary()
          : unpacker.unpackString();
    }
    return message;
  }

  @override
  String toString() {
    return '${super.toString()}, payload: ${payload ?? payload.toString()}';
  }
}
