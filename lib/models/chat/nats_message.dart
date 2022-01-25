import 'dart:convert';
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
  abstract String from;
  abstract String to;

  List<int> toBytes();
}

class BaseMessage extends Message {
  late DateTime createdAt;
  late String id;
  late PayloadType type;
  late String from;
  late String to;
  late Packer _packer;
  late Int64 sequence;

  BaseMessage({id, type, createdAt, from, to}) {
    this.type = type ?? PayloadType.empty;
    this.id = id ?? Uuid().v4();
    this.createdAt = (createdAt ?? DateTime.now()).toUtc();
    this.from = from ?? "";
    this.to = to ?? "";
    this.sequence = Int64.ZERO;
  }

  Packer packer() {
    _packer = Packer();
    _packer.packString(id);
    var messageType = '-' + describeEnum(this.type);
    this.id += messageType;
    _packer.packString(describeEnum(type));
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
    return '{id: $id, type: $type, from: $from, to: $to, sequence: $sequence, createdAt: $createdAt}';
  }
}

class Payload {
  final MessageType type;
  Payload(this.type);
}

class SystemPayload extends Payload {
  final Map<String, String> fields;

  SystemPayload(type, this.fields): super(type);

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

class JsonPayload extends Payload {
  final Map<String, dynamic> json;

  JsonPayload(type, this.json): super(type);

  void pack(Packer packer) {
    packer.packString(describeEnum(type));
    packer.packString(jsonEncode(json));
  }

  static JsonPayload fromUnpacker(Unpacker unpacker) {
    var type = unpacker.unpackString()!;
    var json = unpacker.unpackString()!;
    return JsonPayload(type.toMessageType(), jsonDecode(json));
  }

  @override
  String toString() {
    return '{type: $type, json: $json}';
  }
}

class NatsMessage extends BaseMessage {
  late Object? payload = "";

  NatsMessage({id, type, from, to, createdAt})
      : super(id: id, type: type, from: from, to: to, createdAt: createdAt);

  void setEmptyPayload() {
    this.type = PayloadType.empty;
    super.packer();
  }

  void setMessagePayload(String payload) {
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

  void setJsonPayload(MessageType messageType, Map<String, dynamic> json) {
    this.type = PayloadType.json;
    this.payload = JsonPayload(messageType, json);
    (this.payload as JsonPayload).pack(super.packer());
  }

  String getMessagePayload() {
    return this.payload as String;
  }

  Uint8List getBinaryPayload() {
    return this.payload as Uint8List;
  }

  SystemPayload getSystemPayload() {
    return this.payload as SystemPayload;
  }

  JsonPayload getJsonPayload() {
    return this.payload as JsonPayload;
  }

  static NatsMessage fromBytes(Uint8List bytes) {
    final unpacker = Unpacker(bytes);
    NatsMessage message = NatsMessage();
    message.id = unpacker.unpackString()!;
    message.type = unpacker.unpackString()!.toPayloadType();

    switch (message.type) {
      case (PayloadType.system):
        //Skip old
        unpacker.unpackString();
        //Skip old
        unpacker.unpackBool();
        message.from = unpacker.unpackString()!;
        message.to = unpacker.unpackString()!;
        message.payload = SystemPayload.fromUnpacker(unpacker);
        break;
      case PayloadType.empty:
        message.from = unpacker.unpackString()!;
        message.to = unpacker.unpackString()!;
        break;
      case PayloadType.message:
        //Skip old
        unpacker.unpackString();
        //Skip old
        unpacker.unpackBool();
        message.from = unpacker.unpackString()!;
        message.to = unpacker.unpackString()!;
        message.payload = unpacker.unpackString();
        break;
      case PayloadType.document:
        message.from = unpacker.unpackString()!;
        message.to = unpacker.unpackString()!;
        message.payload = unpacker.unpackBinary();
        break;
      case PayloadType.json:
        message.from = unpacker.unpackString()!;
        message.to = unpacker.unpackString()!;
        message.payload = JsonPayload.fromUnpacker(unpacker);
        break;
    }
    return message;
  }

  @override
  String toString() {
    return '${super.toString()}, payload: ${payload ?? payload.toString()}';
  }
}
