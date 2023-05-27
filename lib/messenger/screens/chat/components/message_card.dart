import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/cached_avatar/cached_avatar.dart';
import 'package:ink_mobile/messenger/components/selectable/search_selected.dart';
import 'package:ink_mobile/messenger/components/selectable/selectable.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/messenger/screens/chat/components/hover_message.dart';
import 'package:ink_mobile/messenger/screens/chat/components/respond_container_wrapper.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/cached_user_builder.dart';

import '../../chat_list/components/message_tick.dart';
import 'edited.dart';
import 'message_body.dart';
import 'message_date.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  final CachedChatsCubit cachedChatsCubit;
  final void Function(BuildContext)? onDelete;
  final void Function(BuildContext)? onEdit;
  final void Function(bool)? onSelected;
  final bool selectOnTap;
  final bool selected;
  final bool searchSelected;
  final void Function(BuildContext)? onRespond;
  final CachedUsersCubit cachedUsersCubit;
  final void Function(BuildContext)? onGoTo;
  const MessageCard({
    Key? key,
    required this.message,
    required this.cachedChatsCubit,
    this.onDelete,
    this.onEdit,
    this.onSelected,
    this.selectOnTap = false,
    this.selected = false,
    this.searchSelected = false,
    this.onRespond,
    required this.cachedUsersCubit,
    this.onGoTo,
  }) : super(key: key);

  bool get isByMe => message.isByMe(cachedChatsCubit.myId);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SearchSelected(
        selected: searchSelected,
        child: Selectable(
            onSelected: onSelected,
            selectOnTap: selectOnTap,
            selected: selected,
            child: HoverMessageCard(
              message,
              onDelete: onDelete,
              onEdit: cachedChatsCubit.myId == message.owner.id ? onEdit : null,
              onRespond:
                  cachedChatsCubit.selectedChats.last.type.name != "notifications"
                      ? onRespond
                      : null,
              onGoTo: cachedChatsCubit.myId != message.owner.id &&
                      cachedChatsCubit.selectedChats.last.type.name !=
                          "notifications"
                  ? onGoTo
                  : null,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment:
                      isByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isByMe &&
                        cachedChatsCubit.selectedChats.last.type.name !=
                            "notifications") ...[
                      CachedUserBuilder(
                        cachedUsersCubit: cachedUsersCubit,
                        userId: message.owner.id,
                        builder: (context, state, user) {
                          return GestureDetector(
                            onTap: () => onGoTo?.call(context),
                            child: CachedCircleAvatar(
                              url: user?.avatarUrl ?? "",
                              name: user?.name ?? "",
                              avatarHeight: 32.0,
                              avatarWidth: 32.0,
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 8.0),
                    ],
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 40,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          bottomLeft: Radius.circular(isByMe ? 10.0 : 2.0),
                          topRight: const Radius.circular(10.0),
                          bottomRight: Radius.circular(isByMe ? 2.0 : 10.0),
                        ),
                        color: isByMe ? Palette.greenE4A : Palette.text5Grey,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MessageRespondWrapper(
                        message: message,
                        cachedChatsCubit: cachedChatsCubit,
                        cachedUsersCubit: cachedUsersCubit,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: isByMe
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            if (!isByMe) ...[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12.0),
                                child: CachedUserBuilder(
                                  cachedUsersCubit: cachedUsersCubit,
                                  userId: message.owner.id,
                                  builder: (context, state, user) {
                                    return GestureDetector(
                                      onTap: () => onGoTo?.call(context),
                                      child: Text(
                                        user?.name ?? "",
                                        maxLines: 1,
                                        style: FontStyles.rubikP2Medium(
                                            color: Palette.greenE4A),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 4.0),
                            ],
                            MessageBody(
                              message.body,
                              isByMe: isByMe,
                              width: message.responseTo != null
                                  ? double.maxFinite
                                  : null,
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 8.0),
                                if (message.edited) ...[
                                  MessageEditedMark(isByMe: isByMe),
                                  const SizedBox(width: 2.0),
                                ],
                                MessageDate(
                                  message.createdAt,
                                  isByMe: isByMe,
                                ),
                                if (isByMe) ...[
                                  const SizedBox(width: 4.0),
                                  MessageTick(
                                    message.status,
                                    isRead: message.isReadByOthers,
                                    color: Palette.white.withOpacity(0.5),
                                    type: message.type,
                                  ),
                                ],
                                const SizedBox(width: 8.0),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
