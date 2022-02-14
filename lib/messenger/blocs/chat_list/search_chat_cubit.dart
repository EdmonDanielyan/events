import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_list/search_chat_state.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat_list_view.dart';
import 'package:ink_mobile/messenger/models/chat_with_message.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';

@injectable
class SearchChatCubit extends Cubit<SearchChatState> {
  SearchChatCubit() : super(SearchChatState(chats: [], searchChats: []));

  Set<MessageTable>? searchMessage;
  Set<ChatWithMessage>? _chatWithMessageList;

  void addChatWithMessage(ChatTable chat, MessageTable message) {
    if (_chatWithMessageList != null) {
      _chatWithMessageList!
          .removeWhere((element) => element.chat.id == chat.id);
      _chatWithMessageList!.add(ChatWithMessage(chat: chat, message: message));
    }
  }

  Future<void> _setChatWithMessages(
      List<ChatTable> chats, Messenger messenger) async {
    for (final chat in chats) {
      final msg = await messenger.chatDatabaseCubit.db
          .selectMessageByChatIdInSeqOrder(chat.id);

      if (msg != null && msg.timestamp != null) {
        if (chat.updatedAt.isBefore(msg.timestamp!)) {
          await messenger.chatFunctions
              .setChatToFirst(chat, updatedAt: msg.timestamp);
        }
        addChatWithMessage(chat, msg);
      }
    }
  }

  Future<void> emitChats(List<ChatTable> chats,
      {bool sort = true, Messenger? messenger}) async {
    if (sort) {
      if (_chatWithMessageList == null && messenger != null) {
        _chatWithMessageList = {};
        await _setChatWithMessages(chats, messenger);
      }
      chats.sort((a, b) {
        DateTime compareA = a.updatedAt;
        DateTime compareB = b.updatedAt;

        return compareB.compareTo(compareA);
      });
    }

    emit(state.copyWith(chats: chats, searchChats: chats));
  }

  // Future<void> emitChats(List<ChatWithMessage> chatsWithMessage,
  //     {bool sort = true}) async {
  //   if (sort) {
  //     chatsWithMessage.sort((a, b) {
  //       DateTime compareA =
  //           a.message?.timestamp ?? (a.chat?.updatedAt ?? DateTime.now());
  //       DateTime compareB =
  //           b.message?.timestamp ?? (b.chat?.updatedAt ?? DateTime.now());

  //       return compareB.compareTo(compareA);
  //     });
  //   }
  //   List<ChatTable> chats = chatsWithMessage.map((e) => e.chat!).toList();

  //   emit(state.copyWith(chats: chats, searchChats: chats));
  // }

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
