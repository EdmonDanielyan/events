import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_enums.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_textfield.dart';

class PersonListAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const PersonListAppBar({Key? key, required this.title}) : super(key: key);

  @override
  _PersonListAppBarState createState() => _PersonListAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _PersonListAppBarState extends State<PersonListAppBar> {
  ChatAppBarEnums appBarEnums = ChatAppBarEnums.INITIAL;
  late ChatPersonListCubit _chatPersonListCubit;

  void _updateAppBar(ChatAppBarEnums appBar) {
    setState(() {
      appBarEnums = appBar;
    });
  }

  @override
  Widget build(BuildContext context) {
    _chatPersonListCubit = BlocProvider.of<ChatPersonListCubit>(context);

    if (appBarEnums == ChatAppBarEnums.SEARCH_BAR) {
      return searchAppBar();
    } else {
      return initialAppBar();
    }
  }

  PreferredSizeWidget initialAppBar() {
    return InkAppBarWithText(
      title: widget.title,
      actions: [
        IconButton(
          onPressed: () => _updateAppBar(ChatAppBarEnums.SEARCH_BAR),
          icon: Icon(Icons.search),
        ),
      ],
    );
  }

  PreferredSizeWidget searchAppBar() {
    return InkAppBarWithText(
      title: "",
      titleWidget: WillPopScope(
        onWillPop: () async {
          _chatPersonListCubit.setSearchValue("");
          _updateAppBar(ChatAppBarEnums.INITIAL);
          return Future.value(false);
        },
        child: ChatSearchTextfield(
          onChanged: (val) => _chatPersonListCubit.setSearchValue(val),
        ),
      ),
    );
  }
}
