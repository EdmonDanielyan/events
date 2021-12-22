import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_shimmer.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/search_bar.dart';

class ChatListLoadingComponent extends StatelessWidget {
  final ChatDatabaseCubit chatDatabaseCubit;
  const ChatListLoadingComponent({Key? key, required this.chatDatabaseCubit})
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
              7,
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
