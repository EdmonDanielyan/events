import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/icon_on_top.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_avatar.dart';
import 'package:ink_mobile/screens/messages/cubit/chat_list_cubit.dart';

class ChatInfoEditScreen extends StatelessWidget {
  const ChatInfoEditScreen({Key? key}) : super(key: key);
  static late Chat _chat;

  bool get isGroup => _chat.group != null;
  static double _horizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    final _cubit = BlocProvider.of<ChatListCubit>(context);
    _chat = _cubit.state.chats[_cubit.selectedChatIndex];
    return CustomBottomSheetChild(
      title: _strings.edit,
      cancelBtnTxt: _strings.cancel,
      submitBtnTxt: _strings.ready,
      horizontalPadding: _horizontalPadding,
      child: Column(
        children: [
          avatarWidget(),
          SizedBox(height: 20.0),
          divider(),
          textfieldWidget(hint: _chat.chatName, fontWeight: FontWeight.bold),
          divider(),
          if (isGroup) ...[
            textfieldWidget(hint: _chat.group!.description),
            divider(),
          ],
        ],
      ),
    );
  }

  Widget avatarWidget() {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          ChatAvatar(
            url: _chat.avatarUrl,
            avatarWidth: double.infinity,
            avatarHeight: double.infinity,
          ),
          IconOnTop(
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }

  Widget textfieldWidget({
    required String hint,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: TextFormField(
        initialValue: hint,
        decoration: InputDecoration(border: InputBorder.none),
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: fontWeight,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(
      height: 2.0,
      color: Colors.grey,
    );
  }
}
