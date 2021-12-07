import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/chat_list/chat_list_screen.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/new_chat_screen.dart';
import 'package:ink_mobile/screens/messages/chat_list/entities/new_chat_screen_params.dart';

class NewChatBtn extends StatelessWidget {
  const NewChatBtn({Key? key}) : super(key: key);
  static late SelectableCubit<UserTable> _selectableCubit;
  static late ChatDatabaseCubit _chatDatabaseCubit;

  @override
  Widget build(BuildContext context) {
    _selectableCubit = ChatListScreen.of(context).selectableCubit;
    _chatDatabaseCubit = ChatListScreen.of(context).chatDatabaseCubit;
    return IconButton(
      onPressed: () => CustomBottomSheet(
        context: context,
        child: NewChatScreen(
          newChatScreenParams: _getNewChatScreenParams(),
          chatDatabaseCubit: _chatDatabaseCubit,
          selectableCubit: _selectableCubit,
          chatPersonListCubit: ChatListScreen.of(context).chatPersonListCubit,
        ),
      ),
      icon: SvgPicture.asset(EDIT_BTN_ICON, color: Colors.white),
    );
  }

  NewChatScreenParams _getNewChatScreenParams() {
    final strings = localizationInstance;
    return NewChatScreenParams(
      title: strings.writeHint,
      description: strings.newChatHint,
      chosenOneText: strings.writeHint,
      chosenMultipleText: "${strings.create} ${strings.chat.toLowerCase()}",
      onSubmit: _onCreate,
      onUserTap: _onUserTap,
      hideIds: [JwtPayload.myId],
    );
  }

  void _onCreate(BuildContext context) {
    List<UserTable> items = _selectableCubit.getItems;
    if (items.length == 1) {
      _createChat(items.first, context);
    } else if (items.length > 1) {
      Navigator.of(context).pushNamed(
        "/new_group",
        arguments: _selectableCubit,
      );
    }
  }

  Future<void> _createChat(UserTable user, BuildContext context) async {
    if (UseMessageProvider.initialized) {
      ChatTable newChat = await UseMessageProvider.messageProvider!.chatCreation
          .createChatThroughNats(user);
      Navigator.of(context).pop();
      OpenChat(_chatDatabaseCubit, newChat).call(context);
    }
  }

  Future<void> _onUserTap(BuildContext context, UserTable user) async {
    if (UseMessageProvider.initialized) {
      ChatTable? chat = await UseMessageProvider.messageProvider!.chatCreation
          .isSingleChatExists(user);

      if (chat != null) {
        OpenChat(_chatDatabaseCubit, chat).call(context);
      }
    }
  }
}
