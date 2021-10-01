import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/answer_list_cubit.dart';
import 'package:ink_mobile/cubit/send_feedback_form/send_form_cubit.dart';
import 'package:ink_mobile/cubit/tags_list/tags_list_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

import 'management_feedback.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _cubit = BlocProvider.of<ScrollBottomLoadMoreCubit>(context);
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return SingleChildScrollView(
      controller: _cubit.scrollController,
      child: Container(
        width: size.width,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    SendManagementFormCubit(languageStrings: _strings)),
            BlocProvider(
                create: (context) =>
                    FeedbackAnswerListCubit(languageStrings: _strings)),
            BlocProvider(
                create: (context) => TagsListCubit(languageStrings: _strings)),
            BlocProvider(create: (context) => SelectfieldCubit()),
          ],
          child: ManagementFeedback(),
        ),
      ),
    );
  }
}
