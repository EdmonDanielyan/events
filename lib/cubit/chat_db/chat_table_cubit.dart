import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_state.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/setup.dart';

@singleton
class ChatDatabaseCubit extends Cubit<ChatDatabaseCubitState> {
  ChatDatabaseCubit()
      : super(ChatDatabaseCubitState(db: sl<ChatDatabase>()));

  void setSelectedChat(ChatTable chat) {
    emit(state.copyWith(selectedChat: chat));
  }

  void updateSearch(String value) {
    emit(state.copyWith(searchValue: value));
  }

  ChatDatabase get db => state.db;
  String get searchVal => state.searchValue;
  ChatTable? get selectedChat => state.selectedChat;
  Future<List<MessageWithUser>> getSelectedChatMessagesWithUser() async {
    List<MessageWithUser> messages = [];
    if (selectedChat != null) {
      messages = await db.getChatMessages(selectedChat!.id);
    }

    return messages;
  }

  String get getSelectedChatId => selectedChat != null ? selectedChat!.id : "";
}
