import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_modes.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/items_search.dart';

class MessageSearchWrapper extends StatelessWidget {
  final MessageTable message;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;
  final ChatCubit chatCubit;
  const MessageSearchWrapper({
    Key? key,
    required this.child,
    required this.message,
    this.borderRadius,
    required this.chatCubit,
  }) : super(key: key);

  bool canDarken(ChatCubitState state) {
    bool isSearching = state.appBarMode == ChatAppBarMode.SEARCH_BAR;
    ItemsSearch<MessageTable> messagesSearch = state.messagesSearch;
    List<MessageTable> items = messagesSearch.items;

    return isSearching &&
        items.isNotEmpty &&
        messagesSearch.getCurrentItem == message;
  }

  void scroll(BuildContext context) {
    Scrollable.ensureVisible(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatCubitState>(
      bloc: chatCubit,
      builder: (context, state) {
        if (canDarken(state)) {
          scroll(context);

          return wrapWithColor();
        } else {
          return child;
        }
      },
    );
  }

  Widget wrapWithColor() {
    return Container(
      color: Colors.grey.withOpacity(0.9),
      child: child,
    );
  }
}
