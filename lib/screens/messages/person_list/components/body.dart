import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/alert/loading.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_state.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/person_list_params.dart';
import 'package:ink_mobile/providers/messenger.dart';
import 'package:ink_mobile/screens/messages/person_list/components/person_card.dart';
import 'package:ink_mobile/screens/messages/person_list/person_list_screen.dart';
import 'package:ink_mobile/setup.dart';

class PersonListBody extends StatefulWidget {
  const PersonListBody({Key? key}) : super(key: key);

  @override
  _PersonListBodyState createState() => _PersonListBodyState();
}

class _PersonListBodyState extends State<PersonListBody> {
  late ChatDatabaseCubit _chatDatabaseCubit;
  late PersonListParams _personListParams;
  final double _horizontalPadding = 10.0;
  final Messenger messenger = sl<Messenger>();

  void _respondToChat(ChatTable chat) async {
    CustomAlertLoading(context).call();
    for (final message in _personListParams.messages!) {
      MessageTable newMessage = MessageListView.renewMessage(
        message,
        id: sl<SendMessage>().generateMessageId,
        newChat: chat,
        sentOn: true,
      );
      await sl<SendMessage>().addMessage(chat, newMessage);
      if (messenger.isConnected) {
        await messenger.textSender.sendMessage(chat, newMessage);
      }
    }
    Future.delayed(Duration(milliseconds: 300), () {
      Navigator.of(context).popUntil((route) => route.isFirst);
      OpenChat(_chatDatabaseCubit, chat).call();
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
    items.sort((a, b) {
      return b.updatedAt.compareTo(a.updatedAt);
    });
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
