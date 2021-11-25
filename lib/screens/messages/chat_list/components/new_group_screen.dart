import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/providers/message_provider.dart';

class NewGroupScreen extends StatefulWidget {
  final ChatDatabaseCubit chatDatabaseCubit;
  final SelectableCubit<UserTable> selectableCubit;
  const NewGroupScreen({
    Key? key,
    required this.chatDatabaseCubit,
    required this.selectableCubit,
  }) : super(key: key);

  @override
  _NewGroupScreenState createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  late AppLocalizations _strings;
  final double horizontalPadding = 20;
  List<UserTable> users = [];
  String chatName = "";

  Future<void> _onCreate(BuildContext context) async {
    if (UseMessageProvider.initialized) {
      ChatTable newChat = await UseMessageProvider.messageProvider!
          .createGroup(name: chatName, users: users);

      Navigator.of(context).popUntil((route) => route.isFirst);
      OpenChat(widget.chatDatabaseCubit, newChat).call(context);
    } else {
      SimpleCustomSnackbar(
          context: context,
          txt: _strings.noConnectionError,
          duration: const Duration(seconds: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    users = widget.selectableCubit.getItems;

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
              child: CustomCircleAvatar(
                url: users[index].avatar,
                name: users[index].name,
              ),
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
