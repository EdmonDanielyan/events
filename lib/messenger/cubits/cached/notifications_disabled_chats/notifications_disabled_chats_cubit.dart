import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/cubits/cached/notifications_disabled_chats/network.dart';
import 'package:ink_mobile/models/token.dart';

import '../chat_users_picker/chat_users_picker_cubit.dart';
import 'notifications_disabled_chats_state.dart';

@singleton
class ToggleNotificationsChatsCubit
    extends HydratedCubit<NotificationsDisabledChatsState> {
  ToggleNotificationsChatsCubit()
      : super(const NotificationsDisabledChatsState(chatIds: {}));

  Future<void> toggleNotification(int chatId, bool disableValue) async {
    await Token.setNewTokensIfExpired();
    Set<int> observingChats = Set<int>.from(state.chatIds);
    disableValue ? observingChats.remove(chatId) : observingChats.add(chatId);
    ToggleNotificationsChatNetworkRequest(
        chatID: chatId.toString(), value: disableValue)();
    emit(state.copyWith(chatIds: observingChats));
  }

  bool isChatNotificationsEnabled(int chatId) => state.chatIds.contains(chatId);


  @override
  NotificationsDisabledChatsState? fromJson(Map<String, dynamic> json) =>
      NotificationsDisabledChatsState.fromMap(json);
  @override
  Map<String, dynamic>? toJson(NotificationsDisabledChatsState state) =>
      state.toMap();

  @override
  String get id => CHATS_UNIQUE_KEY;
}
