import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_cubit.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_state.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/search_bar.dart';

import 'chat.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late ChatListCubit _cubit;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _cubit.emitChats(items: ChatListView.getExampleList());
    });
  }

  @override
  Widget build(BuildContext context) {
    final _contentPadding = EdgeInsets.symmetric(horizontal: 10);
    _cubit = BlocProvider.of<ChatListCubit>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 2.0),
          SearchBar(
            contentPadding: _contentPadding,
            onChanged: (val) => _cubit.setSearchValue(val),
          ),
          SizedBox(height: 10.0),
          BlocBuilder<ChatListCubit, ChatListCubitState>(
            builder: (BuildContext context, state) {
              List<Chat> searchList = state.searchList;
              return ListView.builder(
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                itemCount: searchList.length,
                itemBuilder: (BuildContext context, int index) => ChatListTile(
                  highlightValue: state.searchValue,
                  index: index,
                  chat: searchList[index],
                  contentPadding: _contentPadding,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
