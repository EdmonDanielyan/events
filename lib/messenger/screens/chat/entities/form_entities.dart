import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';

class ChatEntities {
  String text;
  String? repliedMessageId;
  List<File>? files;
  List<File>? picsVids;
  StoredMessageType type;

  ChatEntities({
    this.text = "",
    this.repliedMessageId,
    this.files,
    this.picsVids,
    this.type = StoredMessageType.TEXT,
  });

  void clear() {
    text = "";
    files = null;
    picsVids = null;
  }

  ChatEntities copyWith({
    String? text,
    String? repliedMessageId,
    List<File>? files,
    List<File>? picsVids,
    StoredMessageType? type,
    int? seq,
  }) {
    return ChatEntities(
      text: text ?? this.text,
      repliedMessageId: repliedMessageId ?? this.repliedMessageId,
      files: files ?? this.files,
      picsVids: picsVids ?? this.picsVids,
      type: type ?? this.type,
    );
  }

  @override
  String toString() {
    return 'ChatEntities(text: $text, repliedMessageId: $repliedMessageId, files: $files, picsVids: $picsVids, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatEntities &&
        other.text == text &&
        other.repliedMessageId == repliedMessageId &&
        listEquals(other.files, files) &&
        listEquals(other.picsVids, picsVids) &&
        other.type == type;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        repliedMessageId.hashCode ^
        files.hashCode ^
        picsVids.hashCode ^
        type.hashCode;
  }
}
