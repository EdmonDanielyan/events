import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/bottom_sheet/bottom_sheet.dart';
import 'package:ink_mobile/messenger/components/dismissible/custom_dismissible.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/notifications_disabled_chats/notifications_disabled_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/screens/chat/components/builder.dart';
import 'package:ink_mobile/messenger/screens/chat_info/components/app_bar.dart';
import 'package:ink_mobile/messenger/screens/chat_info/components/edit_screen.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/cached_user_builder.dart';
import 'package:ink_mobile/setup.dart';
import 'components/add_btn.dart';
import 'components/chat_info_btn.dart';
import 'components/chat_info_top.dart';
import 'components/divider.dart';
import 'components/header.dart';
import 'components/notifications_btn.dart';
import 'components/participant_card.dart';

class ChatInfoScreen extends StatefulWidget {
  final CachedChatsCubit cachedChatsCubit;
  final void Function(BuildContext, Chat)? onClean;
  final void Function(BuildContext, Chat)? onDelete;
  final void Function(BuildContext, Chat)? onAddUser;
  final void Function(BuildContext, User, Chat)? onRemoveParticipant;
  final OnlineCubit onlineCubit;
  final CachedUsersCubit cachedUsersCubit;
  final void Function(int, bool, BuildContext) openUser;
  const ChatInfoScreen({
    Key? key,
    required this.cachedChatsCubit,
    this.onClean,
    this.onDelete,
    this.onAddUser,
    this.onRemoveParticipant,
    required this.onlineCubit,
    required this.cachedUsersCubit,
    required this.openUser,
  }) : super(key: key);

  @override
  _ChatInfoScreenState createState() => _ChatInfoScreenState();
}

class _ChatInfoScreenState extends State<ChatInfoScreen> {
  final notificationsCubit = getIt<NotificationsDisabledChatsCubit>();

  void _onChatEdit(BuildContext context, Chat chat) {
    CustomBottomSheet(
      context: context,
      child: ChatEditScreen(
        chat: chat,
        myId: widget.cachedChatsCubit.myId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const _horizontalPadding = 20.0;
    return ChatBuilder(
      buildWhen: (_, __) => true,
      cachedChatsCubit: widget.cachedChatsCubit,
      builder: (context, state, chat) {
        if (chat == null) {
          return const SizedBox.shrink();
        }

        List<User> paricipants = chat.participants;
        return Scaffold(
          appBar: ChatInfoAppBar(
            onEdit: chat.isOwner(widget.cachedChatsCubit.myId) && chat.isGroup
                ? () => _onChatEdit(context, chat)
                : null,
          ),
          backgroundColor: const Color(0XFFF9F9F9),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: _horizontalPadding, vertical: 15.0),
                  child: chat.isSingle
                      ? CachedUserBuilder(
                          cachedUsersCubit: widget.cachedUsersCubit,
                          userId: chat
                              .getFirstNotMyId(widget.cachedChatsCubit.myId),
                          builder: (context, state, user) {
                            return ChatInfoTop(
                              url: user?.avatarUrl ?? chat.avatarUrl,
                              name: user?.name ?? chat.name,
                              description: chat.description,
                              subDescription: "",
                              onTap: user != null
                                  ? () =>
                                      widget.openUser(user.id, true, context)
                                  : null,
                            );
                          },
                        )
                      : ChatInfoTop(
                          url: chat.avatarUrl,
                          name: chat.name,
                          description: chat.description,
                          subDescription: "Участников: ${paricipants.length}",
                        ),
                ),
                // const SizedBox(height: 20.0),
                // const ChatInfoDivider(),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: _horizontalPadding,
                //     vertical: 5.0,
                //   ),
                //   child: Column(
                //     children: [
                //       NotificationsBtn(
                //         cachedChatsCubit: widget.cachedChatsCubit,
                //         notificationsDisabledChatsCubit: notificationsCubit,
                //         chatId: chat.id,
                //       ),
                //     ],
                //   ),
                // ),
                const ChatInfoDivider(),
                const SizedBox(height: 20.0),
                const ChatInfoDivider(),
                ChatInfoBtn(
                  title: "Очистить чат",
                  color: const Color(0XFF5FB9CF),
                  padding: const EdgeInsets.symmetric(
                      horizontal: _horizontalPadding),
                  onPressed: widget.onClean != null
                      ? () => widget.onClean!(context, chat)
                      : null,
                ),
                if (chat.isGroup) ...[
                  const ChatInfoDivider(),
                  ChatInfoBtn(
                    title: "Покинуть чат",
                    color: const Color(0XFFD75F50),
                    padding: const EdgeInsets.symmetric(
                        horizontal: _horizontalPadding),
                    onPressed: widget.onDelete != null
                        ? () => widget.onDelete!(context, chat)
                        : null,
                  ),
                ],
                const ChatInfoDivider(),
                const SizedBox(height: 20.0),
                if (chat.isGroup) ...[
                  const Padding(
                    padding: EdgeInsets.only(left: _horizontalPadding),
                    child: ChatInfoHeader("Участники"),
                  ),
                  const SizedBox(height: 20.0),
                  const ChatInfoDivider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: _horizontalPadding, top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (chat.isOwner(widget.cachedChatsCubit.myId)) ...[
                          ChatInfoAddBtn(
                            onPressed: widget.onAddUser != null
                                ? (_) => widget.onAddUser!(context, chat)
                                : null,
                            cachedChatsCubit: widget.cachedChatsCubit,
                          ),
                        ],
                        ListView.builder(
                          itemCount: paricipants.length,
                          shrinkWrap: true,
                          controller: ScrollController(keepScrollOffset: false),
                          itemBuilder: (context, index) {
                            final _currentUser = paricipants[index];
                            final isOwner = _currentUser.id == chat.ownerId;

                            return CachedUserBuilder(
                              userId: _currentUser.id,
                              cachedUsersCubit: widget.cachedUsersCubit,
                              builder: (context, state, user) {
                                return CustomDismissible(
                                  uniqueKey: ValueKey(_currentUser.id),
                                  onDismissed: !isOwner &&
                                          chat.ownerId ==
                                              widget.cachedChatsCubit.myId
                                      ? (_) {
                                          if (widget.onRemoveParticipant !=
                                              null) {
                                            widget.onRemoveParticipant!(context,
                                                user ?? _currentUser, chat);
                                          }
                                        }
                                      : null,
                                  child: GestureDetector(
                                    onTap: () => widget.openUser(
                                        (user ?? _currentUser).id,
                                        false,
                                        context),
                                    child: ParticipantCard(
                                      user: user ?? _currentUser,
                                      trailing: isOwner ? "Создатель" : "",
                                      onlineCubit: widget.onlineCubit,
                                      cachedChatsCubit: widget.cachedChatsCubit,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  const ChatInfoDivider(),
                ],
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
