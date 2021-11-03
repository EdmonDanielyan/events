import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/functions/message_mixins.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_enums.dart';
import 'package:ink_mobile/screens/messages/chat/components/bottom_bar.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_list.dart';

import '../chat_screen.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  ChatBodyState createState() => ChatBodyState();
}

class ChatBodyState extends State<ChatBody> with MessageMixins {
  ScrollController controller = ScrollController();
  late KeyboardVisibilityController keyboardVisibilityController;

  void keyboardListener() {
    keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((visible) {
      if (visible) bottomGapScroll(controller);
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 200), () {
      ScrollBottom(controller).jump();
    });
    keyboardListener();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: controller,
            child: MessageList(),
          ),
        ),
        BlocBuilder<ChatCubit, ChatCubitState>(
          bloc: ChatScreen.of(context).chatCubit,
          builder: (context, state) {
            if (state.appBarEnum != ChatAppBarEnums.SEARCH_BAR) {
              return MessageBottomBar(scrollController: controller);
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    );
  }
}
