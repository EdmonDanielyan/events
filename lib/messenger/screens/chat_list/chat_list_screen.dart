import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ink_mobile/constants/app_metrics_events.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_chats/hidden_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/search_list_cubit/search_list_cuibt.dart';
import 'package:ink_mobile/messenger/cubits/custom/search_list_cubit/search_list_state.dart';
import 'package:ink_mobile/messenger/functions/paginator.dart';
import 'package:ink_mobile/messenger/handler/fetch/chats.dart';

import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_card_wrapper.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/empty_chats.dart';
import 'package:ink_mobile/components/fields/search_field.dart';
import 'package:ink_mobile/setup.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'components/builder.dart';
import 'components/hidden_chats_builder.dart';

class ChatList extends StatefulWidget {
  final CachedChatsCubit cubit;
  final void Function(Chat)? onDismissed;
  final void Function(Chat)? onTap;
  final bool showSearch;
  final CachedUsersCubit cachedUsersCubit;
  const ChatList({
    Key? key,
    required this.cubit,
    this.onDismissed,
    this.onTap,
    this.showSearch = true,
    required this.cachedUsersCubit,
  }) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  CachedChatsCubit get cubit => widget.cubit;
  final searchCubit = SearchListCubit<Chat>();
  final onlineCubit = getIt<OnlineCubit>();
  final _paginator = Paginator(limit: 10, page: 15);
  final _controller = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();
  final hiddenchatsCubit = getIt<HiddenChatsCubit>();

  @override
  void initState() {
    super.initState();
    AppMetricsEvents().messageEvent();
    Future.delayed(Duration.zero, () {
      _addListener();
    });
  }

  void _addListener() {
    itemPositionsListener.itemPositions.addListener(() {
      final items = itemPositionsListener.itemPositions.value.toList();

      if (items.isNotEmpty) {
        final getFirstIndex = items.last.index + 1;

        if (_paginator.page == getFirstIndex) {
          _loadOnBottomScroll();
        }
      }
    });
  }

  Future<void> _loadOnBottomScroll() async {
    if (!_paginator.block) {
      _paginator.block = true;
      EasyLoading.show();
      await FetchChats(
        offset: _paginator.page,
        count: _paginator.limit,
        successCallback: (chats) {
          _paginator.block = false;
          _paginator.page = _paginator.page + _paginator.limit;
          if (chats.length < _paginator.limit) {
            _paginator.block = true;
          }
        },
      ).call();
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.showSearch) ...[
            const SizedBox(height: 5.0),
            ChatsBuilder(
              cachedChatsCubit: cubit,
              builder: (context, chatsState) {
                if (chatsState.chats.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: SearchField(
                    hint: localizationInstance.searchHint,
                    onChanged: (str) {
                      final items = cubit.searchChats(str);
                      searchCubit.setItems(str, items);
                    },
                  ),
                );
              },
            ),
          ],
          Expanded(
            child: BlocBuilder<SearchListCubit<Chat>, SearchListState<Chat>>(
              bloc: searchCubit,
              builder: (context, searchState) {
                return HiddenChatsBuilder(
                  cubit: hiddenchatsCubit,
                  builder: (context, hiddenChatsState) {
                    return ChatsBuilder(
                      cachedChatsCubit: cubit,
                      builder: (context, state) {
                        bool isSearchNotEmpty =
                            searchState.value.trim().isNotEmpty;
                        List<Chat> _chats = isSearchNotEmpty
                            ? hiddenchatsCubit.filterChats(searchState.items)
                            : hiddenchatsCubit.filterChats(state.chats);

                        _chats.removeWhere((element) =>
                            element.isSingle && element.messages.isEmpty);

                        _chats = _chats.toSet().toList();

                        if (_chats.isEmpty) {
                          return RefreshIndicator(
                            onRefresh: () async {
                              await FetchChats().call();
                            },
                            child: Center(
                              child: ListView(
                                shrinkWrap: true,
                                physics: AlwaysScrollableScrollPhysics(),
                                children: [
                                  EmptyChats(
                                      title: isSearchNotEmpty
                                          ? "Ничего не найдено"
                                          : "Список пустой"),
                                ],
                              ),
                            ),
                          );
                        }

                        _chats.sort((a, b) {
                          final aM = a.messages.isNotEmpty
                              ? a.messages.last.createdAt
                              : a.createdAt;
                          final bM = b.messages.isNotEmpty
                              ? b.messages.last.createdAt
                              : b.createdAt;

                          return bM.compareTo(aM);
                        });

                        widget.cubit.setVisibleChats(_chats);

                        return RefreshIndicator(
                          onRefresh: () async {
                            await FetchChats().call();
                          },
                          child: ScrollablePositionedList.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: _chats.length,
                            itemScrollController: _controller,
                            itemPositionsListener: itemPositionsListener,
                            itemBuilder: (context, index) {
                              final _currentChat = _chats[index];
                              _currentChat.sortMessagesByTime();

                              final _notReadMsgs =
                                  cubit.notReadMsgsOfChat(_currentChat.id);

                              return ChatCardWrapper(
                                notReadMsgs: _notReadMsgs,
                                highlightValue: searchState.value,
                                cachedChatsCubit: cubit,
                                chat: _currentChat,
                                onDismissed: widget.onDismissed != null
                                    ? (_) {
                                        widget.onDismissed!(_currentChat);
                                      }
                                    : null,
                                onTap: widget.onTap != null
                                    ? () => widget.onTap!(_currentChat)
                                    : null,
                                onlineCubit: onlineCubit,
                                cachedUsersCubit: widget.cachedUsersCubit,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
