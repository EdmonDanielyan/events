import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/feedback/components/answers/answers_list.dart';
import 'package:ink_mobile/screens/feedback/components/form/form.dart';

import '../feedback_screen.dart';
import 'management_feedback.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PageView(
      children: [
        SingleChildScrollView(
          controller:
              FeedBackScreen.of(context).scrollBottomLoadMoreCubit.scrollController,
          child: Container(
            width: size.width,
            child: ManagementFeedbackForm(),
          ),
        ),
        SingleChildScrollView(
          controller:
          FeedBackScreen.of(context).scrollBottomLoadMoreCubit.scrollController,
          child: Container(
            width: size.width,
            child: ManagementFeedbackAnswersList(),
          ),
        ),
      ],
    );
  }
}
