import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/date_sort.dart';
import 'package:ink_mobile/functions/message_mixins.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/chat/texting.dart';
import 'package:ink_mobile/screens/messages/chat/components/date_widget.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_card.dart';
import 'package:ink_mobile/screens/messages/chat/entities/chat_screen_params.dart';
import 'package:ink_mobile/screens/messages/chat/entities/paddings.dart';

import '../chat_screen.dart';
import 'message_card_text.dart';

class MessageList extends StatelessWidget with MessageMixins {
  final void Function()? messagesLoaded;
  final void Function()? scrollSafe;
  const MessageList({
    Key? key,
    this.messagesLoaded,
    this.scrollSafe,
  }) : super(key: key);
  static List<MessageWithUser>? messagesWithUser;
  static late ChatDatabaseCubit _chatDatabaseCubit;
  static late ChatScreenParams _chatScreenParams;
  static late ChatCubit _chatCubit;

  Stream<List<MessageWithUser>> getStream() {
    final String chatId = _chatDatabaseCubit.selectedChat!.id;
    if (_chatScreenParams.showOnlyFilesAndLinks) {
      return _chatDatabaseCubit.db.watchChatFilesMessages(chatId);
    }

    return _chatDatabaseCubit.db.watchChatMessages(chatId);
  }

  void _messagesLoaded() {
    if (messagesLoaded != null) {
      messagesLoaded!();
    }
  }

  @override
  Widget build(BuildContext context) {
    _chatDatabaseCubit = ChatScreen.of(context).chatDatabaseCubit;
    _chatScreenParams = ChatScreen.of(context).chatScreenParams;
    _chatCubit = ChatScreen.of(context).chatCubit;

    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder(
              stream: getStream(),
              builder:
                  (context, AsyncSnapshot<List<MessageWithUser>> snapshot) {
                if (snapshot.hasData) {
                  messagesWithUser = snapshot.data ?? [];
                  DateTimeSort dateSort = DateTimeSort();

                  if (messagesWithUser!.length > 0) {
                    _messagesLoaded();

                    return ListView.builder(
                      controller: ScrollController(keepScrollOffset: false),
                      itemCount: messagesWithUser!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return eachItem(
                            messagesWithUser![index], dateSort, index);
                      },
                    );
                  }
                }
                return SizedBox();
              },
            ),
            _textingWidget(),
          ],
        ),
      ),
    );
  }

  Widget eachItem(
      MessageWithUser messageWithUser, DateTimeSort dateSort, int index) {
    return Column(
      children: [
        DateWidget(
          dateTime:
              dateSort.getMessageDateTime(messageWithUser.message!.created!),
        ),
        MessageCard(
          messageWithUser: messageWithUser,
          index: index,
        ),
      ],
    );
  }

  Widget _textingWidget() {
    return BlocBuilder<ChatCubit, ChatCubitState>(
      bloc: _chatCubit,
      buildWhen: (previous, current) {
        return previous.texting != current.texting;
      },
      builder: (context, state) {
        if (state.texting != null &&
            state.texting!.customTextingEnum != CustomTextingEnum.EMPTY) {
          if (scrollSafe != null) {
            scrollSafe!();
          }
          return Container(
            padding: ChatScreenPaddings.messageContainerPadding,
            child: MessageCardText(
              user: state.texting!.user,
              messageStr: "...",
              message: null,
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}
