import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ink_mobile/functions/message_mixins.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/screens/messages/chat/components/bottom_bar.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_list.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with MessageMixins {
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

    Future.delayed(Duration.zero, () {
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
        MessageBottomBar(scrollController: controller),
      ],
    );
  }
}
