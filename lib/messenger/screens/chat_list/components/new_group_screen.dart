import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/open_chat.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

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
  final Messenger messenger = sl<Messenger>();
  bool _submitLoading = false;
  void _setSubmitLoading(bool loading) {
    if (this.mounted) {
      setState(() {
        _submitLoading = loading;
      });
    }
  }

  Future<void> _onCreate(BuildContext context) async {
    _setSubmitLoading(true);
    if (messenger.isConnected) {
      ChatTable newChat = await messenger.chatCreation
          .createGroupThroughNats(name: chatName, users: users);

      Navigator.of(context).popUntil((route) => route.isFirst);
      await OpenChat(widget.chatDatabaseCubit, newChat).call();
    } else {
      SimpleCustomSnackbar(
        context: context,
        txt: _strings.noConnectionError,
        duration: const Duration(seconds: 2),
      );
    }

    _setSubmitLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    users = widget.selectableCubit.getItems;

    return Scaffold(
      appBar: InkAppBarWithText(
        title: _strings.newGroup,
        actions: [
          if (chatName.trim().length > 0 && !_submitLoading) ...[
            IconButton(
              onPressed: () => _onCreate(context),
              icon: Icon(Icons.check),
            ),
          ],
          if (_submitLoading) ...[
            Transform.scale(
              scale: 0.6,
              child: CustomCircularProgressIndicator(color: Colors.white),
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
        textCapitalization: TextCapitalization.sentences,
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
              child: CachedCircleAvatar(
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
