import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/components/app_bars/app_bar_with_text.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/constants/svg_pictures.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/messages_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/search_select_cubit/search_select_cubit.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/messenger/screens/chat/components/builder.dart';
import 'package:ink_mobile/messenger/screens/chat/components/selected_messages_builder.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/cached_user_builder.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/online_builder.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CachedChatsCubit cachedChatsCubit;
  final void Function(BuildContext, Chat)? onClick;
  final MessagesCubit selectedMessagesCubit;
  final void Function(BuildContext, List<Message>, Chat)? onDeleteMessages;
  final SearchSelectCubit<Message> searchMessagesCubit;
  final OnlineCubit onlineCubit;
  final CachedUsersCubit cachedUsersCubit;
  const ChatAppBar({
    Key? key,
    required this.cachedChatsCubit,
    this.onClick,
    required this.selectedMessagesCubit,
    this.onDeleteMessages,
    required this.searchMessagesCubit,
    required this.onlineCubit,
    required this.cachedUsersCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectedMessagesBuilder(
      selectedMessagesCubit,
      builder: (context, selectedMessagesState) {
        return WillPopScope(
          onWillPop: () async {
            if (selectedMessagesState.isNotEmpty) {
              selectedMessagesCubit.set([]);
              return false;
            }

            return true;
          },
          child: ChatBuilder(
            cachedChatsCubit: cachedChatsCubit,
            builder: (context, state, chat) {
              return AppBarWithText(
                titleWidget: GestureDetector(
                  onTap: () => onClick != null &&
                          cachedChatsCubit.selectedChats.isNotEmpty
                      ? onClick!(context, cachedChatsCubit.selectedChats.last)
                      : null,
                  child: Column(
                    children: [
                      if (chat != null && !chat.isSingle) ...[
                        GoogleText(chat.name, maxLines: 1),
                      ],
                      if (chat != null && chat.isSingle) ...[
                        CachedUserBuilder(
                          cachedUsersCubit: cachedUsersCubit,
                          userId: chat.getFirstNotOwnerId(),
                          builder: (context, state, user) {
                            return GoogleText(
                              user?.name ?? "",
                              maxLines: 1,
                            );
                          },
                        ),
                        OnlineBuilder(
                          onlineCubit,
                          userId: chat.getFirstNotOwnerId(),
                          builder: (context, onlineState, user) {
                            return GoogleText(
                              user != null ? "В сети" : "Не в сети",
                              fontSize: 11.0,
                            );
                          },
                          cachedChatsCubit: cachedChatsCubit,
                        ),
                      ],
                    ],
                  ),
                ),
                actions: [
                  if (chat != null && selectedMessagesState.isNotEmpty) ...[
                    IconButton(
                      onPressed: onDeleteMessages != null
                          ? () {
                              selectedMessagesCubit.set([]);
                              onDeleteMessages!(
                                  context, selectedMessagesState, chat);
                            }
                          : null,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                  IconButton(
                    onPressed: () => searchMessagesCubit.enable(true),
                    icon: SvgPicture.asset(
                      SvgPictures.search,
                      color: Colors.white,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
