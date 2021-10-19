import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_state.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/chat_user_select.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/chat/person_list_params.dart';
import 'package:ink_mobile/screens/messages/chat_list/functions/open_chat.dart';
import 'package:ink_mobile/screens/messages/person_list/components/person_card.dart';
import 'package:ink_mobile/screens/messages/person_list/person_list_screen.dart';

class PersonListBody extends StatefulWidget {
  const PersonListBody({Key? key}) : super(key: key);

  @override
  _PersonListBodyState createState() => _PersonListBodyState();
}

class _PersonListBodyState extends State<PersonListBody> {
  late ChatPersonListCubit _personListCubit;
  late ChatListCubit _chatListCubit;
  late PersonListParams _personListParams;
  final double _horizontalPadding = 10.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _personListCubit.init();
    });
  }

  void _respondToChat(ChatUser user) {
    List<Message> messages =
        MessageListView.makeMessagesSendOn(_personListParams.messages!);
    Chat newChat = ChatUserViewModel.createSingleChat(user, messages: messages);
    _chatListCubit.addChat(newChat);
    Navigator.of(context).popUntil((route) => route.isFirst);
    OpenChat(context, newChat, 0);
  }

  void onPersonTap(ChatUser user) {
    if (_personListParams.type == PersonListParamsEnum.SEND_ON) {
      _respondToChat(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    _personListCubit = BlocProvider.of<ChatPersonListCubit>(context);
    _chatListCubit = BlocProvider.of<ChatListCubit>(context);
    _personListParams = PersonListScreen.of(context).params;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          _userListWidget(),
        ],
      ),
    );
  }

  Widget _userListWidget() {
    return BlocBuilder<ChatPersonListCubit, ChatPersonListCubitState>(
      builder: (BuildContext context, state) {
        if (state.type == ChatPersonListEnums.LOADING) {
          return CustomCircularProgressIndicator();
        } else if (state.type == ChatPersonListEnums.LOADED) {
          List<ChatUserSelect> users = state.searchUsers;
          return ListView.builder(
            shrinkWrap: true,
            controller: ScrollController(keepScrollOffset: false),
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return PersonListCard(
                user: users[index],
                horizontalPadding: _horizontalPadding,
                highlightText: state.searchValue,
                onTap: () => onPersonTap(users[index]),
              );
            },
          );
        }

        return SizedBox();
      },
    );
  }
}
