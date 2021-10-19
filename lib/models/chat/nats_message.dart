import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:messagepack/messagepack.dart';
import 'package:uuid/uuid.dart';

// https://pub.dev/packages/messagepack/example
abstract class Message {
  abstract String id;
  abstract MessageType type;
  abstract DateTime createdAt;
  abstract bool needAck;
  abstract String from;
  abstract String to;

  List<int> toBytes();
}

class BaseMessage extends Message {
  late String id;
  late MessageType type;
  late DateTime createdAt;
  late bool needAck;
  late String from;
  late String to;
  late Packer _packer;

  BaseMessage(id, type, needAck, createdAt, from, to) {
    this.type = type ?? MessageType.base;
    this.id = id ?? Uuid().v4() + '-' + describeEnum(type);
    this.needAck = needAck ?? true;
    this.createdAt = createdAt ?? DateTime.now();
    this.from = from ?? "";
    this.to = to ?? "";
  }

  Packer packer() {
    _packer = Packer();
    _packer.packString(id);
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
    return '{id: $id, type: $type, createdAt: $createdAt, needAck: $needAck, from: $from, to: $to}';
  }
}

class SystemPayload {
  final SystemMessageType action;
  final Map<String, String> data;

  SystemPayload(this.action, this.data);

  void pack(Packer packer){
    packer.packString(describeEnum(action));
    packer.packMapLength(data.length);
    data.forEach((key, value) {
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
    return new SystemPayload(action.toSystemMessageType(), data);
  }

  @override
  String toString() {
    return '{action: $action, data: $data}';
  }
}

class NatsMessage extends BaseMessage {
  late Object? payload = "";

  NatsMessage({id, type, needAck, createdAt, from, to})
      : super(id, type, needAck, createdAt, from, to);

  void setPayload(String payload) {
    this.type = MessageType.message;
    this.payload = payload;
    super.packer().packString(payload);
  }

  void setBinaryPayload(List<int> payload) {
    this.type = MessageType.binary;
    this.payload = payload;
    super.packer().packBinary(payload);
  }

  void setSystemPayload(action, data) {
    this.type = MessageType.system;
    this.payload = new SystemPayload(action, data);
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
    NatsMessage message = new NatsMessage();
    message.id = unpacker.unpackString()!;
    message.type = unpacker.unpackString()!.toMessageType();
    message.createdAt = DateTime.parse(unpacker.unpackString()!);
    message.needAck = unpacker.unpackBool()!;
    message.from = unpacker.unpackString()!;
    message.to = unpacker.unpackString()!;
    if (message.type == MessageType.system) {
      message.payload = SystemPayload.fromUnpacker(unpacker);
    } else {
      message.payload = message.type == MessageType.binary
          ? unpacker.unpackBinary()
          : unpacker.unpackString();
    }
    return message;
  }

  @override
  String toString() {
    return '${super.toString()}, payload: $payload';
  }
}
