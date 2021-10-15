import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_enums.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/items_search.dart';

class MessageSearchWrapper extends StatelessWidget {
  final Message message;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;
  const MessageSearchWrapper({
    Key? key,
    required this.child,
    required this.message,
    this.borderRadius,
  }) : super(key: key);

  bool canDarken(ChatCubitState state) {
    bool isSearching = state.appBarEnum == ChatAppBarEnums.SEARCH_BAR;
    ItemsSearch<Message> messagesSearch = state.messagesSearch;
    List<Message> items = messagesSearch.items;

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
