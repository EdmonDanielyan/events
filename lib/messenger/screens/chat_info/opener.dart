import 'package:flutter/material.dart';
import 'package:ink_mobile/components/alert/alert_cancel.dart';
import 'package:ink_mobile/constants/codes.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/components/bottom_sheet/bottom_sheet.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_messages/hidden_messages_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/string_cubit.dart';
import 'package:ink_mobile/messenger/handler/senders/invite_chat_sender_handler.dart';
import 'package:ink_mobile/messenger/handler/senders/remove_participant_sender_handler.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/screens/users_picker/users_picker_screen.dart';
import 'package:ink_mobile/setup.dart';

import 'chat_info_screen.dart';

class ChatInfoOpener {
  final BuildContext context;
  final CachedChatsCubit cachedChatsCubit;
  final OnlineCubit onlineCubit;
  final CachedUsersCubit cachedUsersCubit;
  final void Function(String)? onSearch;
  const ChatInfoOpener(
    this.context,
    this.cachedChatsCubit,
    this.onlineCubit, {
    required this.cachedUsersCubit,
    this.onSearch,
  });

  void call() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatInfoScreen(
          cachedChatsCubit: cachedChatsCubit,
          onClean: _onChatClean,
          onDelete: _onChatDelete,
          onAddUser: _onAddUser,
          onRemoveParticipant: _onRemoveUser,
          onlineCubit: onlineCubit,
          cachedUsersCubit: cachedUsersCubit,
          openUser: _onOpenUserProfile,
        ),
      ),
    );
  }

  void _onChatClean(BuildContext context, Chat chat) {
    cachedChatsCubit.cleanChat(chat.id);
    if (chat.messages.isNotEmpty) {
      getIt<HiddenMessagesCubit>().add(chat.messages.map((e) => e.id).toList());
    }
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _onChatDelete(BuildContext context, Chat chat) {
    CustomAlertCancel(
      context,
      title: localizationInstance.delete,
      body: localizationInstance.deleteChatHint,
      onSubmit: () async {
        RemoveParticipantHandler(
            chat, cachedChatsCubit.myId, [cachedChatsCubit.me]).call();
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
    ).call();
  }

  void _onAddUser(BuildContext context, Chat chat) {
    CustomBottomSheet(
      context: context,
      child: UsersPickerScreen(
        submitTxtCubit: StringCubit("Добавить"),
        onSubmit: (_context, users) {
          Navigator.of(_context).pop();
          InviteChatSenderHandler(chat, cachedChatsCubit.myId, users).call();
        },
        onlineCubit: onlineCubit,
        cachedChatsCubit: cachedChatsCubit,
        chat: chat,
      ),
    );
  }

  void _onRemoveUser(BuildContext context, User user, Chat chat) {
    RemoveParticipantHandler(chat, cachedChatsCubit.myId, [user]).call();
  }

  void _onOpenUserProfile(int id, bool isSingle, BuildContext context) {
    Map<String, dynamic> args = {'id': id};

    if (isSingle) {
      args[HIDE_WRITE_BTN] = true;
    }
    Navigator.pushNamed(context, "/personal", arguments: args);
  }
}
