import 'dart:convert';

import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

abstract class Listener {
  String get event;
  void handler(dynamic data);

  MessengerProvider get messengerProvider => getIt<MessengerProvider>();
  CachedChatsCubit get chatsCubit => getIt<CachedChatsCubit>();

  Set<Function(dynamic)> triggers = {};

  void emitTrigger(dynamic data) {
    if (triggers.isNotEmpty) {
      for (final trigger in triggers) {
        trigger(data);
      }
    }
  }

  String fromBytes(dynamic data) {
    try {
      final converted = convertType(data);
      return utf8.decode(converted);
    } catch (_) {
      return "";
    }
  }

  List<int> convertType(dynamic data) {
    if (data is List<dynamic>) {
      return data.cast();
    }

    return data;
  }

  List<int> toBytes(String object) {
    return utf8.encode(object);
  }
}
