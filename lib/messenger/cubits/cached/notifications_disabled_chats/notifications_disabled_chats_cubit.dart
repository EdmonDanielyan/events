import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import 'notifications_disabled_chats_state.dart';

@singleton
class NotificationsDisabledChatsCubit
    extends HydratedCubit<NotificationsDisabledChatsState> {
  NotificationsDisabledChatsCubit()
      : super(const NotificationsDisabledChatsState(chatIds: {}));

  void add(int chatId) {
    final newChatIds = Set<int>.from(state.chatIds)..add(chatId);
    emit(state.copyWith(chatIds: newChatIds));
  }

  void remove(int chatId) {
    final newChatIds = Set<int>.from(state.chatIds)..remove(chatId);
    emit(state.copyWith(chatIds: newChatIds));
  }

  bool contains(int chatId) {
    return state.chatIds.contains(chatId);
  }

  @override
  NotificationsDisabledChatsState? fromJson(Map<String, dynamic> json) =>
      NotificationsDisabledChatsState.fromMap(json);
  @override
  Map<String, dynamic>? toJson(NotificationsDisabledChatsState state) =>
      state.toMap();
}
