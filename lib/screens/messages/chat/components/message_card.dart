import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/mixins/popup_menu_container.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_card_text.dart';
import 'package:ink_mobile/screens/messages/chat/components/select_menu.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({Key? key, required this.message}) : super(key: key);

  Widget _getMessageWidget() {
    return MessageCardText(message: message);
  }

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return PopupMenuContainer<String>(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 7),
          child: Align(
            alignment: message.byMe ? Alignment.topRight : Alignment.topLeft,
            child: _getMessageWidget(),
          ),
        ),
      ),
      items: SelectMessageMenuList.getStandartList(_strings)
          .map((e) => menuItem(e))
          .toList(),
      onItemSelected: (value) async {
        if (value == 'delete') {
          print("DELETE");
        }
      },
    );
  }

  PopupMenuItem<String> menuItem(SelectMessageMenu e) {
    return PopupMenuItem(
      value: e.name,
      child: Row(
        children: [
          e.icon,
          SizedBox(width: 10.0),
          Expanded(
            child: Text(
              e.name,
              maxLines: 1,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
