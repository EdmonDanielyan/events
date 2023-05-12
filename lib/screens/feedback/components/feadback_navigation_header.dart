import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';

class FeedbackNavigationHeader extends StatelessWidget {
  final Color askQuestionColor;
  final Color answersColor;

  FeedbackNavigationHeader({
    required this.askQuestionColor,
    required this.answersColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 32.0),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.4,
            child: Text(
              "Задать вопрос",
              style: FontStyles.rubikH2(
                color: askQuestionColor,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.4,
            child: Text(
              "Ответы на вопросы",
              style: FontStyles.rubikH2(
                color: answersColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
