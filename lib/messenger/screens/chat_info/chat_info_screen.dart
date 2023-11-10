import 'package:flutter/material.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
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
import 'package:share_plus/share_plus.dart';
import 'package:xxtea/xxtea.dart';
import 'components/add_btn.dart';
import 'components/chat_info_btn.dart';
import 'components/chat_info_top.dart';
import 'components/divider.dart';
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
  final notificationsCubit = getIt<ToggleNotificationsChatsCubit>();

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

        List<User> participants = chat.participants;
        return Scaffold(
          backgroundColor: Palette.white,
          appBar: ChatInfoAppBar(
            onEdit: chat.isOwner(widget.cachedChatsCubit.myId) && chat.isGroup
                ? () => _onChatEdit(context, chat)
                : null,
          ),
          body: Padding(
            padding: const EdgeInsets.only(
                top: 32.0, right: 20.0, left: 20.0, bottom: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (chat.isSingle)
                    CachedUserBuilder(
                      cachedUsersCubit: widget.cachedUsersCubit,
                      userId:
                          chat.getFirstNotMyId(widget.cachedChatsCubit.myId),
                      builder: (context, state, user) {
                        return ChatInfoTop(
                          url: user?.avatarUrl ?? chat.avatarUrl,
                          name: user?.name ?? chat.name,
                          description: chat.description,
                          subDescription: "",
                          onTap: user != null
                              ? () => widget.openUser(user.id, true, context)
                              : null,
                          absence: user?.absence,
                        );
                      },
                    ),
                  if (chat.isGroup)
                    ChatInfoTop(
                      url: chat.avatarUrl,
                      name: chat.name,
                      description: chat.description,
                      subDescription: "Участников: ${participants.length}",
                    ),
                  if (chat.isNotifications)
                    ChatInfoTop(
                      url: chat.avatarUrl,
                      name: chat.name.toUpperCase(),
                      description: chat.description,
                      subDescription: "Участников: ${participants.length}",
                    ),
                  const SizedBox(height: 32.0),
                  NotificationsBtn(
                    cachedChatsCubit: widget.cachedChatsCubit,
                    toggleNotificationsChatsCubit: notificationsCubit,
                    chatId: chat.id,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: const ChatInfoDivider(),
                  ),
                  ChatInfoBtn(
                    title: "Очистить историю",
                    color: const Color(0XFF5FB9CF),
                    onTap: () => widget.onClean?.call(context, chat),
                  ),
                  if (chat.isGroup) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: const ChatInfoDivider(),
                    ),
                    ChatInfoBtn(
                      title: "Покинуть чат",
                      color: Palette.redF50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: _horizontalPadding),
                      onTap: () => widget.onDelete?.call(context, chat),
                    ),
                  ],
                  if (chat.isGroup) ...[
                    const SizedBox(height: 32.0),
                    Text(
                      "Участники ${chat.participants.length}",
                      style: FontStyles.rubikP1Medium(color: Palette.textBlack),
                    ),
                    if (chat.isOwner(widget.cachedChatsCubit.myId)) ...[
                      const SizedBox(height: 16.0),
                      ChatInfoAddBtn(
                        onPressed: (_) => widget.onAddUser?.call(context, chat),
                        cachedChatsCubit: widget.cachedChatsCubit,
                      ),
                      const SizedBox(height: 20.0),
                      DefaultButton(
                        onTap: () {
                          String key = "n4{q]v&C";
                          String? encryptData =
                              xxtea.encryptToString(chat.id.toString(), key);
                          final chatId = encryptData ?? chat.id;
                          Share.share(
                              'https://portal.irkutskoil.ru/chats/join/$chatId');
                        },
                        title: "Поделиться ссылкой",
                        borderColor: Palette.greenE4A,
                        textColor: Palette.greenE4A,
                      ),
                    ],
                    const SizedBox(height: 16.0),
                    ListView.separated(
                      itemCount: participants.length,
                      shrinkWrap: true,
                      controller: ScrollController(keepScrollOffset: false),
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Palette.text5Grey,
                          height: 32.0,
                        );
                      },
                      itemBuilder: (context, index) {
                        final _currentUser = participants[index];
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
                                  ? (_) => widget.onRemoveParticipant?.call(
                                        context,
                                        user ?? _currentUser,
                                        chat,
                                      )
                                  : null,
                              child: InkWell(
                                onTap: () => widget.openUser(
                                    (user ?? _currentUser).id, false, context),
                                child: ParticipantCard(
                                  user: user ?? _currentUser,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
