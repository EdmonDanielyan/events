import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/chat_list/chat_list_screen.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/new_chat_screen.dart';
import 'package:ink_mobile/screens/messages/chat_list/entities/new_chat_screen_params.dart';
import 'package:ink_mobile/setup.dart';

class NewChatBtn extends StatefulWidget {
  const NewChatBtn({Key? key}) : super(key: key);

  @override
  State<NewChatBtn> createState() => _NewChatBtnState();
}

class _NewChatBtnState extends State<NewChatBtn> {
  late SelectableCubit<UserTable> _selectableCubit;
  late ChatDatabaseCubit _chatDatabaseCubit;
  final Messenger messenger = sl<Messenger>();

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
          chatPersonListCubit: ChatPersonListCubit(),
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

  Future<void> _onCreate(BuildContext context) async {
    List<UserTable> items = _selectableCubit.getItems;
    if (items.length == 1) {
      await _createChat(items.first, context);
    } else if (items.length > 1) {
      await Navigator.of(context).pushNamed(
        "/new_group",
        arguments: _selectableCubit,
      );
    }
  }

  Future<void> _createChat(UserTable user, BuildContext context) async {
    if (messenger.isConnected) {
      ChatTable? chat = await messenger.chatCreation.isSingleChatExists(user);

      if (chat != null) {
        OpenChat(_chatDatabaseCubit, chat).call(context);
      } else {
        ChatTable newChat =
            await messenger.chatCreation.createChatThroughNats(user);
        Navigator.of(context).pop();
        OpenChat(_chatDatabaseCubit, newChat).call(context);
      }
    }
  }

  Future<void> _onUserTap(BuildContext context, UserTable user) async {
    if (messenger.isConnected) {
      ChatTable? chat = await messenger.chatCreation.isSingleChatExists(user);

      if (chat != null) {
        OpenChat(_chatDatabaseCubit, chat).call(context);
      } else {
        await _createChat(user, context);
      }
    }
  }
}
