import 'package:flutter/material.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/edit_screen.dart';

import '../chat_info_screen.dart';

class ChatInfoEditBtn extends StatelessWidget {
  const ChatInfoEditBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => CustomBottomSheet(
        context: context,
        child: ChatInfoEditScreen(
          chatDatabaseCubit: ChatInfoScreen.of(context).chatDatabaseCubit,
        ),
      ),
      icon: Icon(Icons.edit),
    );
  }
}