import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/open_chat.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';

import '../../../setup.dart';
import '../profile_screen.dart';

class WriteBtn extends StatelessWidget {
  final UserTable user;
  const WriteBtn({Key? key, required this.user}) : super(key: key);
  static late ChatDatabaseCubit _chatDatabaseCubit;
  static final Messenger _messenger = sl<Messenger>();

  Future<void> _write(BuildContext context) async {
    if (_messenger.isConnected) {
      ChatTable? chat = await _messenger.chatCreation.isSingleChatExists(user);

      if (chat != null) {
        OpenChat(_chatDatabaseCubit, chat).call();
      } else {
        ChatTable newChat =
            await _messenger.chatCreation.createDialogChat(user);
        OpenChat(_chatDatabaseCubit, newChat).call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _chatDatabaseCubit = ProfileScreen.of(context).chatDatabaseCubit;
    return Positioned(
      bottom: -20,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          onPressed: () => _write(context),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Theme.of(context).primaryColor,
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.mail),
                const SizedBox(width: 10.0),
                Text(
                  localizationInstance.writeHint,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
