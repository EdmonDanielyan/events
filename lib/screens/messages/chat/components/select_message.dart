import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/mixins/popup_menu_container.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/models/chat/select_menu.dart';

class SelectMessage extends StatelessWidget {
  final Widget child;
  const SelectMessage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return PopupMenuContainer<String>(
      blurBackground: true,
      child: InkWell(
        onTap: () {},
        child: child,
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
