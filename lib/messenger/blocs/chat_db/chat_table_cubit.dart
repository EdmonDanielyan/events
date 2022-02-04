import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_state.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';

@lazySingleton
class ChatDatabaseCubit extends Cubit<ChatDatabaseCubitState> {
  ChatDatabaseCubit(ChatDatabase db) : super(ChatDatabaseCubitState(db: db));

  int _loadingChats = 0;

  void setLoadingChats(bool loading) {
    emit(state.copyWith(loadingChats: loading));
  }

  void setLoadingChatsCounter(int chats) {
    _loadingChats = chats;
  }

  void setSelectedChat(ChatTable? chat) {
    emit(state.copyWithSelectedChat(selectedChat: chat));
  }

  void setDeletedChat(bool deletedChat) {
    emit(state.copyWith(deletedChat: deletedChat));
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
  int get currentLoadingChatsCounter => _loadingChats;
}
