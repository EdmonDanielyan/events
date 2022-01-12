import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_state.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';

@injectable
class ChatListCubit extends Cubit<ChatListState> {
  ChatListCubit() : super(ChatListState(chats: [], searchChats: []));

  void emitChats(List<ChatTable> chats) {
    emit(state.copyWith(chats: chats, searchChats: chats));
  }

  void setSearchValue(String value,
      {ChatDatabaseCubit? chatDatabaseCubit}) async {
    value = value.trim();
    List<ChatTable> items = ChatListView.searchChats(value, state.chats);

    if (chatDatabaseCubit != null) {
      for (final chat in state.chats) {
        final searchMessage = await chatDatabaseCubit.db
            .searchMessageByTextAndChatId(value, chat.id);

        if (searchMessage != null) {
          items.add(chat);
        }
      }
    }

    _emitSearchList(items.toSet().toList(), value);
  }

  void _emitSearchList(List<ChatTable> items, String value) {
    emit(state.copyWith(searchChats: items, searchValue: value));
  }
}
