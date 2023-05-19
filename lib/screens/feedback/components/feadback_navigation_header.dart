import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';

class FeedbackNavigationHeader extends StatelessWidget {
  final Color askQuestionColor;
  final Color answersColor;
  final Function onTap;

  FeedbackNavigationHeader({
    required this.askQuestionColor,
    required this.answersColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 32.0),
      child: Row(
        children: [
          InkWell(
            onTap: () => onTap(0),
            child: SizedBox(
              width: size.width * 0.4,
              child: Text(
                "Задать вопрос",
                style: FontStyles.rubikH2(
                  color: askQuestionColor,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => onTap(1),
            child: SizedBox(
              width: size.width * 0.4,
              child: Text(
                "Ответы на вопросы",
                style: FontStyles.rubikH2(
                  color: answersColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
