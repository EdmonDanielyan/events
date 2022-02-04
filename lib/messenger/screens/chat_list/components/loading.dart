import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_shimmer.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/search_bar.dart';

class ChatListLoadingComponent extends StatelessWidget {
  final ChatDatabaseCubit chatDatabaseCubit;
  final int length;
  const ChatListLoadingComponent(
      {Key? key, required this.chatDatabaseCubit, this.length = 7})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _contentPadding = const EdgeInsets.symmetric(horizontal: 10);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            const SizedBox(height: 12.0),
            SearchBar(contentPadding: _contentPadding),
            Column(
                children: List.generate(
              length,
              (index) => IgnorePointer(
                child: ChatListTileShimmer(contentPadding: _contentPadding),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
