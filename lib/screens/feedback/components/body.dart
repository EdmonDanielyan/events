import 'package:flutter/material.dart';

import '../feedback_screen.dart';
import 'management_feedback.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      controller:
          FeedBackScreen.of(context).scrollBottomLoadMoreCubit.scrollController,
      child: Container(
        width: size.width,
        child: ManagementFeedback(),
      ),
    );
  }
}
