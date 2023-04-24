import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/cached_avatar/cached_avatar.dart';
import 'package:ink_mobile/messenger/components/selectable/search_selected.dart';
import 'package:ink_mobile/messenger/components/selectable/selectable.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
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
    return SearchSelected(
      selected: searchSelected,
      child: Selectable(
        onSelected: onSelected,
        selectOnTap: selectOnTap,
        selected: selected,
        child: HoverMessageCard(
          message,
          onDelete: onDelete,
          onEdit: cachedChatsCubit.myId == message.owner.id ? onEdit : null,
          onRespond:  cachedChatsCubit.selectedChats.last.type.name !="notifications"? onRespond : null,
          onGoTo: cachedChatsCubit.myId != message.owner.id && cachedChatsCubit.selectedChats.last.type.name !="notifications"? onGoTo : null,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment:
                    isByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  if (!isByMe && cachedChatsCubit.selectedChats.last.type.name !="notifications") ...[
                    CachedUserBuilder(
                      cachedUsersCubit: cachedUsersCubit,
                      userId: message.owner.id,
                      builder: (context, state, user) {
                        return GestureDetector(
                          onTap: onGoTo != null ? () => onGoTo!(context) : null,
                          child: CachedCircleAvatar(
                            url: user?.avatarUrl ?? "",
                            name: user?.name ?? "",
                            avatarHeight: SizeConfig(context, 40)
                                .getProportionateScreenHeight,
                            avatarWidth: SizeConfig(context, 40)
                                .getProportionateScreenHeight,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10.0),
                  ],
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          bottomLeft: Radius.circular(isByMe ? 10.0 : 2.0),
                          topRight: const Radius.circular(10.0),
                          bottomRight: Radius.circular(isByMe ? 2.0 : 10.0),
                        ),
                        color: isByMe
                            ? const Color(0XFF46966E)
                            : const Color(0XFFF2F2F2),
                      ),
                      child: MessageRespondWrapper(
                        message: message,
                        cachedChatsCubit: cachedChatsCubit,
                        cachedUsersCubit: cachedUsersCubit,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: isByMe
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              if (!isByMe) ...[
                                CachedUserBuilder(
                                  cachedUsersCubit: cachedUsersCubit,
                                  userId: message.owner.id,
                                  builder: (context, state, user) {
                                    return GestureDetector(
                                      onTap: onGoTo != null
                                          ? () => onGoTo!(context)
                                          : null,
                                      child: GoogleText(
                                        user?.name ?? "",
                                        maxLines: 1,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 5.0),
                              ],
                              MessageBody(
                                message.body,
                                isByMe: isByMe,
                                width: message.responseTo != null
                                    ? double.maxFinite
                                    : null,
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
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
                                      tickColor: Colors.white.withOpacity(0.6),
                                      clockColor: Colors.white.withOpacity(0.6),
                                      readColor: Colors.white,
                                      type: message.type,
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
