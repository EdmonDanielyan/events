import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/screens/feedback/components/answers/answers_list.dart';
import 'package:ink_mobile/screens/feedback/components/feadback_navigation_header.dart';
import 'package:ink_mobile/screens/feedback/components/form/form.dart';

import '../feedback_screen.dart';
import 'management_feedback.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;

  bool get isFirstPageActive => currentIndex == 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Column(
        children: [
          FeedbackNavigationHeader(
            askQuestionColor: isFirstPageActive ? Palette.textBlack : Palette.text20Grey,
            answersColor: isFirstPageActive ? Palette.text20Grey : Palette.textBlack,
          ),
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                ManagementFeedbackForm(),
                ManagementFeedbackAnswersList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
