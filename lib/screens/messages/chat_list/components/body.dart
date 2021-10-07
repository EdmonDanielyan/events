import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_cubit.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_state.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/search_bar.dart';

import 'chat.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _contentPadding = EdgeInsets.symmetric(horizontal: 10);
    final _cubit = BlocProvider.of<ChatListCubit>(context);

    _cubit.emitChats(items: ChatListView.getExampleList());
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
              searchList.sort(ChatListView.sortByDate);
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
