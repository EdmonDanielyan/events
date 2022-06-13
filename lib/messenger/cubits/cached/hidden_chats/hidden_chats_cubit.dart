import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../model/chat.dart';
import 'hidden_chats_state.dart';

@singleton
class HiddenChatsCubit extends HydratedCubit<HiddenChatsState> {
  HiddenChatsCubit() : super(const HiddenChatsState(chatIds: {}));

  void add(int chatId) {
    final newChatIds = Set<int>.from(state.chatIds)..add(chatId);
    emit(state.copyWith(chatIds: newChatIds));
  }

  void remove(int chatId) {
    final newChatIds = Set<int>.from(state.chatIds)..remove(chatId);
    emit(state.copyWith(chatIds: newChatIds));
  }

  List<Chat> filterChats(List<Chat> chats) {
    return chats
        .where((element) => !state.chatIds.contains(element.id))
        .toList();
  }

  @override
  HiddenChatsState? fromJson(Map<String, dynamic> json) =>
      HiddenChatsState.fromMap(json);
  @override
  Map<String, dynamic>? toJson(HiddenChatsState state) => state.toMap();
}
