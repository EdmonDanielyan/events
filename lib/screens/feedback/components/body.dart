import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/screens/feedback/components/answers/answers_list.dart';
import 'package:ink_mobile/screens/feedback/components/feadback_navigation_header.dart';
import 'package:ink_mobile/screens/feedback/components/form/form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;
  final pageController = PageController();

  bool get isFirstPageActive => currentIndex == 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Column(
        children: [
          FeedbackNavigationHeader(
            askQuestionColor:
                isFirstPageActive ? Palette.textBlack : Palette.text20Grey,
            answersColor:
                isFirstPageActive ? Palette.text20Grey : Palette.textBlack,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                pageController.jumpToPage(currentIndex);
              });
            },
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: const [
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
