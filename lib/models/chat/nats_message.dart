import 'dart:typed_data';

import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:messagepack/messagepack.dart';
import 'package:uuid/uuid.dart';

// https://pub.dev/packages/messagepack/example
abstract class Message {
  abstract String id;
  abstract MessageType type;
  abstract String createdAt;
  abstract bool needAck;
  abstract String from;
  abstract String to;

  List<int> toBytes();
}

class BaseMessage extends Message {
  late String id;
  late MessageType type;
  late String createdAt;
  late bool needAck;
  late String from;
  late String to;

  BaseMessage(id, type, needAck, createdAt, from, to) {
    this.id = id ?? Uuid().v4();
    this.type = type ?? MessageType.base;
    this.needAck = needAck ?? false;
    this.createdAt = createdAt ?? DateTime.now().toString();
    this.from = from;
    this.to = to;
  }

  Packer packer() {
    final packer = Packer();
    packer.packString(id);
    packer.packString(type.toString());
    packer.packString(createdAt);
    packer.packBool(needAck);
    packer.packString(from);
    packer.packString(to);
    return packer;
  }

  @override
  List<int> toBytes() {
    return packer().takeBytes();
  }

  @override
  String toString() {
    return '{id: $id, type: $type, createdAt: $createdAt, needAck: $needAck, from: $from, to: $to}';
  }
}

class SystemPayload {
  final SystemMessageType action;
  final Map<String, String> data;

  SystemPayload(this.action, this.data);
}

class NatsMessage extends BaseMessage {
  late Object? payload;

  NatsMessage({id, type, needAck, createdAt, from, to})
      : super(id, type, needAck, createdAt, from, to);

  void setPayload(String payload) {
    super.packer().packString(payload);
    this.type = MessageType.simple;
    this.payload = payload;
  }

  void setBinaryPayload(List<int> payload) {
    super.packer().packBinary(payload);
    this.type = MessageType.binary;
    this.payload = payload;
  }

  void setSystemPayload(action, data) {
    var packer = super.packer();
    packer.packString(action.toString());
    packer.packMapLength(data.length);
    data.forEach((key, value) {
      packer.packString(key);
      packer.packString(value);
    });
    this.type = MessageType.system;
    this.payload = payload;
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
    NatsMessage message = new NatsMessage();
    message.id = unpacker.unpackString()!;
    message.type = unpacker.unpackString()!.toMessageType();
    message.needAck = unpacker.unpackBool()!;
    message.createdAt = unpacker.unpackString()!;
    message.from = unpacker.unpackString()!;
    message.to = unpacker.unpackString()!;
    if (message.type == MessageType.system) {
      final action = unpacker.unpackString()!;
      final dataMapLength = unpacker.unpackMapLength();
      Map<String, String> data = {};
      for (int i = 0; i < dataMapLength; i++) {
        data[unpacker.unpackString()!] = unpacker.unpackString()!;
      }
      message.payload = new SystemPayload(action.toSystemMessageType(), data);
    } else {
      message.payload = message.type == MessageType.binary
          ? unpacker.unpackBinary()
          : unpacker.unpackString();
    }
    return message;
  }

  @override
  String toString() {
    return '${super.toString()}, payload: $payload}';
  }
}
