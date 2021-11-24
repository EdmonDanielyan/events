import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_state.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/person_list_params.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/person_list/components/person_card.dart';
import 'package:ink_mobile/screens/messages/person_list/person_list_screen.dart';

class PersonListBody extends StatefulWidget {
  const PersonListBody({Key? key}) : super(key: key);

  @override
  _PersonListBodyState createState() => _PersonListBodyState();
}

class _PersonListBodyState extends State<PersonListBody> {
  late ChatDatabaseCubit _chatDatabaseCubit;
  late PersonListParams _personListParams;
  final double _horizontalPadding = 10.0;

  void _respondToChat(ChatTable chat) async {
    for (final message in _personListParams.messages!) {
      MessageTable newMessage = MessageListView.renewMessage(
        message,
        newChat: chat,
        sentOn: true,
      );
      await SendMessage(
        chatDatabaseCubit: _chatDatabaseCubit,
        chat: chat,
      ).addMessage(newMessage);

      if (UseMessageProvider.initialized) {
        await UseMessageProvider.messageProvider.sendMessage(chat, newMessage);
      }
    }
    Future.delayed(Duration(milliseconds: 300), () {
      Navigator.of(context).popUntil((route) => route.isFirst);
      OpenChat(_chatDatabaseCubit, chat).call(context);
    });
  }

  void onPersonTap(ChatTable chat) {
    if (_personListParams.type == PersonListParamsEnum.SEND_ON) {
      _respondToChat(chat);
    }
  }

  @override
  Widget build(BuildContext context) {
    _chatDatabaseCubit = PersonListScreen.of(context).chatDatabaseCubit;
    _personListParams = PersonListScreen.of(context).params;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          _chatListBuilder(),
        ],
      ),
    );
  }

  Widget _chatListBuilder() {
    return BlocBuilder<ChatDatabaseCubit, ChatDatabaseCubitState>(
      bloc: _chatDatabaseCubit,
      builder: (_context, state) {
        return FutureBuilder(
          future: state.db.getAllChats(),
          builder: (context, AsyncSnapshot<List<ChatTable>> snapshot) {
            if (snapshot.hasData) {
              final items = snapshot.data ?? [];
              if (items.isNotEmpty || state.searchValue.isNotEmpty) {
                return _userListWidget(items);
              }
            }

            return SizedBox();
          },
        );
      },
    );
  }

  Widget _userListWidget(List<ChatTable> items) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      controller: ScrollController(keepScrollOffset: false),
      itemBuilder: (_, index) => PersonListCard(
        chat: items[index],
        horizontalPadding: _horizontalPadding,
        onTap: () => onPersonTap(items[index]),
      ),
    );
  }
}
