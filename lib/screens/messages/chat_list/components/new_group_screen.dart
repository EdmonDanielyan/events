import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/chat_user_select.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:ink_mobile/screens/messages/chat_list/functions/open_chat.dart';

class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({Key? key}) : super(key: key);

  @override
  _NewGroupScreenState createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  late ChatPersonListCubit _personListCubit;
  late ChatListCubit _chatListCubit;
  late LanguageStrings _strings;
  final double horizontalPadding = 20;
  List<ChatUserSelect> users = [];
  String chatName = "";

  void _onCreate(BuildContext context) {
    Chat groupChat = ChatUserSelectViewModel.createGroup(
        name: chatName, owner: users[0], users: users);

    _chatListCubit.addChat(groupChat);
    Navigator.of(context).popUntil((route) => route.isFirst);
    OpenChat(context, groupChat, 0);
  }

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    _personListCubit = BlocProvider.of<ChatPersonListCubit>(context);
    _chatListCubit = BlocProvider.of<ChatListCubit>(context);
    users = ChatUserSelectViewModel.getSelectedItems(
        _personListCubit.state.searchUsers);

    return Scaffold(
      appBar: InkAppBarWithText(
        title: _strings.newGroup,
        actions: [
          if (chatName.trim().length > 0) ...[
            IconButton(
              onPressed: () => _onCreate(context),
              icon: Icon(Icons.check),
            ),
          ],
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textfieldWidget(),
            Divider(height: 1, color: Colors.grey),
            _listUsersWidget(),
          ],
        ),
      ),
    );
  }

  Widget _textfieldWidget() {
    return _containerWrapper(
      child: TextFormField(
        onChanged: (val) {
          setState(() {
            chatName = val;
          });
        },
        decoration: InputDecoration(
          hintText: _strings.groupName,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }

  Widget _listUsersWidget() {
    return _containerWrapper(
      child: Container(
        width: double.infinity,
        child: Wrap(
          runSpacing: 15.0,
          spacing: 15.0,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: List.generate(
            users.length,
            (index) => Container(
              child: CustomCircleAvatar(url: users[index].avatarUrl),
            ),
          ),
        ),
      ),
    );
  }

  Widget _containerWrapper({required Widget child}) {
    return Container(
      color: Colors.white,
      padding:
          EdgeInsets.symmetric(vertical: 25.0, horizontal: horizontalPadding),
      child: child,
    );
  }
}
