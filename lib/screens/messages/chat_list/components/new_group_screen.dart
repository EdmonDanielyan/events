import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_user_select.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({Key? key}) : super(key: key);

  @override
  _NewGroupScreenState createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  late ChatPersonListCubit _personListCubit;
  late AppLocalizations _strings;
  final double horizontalPadding = 20;
  late ChatDatabaseCubit _chatDatabaseCubit;
  List<ChatUserSelect> users = [];
  String chatName = "";

  Future<void> _onCreate(BuildContext context) async {
    ChatTable newChat = await ChatCreation(_chatDatabaseCubit)
        .createGroup(name: chatName, users: users);

    Navigator.of(context).popUntil((route) => route.isFirst);
    OpenChat(_chatDatabaseCubit, newChat).call(context);
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    _personListCubit = BlocProvider.of<ChatPersonListCubit>(context);
    users = ChatUserSelectViewModel.getSelectedItems(
        _personListCubit.state.searchUsers);
    _chatDatabaseCubit =
        BlocProvider.of<ChatDatabaseCubit>(context, listen: false);

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
              child: CustomCircleAvatar(url: users[index].avatar),
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
