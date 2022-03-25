// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/selectable_widget.dart';
import 'package:ink_mobile/core/cubit/bool_cubit/bool_cubit.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_state.dart';
import 'package:ink_mobile/extensions/message_table.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';
import 'package:ink_mobile/messenger/models/message_list_view.dart';
import 'package:ink_mobile/messenger/screens/chat/components/hover_message.dart';
import 'package:ink_mobile/messenger/screens/chat/components/message_card_text.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/chat_screen_params.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/paddings.dart';

import 'message_card_action.dart';
import 'message_search_wrapper.dart';

class MessageCard extends StatelessWidget {
  final int index;
  final MessageWithUser messageWithUser;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatCubit chatCubit;
  final SelectableCubit<MessageWithUser> selectableCubit;
  final BoolCubit emojiShown;
  final ChatScreenParams chatScreenParams;

  MessageCard({
    Key? key,
    required this.messageWithUser,
    required this.index,
    required this.chatDatabaseCubit,
    required this.chatCubit,
    required this.selectableCubit,
    required this.chatScreenParams,
    required this.emojiShown,
  }) : super(key: key);

  MessageTable get message => messageWithUser.message!;

  void _onSwitchSelected(bool enabled) {
    selectableCubit.addOrRemove(messageWithUser);
  }

  Widget? _cache;

  @override
  Widget build(BuildContext context) {
    return _cache ??
        (_cache = BlocBuilder<SelectableCubit<MessageWithUser>,
            SelectableCubitState<MessageWithUser>>(
          bloc: selectableCubit,
          builder: (context, state) {
            return SelectableWidget(
              isOn: state.items.length > 0,
              selected: selectableCubit.isItemExists(messageWithUser),
              onSwitch: _onSwitchSelected,
              child: HoverMessage(
                emojiShown: emojiShown,
                index: index,
                messageWithUser: messageWithUser,
                ignore: !MessageListView.notIgnoringHoverTypes
                    .contains(message.type),
                chatScreenParams: chatScreenParams,
                chatCubit: chatCubit,
                child: MessageSearchWrapper(
                  chatCubit: chatCubit,
                  message: message,
                  child: Container(
                    padding: ChatScreenPaddings.messageContainerPadding,
                    child: Align(
                      alignment: message.isByMe()
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: _getMessageWidget(),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget _getMessageWidget() {
    if (messageWithUser.message != null && messageWithUser.user != null) {
      final message = messageWithUser.message!;
      final user = messageWithUser.user!;

      if (message.type == StoredMessageType.USER_LEFT ||
          message.type == StoredMessageType.USER_JOINED) {
        return MessageCardAction(
          text: message.message,
        );
      }
      return MessageCardText(
        message: message,
        user: user,
        chatDatabaseCubit: chatDatabaseCubit,
      );
    } else {
      return const SizedBox();
    }
  }
}
