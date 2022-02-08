import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_list/search_chat_state.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat_list_view.dart';
import 'package:collection/collection.dart';

@injectable
class SearchChatCubit extends Cubit<SearchChatState> {
  SearchChatCubit() : super(SearchChatState(chats: [], searchChats: []));

  Set<MessageTable>? searchMessage;

  List<MessageTable> messages = [];

  Future<void> emitChats(List<ChatTable> chats) async {
    emit(state.copyWith(chats: chats, searchChats: chats));
  }

  void setSearchValue(String value,
      {ChatDatabaseCubit? chatDatabaseCubit}) async {
    searchMessage = null;
    value = value.toLowerCase().trim();
    List<ChatTable> items = ChatListView.searchChats(value, state.chats);

    if (chatDatabaseCubit != null) {
      searchMessage = {};
      for (final chat in state.chats) {
        final findMessage = await chatDatabaseCubit.db
            .searchMessageByTextAndChatId(value, chat.id);

        if (findMessage != null) {
          searchMessage!.add(findMessage);
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
