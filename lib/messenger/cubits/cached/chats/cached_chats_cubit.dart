import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_chats/hidden_chats_cubit.dart';
import 'package:ink_mobile/setup.dart';
import '../../../model/chat.dart';
import '../../../model/message.dart';
import '../../../model/user.dart';
import '../chat_users_picker/chat_users_picker_cubit.dart';
import 'cached_chats_state.dart';
import 'package:collection/collection.dart';

@singleton
class CachedChatsCubit extends HydratedCubit<CachedChatsState> {
  CachedChatsCubit() : super(const CachedChatsState(me: User()));

  List<Chat> get chats => state.chats;
  List<Chat> get selectedChats => state.selectedChats;
  User get me => state.me;
  int get myId => state.me.id;

  List<Chat> visibleChats = [];

  void clearSelectedOf(int id) {
    final newChats = List<Chat>.from(selectedChats)
      ..removeWhere((element) => element.id == id);

    emit(state.copyWith(selectedChats: newChats));
  }

  void toSet() {
    if (chats.isNotEmpty) {
      final _chatIds = Set<int>();
      List<Chat> newChats = [];
      for (final chat in chats) {
        if (!_chatIds.contains(chat.id)) {
          newChats.add(chat);
        }
        _chatIds.add(chat.id);
      }

      _updateChats(newChats);
    }
  }

  void fixChats() {
    for (final chat in chats) {
      if (chat.isSingle && chat.ownerId == 0) {
        updateChatById(
            chat.copyWith(ownerId: chat.getFirstNotMyId(myId)), chat.id);
      }
    }
  }

  Chat? getChatById(int id) {
    return chats.firstWhereOrNull((element) => element.id == id);
  }

  Message? getMessageByIdFromChat(int messageId, int chatId) {
    final chat = getChatById(chatId);

    if (chat != null) {
      return chat.messages
          .firstWhereOrNull((element) => element.id == messageId);
    }

    return null;
  }

  void selectChatById(int id) {
    final chat = chats.firstWhereOrNull((element) => element.id == id);

    if (chat != null) {
      List<Chat> newChats = [];
      newChats.add(chat);
      emit(state.copyWith(selectedChats: newChats));
    }
  }

  void updateMe(User user) {
    emit(state.copyWith(me: user));
  }

  void clean() {
    List<Chat> newChats = [];
    emit(state.copyWith(
      chats: newChats,
      selectedChats: newChats,
    ));
  }

  void addChats(List<Chat> items) {
    final newChats = List<Chat>.from(chats)..addAll(items);
    emit(state.copyWith(chats: newChats));
    toSet();
  }

  void removeChatById(int id) {
    final newChats = List<Chat>.from(chats)
      ..removeWhere((element) => element.id == id);
    emit(state.copyWith(chats: newChats));
  }

  void updateChatById(Chat item, int id) {
    _updateChats(_updateChatById(item, id, chats));
    _updateSelectedChats(_updateChatById(item, id, selectedChats));
  }

  List<Chat> _updateChatById(Chat item, int id, List<Chat> chats) {
    List<Chat> newChats = [];
    for (final chat in chats) {
      if (chat.id == id) {
        newChats.add(item);
      } else {
        newChats.add(chat);
      }
    }

    return newChats;
  }

  void addMessagesToChatById(List<Message> messages, int chatId,
      {bool after = true}) {
    _updateChats(List.from([])
      ..addAll(_addMessagesToChatsById(messages.toSet().toList(), chatId, chats,
          after: after)));
    _updateSelectedChats(List.from([])
      ..addAll(_addMessagesToChatsById(
          messages.toSet().toList(), chatId, selectedChats,
          after: after)));
  }

  List<Chat> _addMessagesToChatsById(
      List<Message> messages, int chatId, List<Chat> storedChats,
      {bool after = true}) {
    List<Chat> newChats = [];

    if (storedChats.isNotEmpty) {
      for (final chat in storedChats) {
        if (chat.id == chatId) {
          final newMessages = after
              ? (List<Message>.from(chat.messages)..addAll(messages))
              : (List<Message>.from(messages)..addAll(chat.messages));

          newChats.add(
            chat.copyWith(
              messages: newMessages.toSet().toList(),
              updatedAt: DateTime.now(),
            ),
          );
        } else {
          newChats.add(chat);
        }
      }
    }

    return newChats;
  }

  void _updateChats(List<Chat> chats) {
    emit(state.copyWith(chats: chats));
  }

  void _updateSelectedChats(List<Chat> chats) {
    emit(state.copyWith(selectedChats: chats));
  }

  void cleanChat(int id) {
    final currentChats = List<Chat>.from(chats);
    final chat = currentChats.firstWhereOrNull((element) => element.id == id);
    if (chat != null) {
      currentChats.removeWhere((element) => element.id == id);
      currentChats.add(chat.copyWith(messages: [], updatedAt: DateTime.now()));
      emit(state.copyWith(chats: currentChats));
    }
  }

  List<Chat> searchChats(String query) {
    query = query.toLowerCase();
    List<Chat> searchedChats = [];

    for (var chat in chats) {
      final nameContains = chat.name.toLowerCase().contains(query);
      final descriptionContains =
          chat.description.toLowerCase().contains(query);

      final messageContains = chat.messages.indexWhere(
        (element) => element.body.toLowerCase().contains(query),
      );

      if (messageContains >= 0) {
        chat = chat.copyWith(messages: [chat.messages[messageContains]]);
      }

      if (nameContains || descriptionContains || messageContains >= 0) {
        searchedChats.add(chat);
      }
    }

    return searchedChats;
  }

  List<Message> searchMessages(String query, List<Message> messages) {
    query = query.toLowerCase();

    return messages
        .where(
          (element) =>
              element.body.toLowerCase().contains(query) ||
              element.owner.name.toLowerCase().contains(query),
        )
        .toList();
  }

  Chat? singleChatExists(List<User> users) {
    return chats.firstWhereOrNull((element) {
      final elementIds = element.participants.map((e) => e.id).toList();
      final usersIds = users.map((e) => e.id).toList();

      elementIds.sort((a, b) => a.compareTo(b));
      usersIds.sort((a, b) => a.compareTo(b));

      return element.isSingle && elementIds.join("_") == usersIds.join("_");
    });
  }

  int notReadMsgsOfChat(int chatId) {
    final chat = getChatById(chatId);

    if (chat != null) {
      return _getNotReadMessagesOfChat(chat);
    }

    return 0;
  }

  int notReadMsgsOfAllChats() {
    int messages = 0;

    List<Chat> _checkChats = visibleChats.isNotEmpty
        ? visibleChats
        : getIt<HiddenChatsCubit>().filterChats(chats);

    for (final chat in _checkChats) {
      messages += _getNotReadMessagesOfChat(chat);
    }

    return messages;
  }

  int _getNotReadMessagesOfChat(Chat chat) {
    return chat.messages.fold(0, (previousValue, element) {
      return previousValue + (!element.isReadByMe(myId) ? 1 : 0);
    });
  }

  List<User> getAllParticipants() {
    List<User> _users = [];

    for (final chat in chats) {
      _users.addAll(chat.participants);
    }

    return _users;
  }

  List<Message> getNotSentMessages() {
    List<Message> _items = [];

    for (final chat in chats) {
      if (chat.messages.isNotEmpty) {
        final messages = chat.messages
            .where((element) =>
                element.status != MessageStatus.sent &&
                element.isByMe(myId) &&
                !element.isReadByOthers)
            .toList();
        _items.addAll(messages);
      }
    }

    return _items;
  }

  void updateMessage(Message message, int messageId, int chatId) {
    final chat = getChatById(chatId);

    if (chat != null) {
      final msgIndex =
          chat.messages.lastIndexWhere((element) => element.id == messageId);

      if (msgIndex >= 0) {
        chat.messages[msgIndex] = message;
      }

      updateChatById(chat, chat.id);
    }
  }

  void updateMessagesByChatId(List<Message> messages, int chatId) {
    final chat = getChatById(chatId);

    if (chat != null) {
      for (final msg in messages) {
        final msgIndex =
            chat.messages.lastIndexWhere((element) => element.id == msg.id);

        if (msgIndex >= 0) {
          chat.messages[msgIndex] = msg;
        } else {
          chat.messages.add(msg);
        }
      }

      updateChatById(chat, chat.id);
    }
  }

  void updateChats(List<Chat> newChats) {
    if (newChats.isNotEmpty) {
      for (final chat in newChats) {
        final storedChat = getChatById(chat.id);

        if (storedChat != null) {
          if (!storedChat.isSingle) {
            updateChatById(
              chat.copyWith(
                messages: List<Message>.from(storedChat.messages),
              ),
              storedChat.id,
            );
          }
          updateMessagesByChatId(chat.messages, chat.id);
        }
      }
    }
  }

  void updateFetchedChats(List<Chat> fetchedChats) {
    if (fetchedChats.isNotEmpty) {
      List<Chat> _newChats = [];
      List<Chat> _updateChats = [];
      for (final fetchedChat in fetchedChats) {
        final storedChat = getChatById(fetchedChat.id);
        if (storedChat == null) {
          _newChats.add(fetchedChat);
        } else {
          _updateChats.add(fetchedChat);
        }
      }

      addChats(_newChats);
      updateChats(_updateChats);
    }
  }

  void updateFetchedMessages(List<Message> messages, int chatId) {
    if (messages.isNotEmpty) {
      List<Message> newMessages = [];
      List<Message> updateMessages = [];
      for (final message in messages) {
        final storedMessage = getMessageByIdFromChat(message.id, chatId);

        if (storedMessage == null) {
          newMessages.add(message);
        } else {
          updateMessages.add(message);
        }
      }

      addMessagesToChatById(newMessages, chatId, after: false);
      updateMessagesByChatId(updateMessages, chatId);
    }
  }

  List<Chat> notExistsingChats(List<int> chatIds) {
    List<Chat> chats = [];

    return chats;
  }

  void setVisibleChats(List<Chat> chats) {
    visibleChats = List<Chat>.from(chats);
  }

  void leaveOnlyChatsWithids(List<int> ids) {
    if (chats.isNotEmpty && ids.isNotEmpty) {
      for (final chat in chats) {
        final index = ids.lastIndexWhere((element) => element == chat.id);

        if (index < 0) {
          removeChatById(chat.id);
        }
      }
    }
  }

  @override
  CachedChatsState? fromJson(Map<String, dynamic> json) =>
      CachedChatsState.fromMap(json);
  @override
  Map<String, dynamic>? toJson(CachedChatsState state) => state.toMap();

  @override
  String get id => CHATS_UNIQUE_KEY;
}
