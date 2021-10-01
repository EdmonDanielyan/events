import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/screens/feedback/components/answers/answers_list.dart';
import 'package:ink_mobile/screens/feedback/components/form/form.dart';
import 'package:ink_mobile/screens/feedback/components/questions_header.dart';

class ManagementFeedback extends StatelessWidget {
  const ManagementFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ManagementFeedbackForm(),
        Divider(color: Colors.grey, height: 2.0),
        QuestionsHeader(text: _strings.answersToQuestions),
        Divider(color: Colors.grey, height: 2.0),
        ManagementFeedbackAnswersList(),
      ],
    );
  }
}
