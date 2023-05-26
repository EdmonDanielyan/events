import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/constants/codes.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/grouped_list/grouped_list.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_state.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_messages/hidden_messages_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/app_state/app_state.dart';
import 'package:ink_mobile/messenger/cubits/custom/app_state/app_state_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/message_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/messages_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/search_select_cubit/search_select_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/search_select_cubit/search_select_state.dart';
import 'package:ink_mobile/messenger/functions/close_notification.dart';
import 'package:ink_mobile/messenger/functions/paginator.dart';
import 'package:ink_mobile/messenger/functions/scroll_indexes.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/messenger/screens/chat/components/app_bar.dart';
import 'package:ink_mobile/messenger/screens/chat/components/builder.dart';
import 'package:ink_mobile/messenger/screens/chat/components/date_separator.dart';
import 'package:ink_mobile/messenger/screens/chat/components/hidden_messages_builder.dart';
import 'package:ink_mobile/messenger/screens/chat/components/info_card.dart';
import 'package:ink_mobile/messenger/screens/chat/components/message_card.dart';
import 'package:ink_mobile/messenger/screens/chat/components/selected_messages_builder.dart';
import 'package:ink_mobile/setup.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../components/swipe_to.dart';
import 'components/bottom_card.dart';
import 'components/search_builder.dart';
import 'components/search_textfield.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:collection/collection.dart';

class ChatScreen extends StatefulWidget {
  final CachedChatsCubit cachedChatsCubit;
  final void Function(Message, Chat) onMessageSend;
  final void Function(BuildContext, Chat)? onAppBarClicked;
  final void Function(BuildContext, List<Message>, Chat)? onMessageDelete;
  final void Function(Message, Chat) onMessageEdit;
  final void Function(Message) readMessage;
  final OnlineCubit onlineCubit;
  final CachedUsersCubit cachedUsersCubit;
  const ChatScreen({
    Key? key,
    required this.cachedChatsCubit,
    required this.onMessageSend,
    this.onAppBarClicked,
    this.onMessageDelete,
    required this.onMessageEdit,
    required this.readMessage,
    required this.onlineCubit,
    required this.cachedUsersCubit,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with WidgetsBindingObserver {
  final searchMessagesCubit = SearchSelectCubit<Message>();
  final selectedMessages = MessagesCubit();
  final editingMessage = MessageCubit();
  final textEditingController = TextEditingController();
  final focusNode = FocusNode();
  final itemScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();
  final scrollIndexes = ScrollIndexes();
  final respondingMessage = MessageCubit();
  late final Paginator _paginator = Paginator(limit: 15, page: 0);
  final hiddenMessagesCubit = getIt<HiddenMessagesCubit>();
  final appState = getIt<AppStateCubit>();
  final refreshController = RefreshController(initialRefresh: false);

  Chat? selectedChat;

  Chat? get getSelectedChat => widget.cachedChatsCubit.selectedChats.isNotEmpty
      ? widget.cachedChatsCubit.selectedChats.last
      : null;

  Message? lastMessage;

  CachedChatsCubit get cachedChatsCubit => widget.cachedChatsCubit;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      appState.changeState(AppBackgroundState.foreground);
    } else {
      appState.changeState(AppBackgroundState.background);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    if (widget.cachedChatsCubit.selectedChats.isNotEmpty) {
      final selectedChat = widget.cachedChatsCubit.selectedChats.last;
      selectedChat.sortMessagesByTime();
      if (selectedChat.messages.isNotEmpty) {
        final lastReadMessage = selectedChat.messages.last;
        widget.readMessage(lastReadMessage);
      }
    }

    _loadMessages(showLoading: false);

    Future.delayed(Duration.zero, () {
      itemPositionsListener.itemPositions.addListener(() {
        final items = itemPositionsListener.itemPositions.value.toList();
        if (items.isNotEmpty) {
          final getFirstIndex = items.last.index + 1;

          if (_paginator.page == getFirstIndex) {
            _loadMessages();
          }
          if (items.first.itemLeadingEdge > 0.0) {
            if (getSelectedChat != null) {
              cachedChatsCubit.fetchMessages(
                chatID: getSelectedChat!.id,
                offset: _paginator.newMessagesOffset,
                callback: fetchNextPart,
                count: _paginator.limit,
              );
            }
          }
        }
      });
    });

    if (getSelectedChat != null) {
      selectedChat = getSelectedChat;
      CloseNotification(selectedChat!.id).call();
    }
  }

  void fetchNextPart(List<Message> fetchedMessages) {
    if (getSelectedChat != null) {
      Message? alreadyFetchedMessage = fetchedMessages
          .firstWhereOrNull((message) => message.id == lastMessage?.id);
      if (alreadyFetchedMessage == null && fetchedMessages.isNotEmpty) {
        _paginator.newMessagesOffset += _paginator.limit;
        cachedChatsCubit.fetchMessages(
          chatID: getSelectedChat!.id,
          offset: _paginator.newMessagesOffset,
          callback: fetchNextPart,
          count: _paginator.limit,
        );
      } else {
        lastMessage = getSelectedChat!.messages.last;
        _paginator.newMessagesOffset = 0;
      }
    }
  }

  Future<void> _loadMessages({bool showLoading = true}) async {
    final chat = getSelectedChat;
    if (chat != null && !_paginator.block) {
      _paginator.block = true;
      if (showLoading) {
        EasyLoading.show();
      }
      cachedChatsCubit.fetchMessages(
        chatID: chat.id,
        offset: _paginator.page,
        callback: (msgs) {
          _paginator.block = false;
          _paginator.page = _paginator.page + _paginator.limit;
          if (msgs.length < _paginator.limit) {
            _paginator.block = true;
          }
        },
        count: _paginator.limit,
      );
      EasyLoading.dismiss();
      lastMessage = getSelectedChat?.messages.last;
    }
  }

  @override
  void dispose() {
    if (selectedChat != null) {
      widget.cachedChatsCubit.clearSelectedOf(selectedChat!.id);
    }
    super.dispose();

    WidgetsBinding.instance.removeObserver(this);
  }

  void _onSelected(bool selected, Message message) {
    if (selected) {
      selectedMessages.set(List.from(selectedMessages.messages)..add(message));
    } else {
      selectedMessages.removeItem(message);
    }
  }

  void _onEdit(Message message) {
    editingMessage.set(message);
    textEditingController.text = message.body;
    Future.delayed(const Duration(milliseconds: 50), () {
      focusNode.requestFocus();
    });
  }

  void _onSearch(String query, List<Message> coreMessages) {
    final items = widget.cachedChatsCubit.searchMessages(query, coreMessages);

    if (items.isNotEmpty) {
      searchMessagesCubit.setItems(List<Message>.from(items));
      _scrollToCurrentSearchItem();
    }
  }

  void _scrollToCurrentSearchItem() {
    final message = searchMessagesCubit.currentItem();

    if (itemScrollController.isAttached &&
        message != null &&
        scrollIndexes.contains(message.id.toString())) {
      itemScrollController.scrollTo(
        index: scrollIndexes.getIndex(message.id.toString()) ?? 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _onRespond(Message message) {
    final user = widget.cachedUsersCubit.getUser(message.owner.id);
    if (user != null) {
      message = message.copyWith(owner: user);
    }

    respondingMessage.set(message);
    Future.delayed(const Duration(milliseconds: 50), () {
      focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: ChatAppBar(
        selectedMessagesCubit: selectedMessages,
        cachedChatsCubit: widget.cachedChatsCubit,
        onClick: widget.onAppBarClicked,
        onDeleteMessages: widget.onMessageDelete,
        searchMessagesCubit: searchMessagesCubit,
        onlineCubit: widget.onlineCubit,
        cachedUsersCubit: widget.cachedUsersCubit,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchBuilder(
              searchMessagesCubit,
              builder: (context, searchState) {
                if (searchState.enabled) {
                  return WillPopScope(
                    onWillPop: () async {
                      searchMessagesCubit.enable(false);
                      return false;
                    },
                    child: ChatBuilder(
                        cachedChatsCubit: widget.cachedChatsCubit,
                        builder: (context, state, chat) {
                          if (chat == null) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ChatSearchTextField(
                              onUp: () {
                                searchMessagesCubit.toPrevious();
                                _scrollToCurrentSearchItem();
                              },
                              onDown: () {
                                searchMessagesCubit.toNext();
                                _scrollToCurrentSearchItem();
                              },
                              onFieldSubmitted: (str) =>
                                  _onSearch(str, chat.messages),
                              onClose: () => searchMessagesCubit.enable(false),
                            ),
                          );
                        }),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
          BlocBuilder<CachedChatsCubit, CachedChatsState>(
              bloc: widget.cachedChatsCubit,
              builder: (context, state) {
                if (state.type == CachedChatsStateType.LOADING) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: const InkPageLoader(),
                  );
                }
                return const SizedBox.shrink();
              }),
          Expanded(
            child: HiddenMessagesBuilder(
              hiddenMessagesCubit,
              builder: (context, hiddenMessagesState) {
                return ChatBuilder(
                  cachedChatsCubit: widget.cachedChatsCubit,
                  listener: (context, state, chat) {
                    if (chat != null && chat.messages.isNotEmpty) {
                      widget.readMessage(chat.messages.last);
                    }
                  },
                  builder: (context, state, chat) {
                    if (chat == null) {
                      if (selectedChat != null) {
                        widget.cachedChatsCubit
                            .selectChatById(selectedChat!.id);
                      }
                      return const SizedBox.shrink();
                    }
                    chat = chat.copyWith(
                      messages: hiddenMessagesCubit.filter(chat.messages),
                    );
                    chat.sortMessagesByTime();

                    final messages = chat.messages.reversed.toList();

                    return BlocBuilder<SearchSelectCubit<Message>,
                        SearchSelectState<Message>>(
                      bloc: searchMessagesCubit,
                      builder: (context, searchState) {
                        return SelectedMessagesBuilder(
                          selectedMessages,
                          builder: (context, selectedMessagesState) {
                            if (messages.isEmpty) {
                              return const SizedBox.shrink();
                            }

                            return GroupedList<Message, int>(
                              items: messages,
                              reverse: true,
                              itemPositionsListener: itemPositionsListener,
                              controller: itemScrollController,
                              groupBy: (msg) => DateTime(msg.createdAt.year,
                                      msg.createdAt.month, msg.createdAt.day)
                                  .millisecondsSinceEpoch,
                              header: (msg) => DateSeparator(
                                dateTime: msg.createdAt,
                              ),
                              itemBuilder: (context, index) {
                                final _currentMessage = messages[index];

                                if (_currentMessage.isInfo) {
                                  return MessageInfoCard(_currentMessage);
                                }

                                scrollIndexes.add(
                                    _currentMessage.id.toString(), index);

                                bool isMyMessage = _currentMessage.owner.id ==
                                    widget.cachedChatsCubit.myId;

                                return SwipeTo(
                                  isMyMessage: isMyMessage,
                                  onLeftSwipe: isMyMessage
                                      ? () => _onRespond(_currentMessage)
                                      : null,
                                  onRightSwipe: isMyMessage
                                      ? null
                                      : () => _onRespond(_currentMessage),
                                  child: MessageCard(
                                    selectOnTap:
                                        selectedMessagesState.isNotEmpty,
                                    onSelected: (selected) =>
                                        _onSelected(selected, _currentMessage),
                                    cachedChatsCubit: widget.cachedChatsCubit,
                                    message: _currentMessage,
                                    onDelete: widget.onMessageDelete != null
                                        ? (context) => widget.onMessageDelete!(
                                            context, [_currentMessage], chat!)
                                        : null,
                                    onEdit: (context) =>
                                        _onEdit(_currentMessage),
                                    onRespond: (context) =>
                                        _onRespond(_currentMessage),
                                    selected: selectedMessagesState
                                        .contains(_currentMessage),
                                    searchSelected: searchState.enabled &&
                                        searchMessagesCubit
                                            .isSelected(_currentMessage),
                                    cachedUsersCubit: widget.cachedUsersCubit,
                                    onGoTo: (context) {
                                      Future.delayed(
                                          Duration(milliseconds: 200), () {
                                        Map<String, dynamic> args = {
                                          'id': _currentMessage.owner.id
                                        };

                                        if (chat?.isSingle == true) {
                                          final oppositeUserId =
                                              chat?.getFirstNotMyId(
                                                  widget.cachedChatsCubit.myId);

                                          if (oppositeUserId ==
                                              _currentMessage.owner.id) {
                                            args[HIDE_WRITE_BTN] = true;
                                          }
                                        }
                                        Navigator.pushNamed(
                                            context, "/personal",
                                            arguments: args);
                                      });
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          ChatBuilder(
            cachedChatsCubit: widget.cachedChatsCubit,
            builder: (context, state, chat) {
              if (chat == null) {
                return const SizedBox.shrink();
              }
              if (chat.type.name != 'notifications')
                return MessageBottomCard(
                  cachedChatsCubit: widget.cachedChatsCubit,
                  onMessageSend: widget.onMessageSend,
                  chat: chat,
                  editingMessage: editingMessage,
                  textEditingController: textEditingController,
                  focusNode: focusNode,
                  onMessageEdit: widget.onMessageEdit,
                  respondingMessage: respondingMessage,
                  cachedUsersCubit: widget.cachedUsersCubit,
                  scrollController: itemScrollController,
                );
              return SizedBox(height: 30);
            },
          ),
        ],
      ),
    );
  }
}
