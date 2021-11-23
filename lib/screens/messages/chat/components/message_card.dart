import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/selectable_widget.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_state.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/screens/messages/chat/chat_screen.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_card_text.dart';
import 'package:ink_mobile/screens/messages/chat/components/hover_message.dart';
import 'package:ink_mobile/screens/messages/chat/entities/paddings.dart';

import 'message_card_action.dart';
import 'message_search_wrapper.dart';

class MessageCard extends StatelessWidget {
  final int index;
  final MessageWithUser messageWithUser;
  final ChatDatabaseCubit chatDatabaseCubit;
  const MessageCard({
    Key? key,
    required this.messageWithUser,
    required this.index,
    required this.chatDatabaseCubit,
  }) : super(key: key);
  static late ChatCubit _chatCubit;
  static late SelectableCubit<MessageWithUser> _selectableCubit;

  MessageTable get message => messageWithUser.message!;

  void _onSwitchSelected(bool enabled) {
    _selectableCubit.addOrRemove(messageWithUser);
  }

  @override
  Widget build(BuildContext context) {
    _chatCubit = ChatScreen.of(context).chatCubit;
    _selectableCubit = ChatScreen.of(context).selectableCubit;

    return BlocBuilder<SelectableCubit<MessageWithUser>,
        SelectableCubitState<MessageWithUser>>(
      bloc: _selectableCubit,
      builder: (context, state) {
        return SelectableWidget(
          isOn: state.items.length > 0,
          selected: _selectableCubit.isItemExists(messageWithUser),
          onSwitch: _onSwitchSelected,
          child: HoverMessage(
            index: index,
            messageWithUser: messageWithUser,
            ignore:
                !MessageListView.notIgnoringHoverTypes.contains(message.type),
            child: MessageSearchWrapper(
              chatCubit: _chatCubit,
              message: message,
              child: Container(
                padding: ChatScreenPaddings.messageContainerPadding,
                child: Align(
                  alignment: MessageListView.isByMe(message)
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  child: _getMessageWidget(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getMessageWidget() {
    final message = messageWithUser.message!;
    final user = messageWithUser.user!;

    if (message.type == MessageType.UserLeftChat ||
        message.type == MessageType.UserJoined) {
      return MessageCardAction(
        text: message.message,
      );
    }
    return MessageCardText(
      message: message,
      user: user,
      chatDatabaseCubit: chatDatabaseCubit,
    );
  }
}
