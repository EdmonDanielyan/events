import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_messages/hidden_messages_cubit.dart';

import '../../../model/chat.dart';
import '../chat_users_picker/chat_users_picker_cubit.dart';
import 'hidden_chats_state.dart';

@singleton
class HiddenChatsCubit extends HydratedCubit<HiddenChatsState> {
  final HiddenMessagesCubit hiddenMessagesCubit;
  HiddenChatsCubit(this.hiddenMessagesCubit)
      : super(const HiddenChatsState(chatIds: {}));

  void add(int chatId) {
    final newChatIds = Set<int>.from(state.chatIds)..add(chatId);
    emit(state.copyWith(chatIds: newChatIds));
  }

  void remove(int chatId) {
    final newChatIds = Set<int>.from(state.chatIds)..remove(chatId);
    emit(state.copyWith(chatIds: newChatIds));
  }

  List<Chat> filterChats(List<Chat> chats) {
    final filtered = List<Chat>.from(
        chats.where((element) => !state.chatIds.contains(element.id)).toList());

    List<Chat> newChats = [];

    if (filtered.isNotEmpty) {
      for (final chat in filtered) {
        newChats.add(
            chat.copyWith(messages: hiddenMessagesCubit.filter(chat.messages)));
      }
    }

    return newChats;
  }

  @override
  HiddenChatsState? fromJson(Map<String, dynamic> json) =>
      HiddenChatsState.fromMap(json);
  @override
  Map<String, dynamic>? toJson(HiddenChatsState state) => state.toMap();

  @override
  String get id => CHATS_UNIQUE_KEY;
}
