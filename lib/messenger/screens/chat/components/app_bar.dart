import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/components/avatar_with_badge.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:collection/collection.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/messages_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/search_select_cubit/search_select_cubit.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/messenger/model/user.dart';
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
              return InkAppBar(
                context,
                titleWidget: GestureDetector(
                  onTap: () => cachedChatsCubit.selectedChats.isNotEmpty
                      ? onClick?.call(
                          context, cachedChatsCubit.selectedChats.last)
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (chat != null)
                        CachedUserBuilder(
                          cachedUsersCubit: cachedUsersCubit,
                          userId: chat.getFirstNotMyId(cachedChatsCubit.myId),
                          builder: (context, state, user) {
                            return Row(
                              children: [
                                if (chat.isSingle)
                                  OnlineBuilder(
                                    onlineCubit,
                                    userId: chat
                                        .getFirstNotMyId(cachedChatsCubit.myId),
                                    builder: (context, onlineState, user) {
                                      User? cachedUser;
                                      if (user == null) {
                                        cachedUser ??= chat.participants
                                            .firstWhereOrNull((element) =>
                                                element.id !=
                                                cachedChatsCubit.myId);
                                      }
                                      return AvatarWithBadge(
                                        avatarHeight: 32.0,
                                        avatarWidth: 32.0,
                                        url: user?.avatarUrl ??
                                            cachedUser?.avatarUrl ??
                                            chat.avatarUrl,
                                        name: chat.name,
                                        indicator: user != null,
                                        absence: user?.absence,
                                      );
                                    },
                                    cachedChatsCubit: cachedChatsCubit,
                                  ),
                                if (!chat.isSingle)
                                  if (chat.isNotifications)
                                    Container(
                                      height: 32.0,
                                      width: 32.0,
                                      decoration: BoxDecoration(
                                        color: Palette.greenE4A,
                                        borderRadius:
                                            BorderRadius.circular(48.0),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            IconLinks.LOGO_ICON,
                                            height: 20.0,
                                            width: 20.0),
                                      ),
                                    )
                                  else
                                    AvatarWithBadge(
                                      avatarHeight: 32.0,
                                      avatarWidth: 32.0,
                                      url: chat.avatarUrl,
                                      name: chat.name,
                                    ),
                                const SizedBox(width: 8.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedUserBuilder(
                                      cachedUsersCubit: cachedUsersCubit,
                                      userId: chat.getFirstNotMyId(
                                          cachedChatsCubit.myId),
                                      builder: (context, state, user) {
                                        return Text(
                                          chat.isSingle
                                              ? user?.name ?? ""
                                              : chat.isNotifications
                                                  ? chat.name.toUpperCase()
                                                  : chat.name,
                                          maxLines: 1,
                                          style: FontStyles.rubikP3Medium(
                                              color: Palette.white),
                                        );
                                      },
                                    ),
                                    OnlineBuilder(
                                      onlineCubit,
                                      userId: chat.getFirstNotMyId(
                                          cachedChatsCubit.myId),
                                      builder: (context, onlineState, user) {
                                        return Text(
                                          user != null ? "В сети" : "Не в сети",
                                          style: FontStyles.rubikP3(
                                              color: Palette.white
                                                  .withOpacity(0.5)),
                                        );
                                      },
                                      cachedChatsCubit: cachedChatsCubit,
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                    ],
                  ),
                ),
                showPersonalPageLink: false,
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
                      icon: Icon(Icons.delete,
                          color: Colors.red,
                          size: SizeConfig(context, 20)
                              .getProportionateScreenHeight),
                    ),
                  ],
                  IconButton(
                    onPressed: () => searchMessagesCubit.enable(true),
                    icon: SvgPicture.asset(IconLinks.SEARCH_ICON,
                        colorFilter:
                            ColorFilter.mode(Palette.white, BlendMode.srcIn),
                        width: SizeConfig(context, 17)
                            .getProportionateScreenHeight,
                        height: SizeConfig(context, 17)
                            .getProportionateScreenHeight),
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
