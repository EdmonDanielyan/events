import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_messages/hidden_messages_state.dart';
import 'package:ink_mobile/messenger/model/message.dart';

import '../chat_users_picker/chat_users_picker_cubit.dart';

@singleton
class HiddenMessagesCubit extends HydratedCubit<HiddenMessagesState> {
  HiddenMessagesCubit() : super(const HiddenMessagesState(messages: {}));

  void add(List<int> messageIds) {
    final newmessages = Set<int>.from(state.messages)..addAll(messageIds);
    emit(state.copyWith(messages: newmessages));
  }

  void remove(int messageId) {
    final newmessages = Set<int>.from(state.messages)..remove(messageId);
    emit(state.copyWith(messages: newmessages));
  }

  List<Message> filter(List<Message> messages) {
    return messages
        .where((element) => !state.messages.contains(element.id))
        .toList();
  }

  @override
  HiddenMessagesState? fromJson(Map<String, dynamic> json) =>
      HiddenMessagesState.fromMap(json);
  @override
  Map<String, dynamic>? toJson(HiddenMessagesState state) => state.toMap();

  @override
  String get id => CHATS_UNIQUE_KEY;
}
