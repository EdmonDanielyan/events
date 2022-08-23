import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/components/loader/error_loading_widget.dart';
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/answer_list_cubit.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/answer_list_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/feedback/management_answer.dart';
import 'package:ink_mobile/screens/feedback/components/load_more_btn.dart';

import '../../feedback_screen.dart';
import 'answer_widget.dart';

class ManagementFeedbackAnswersList extends StatelessWidget {
  const ManagementFeedbackAnswersList({Key? key}) : super(key: key);
  static late ScrollBottomLoadMoreCubit scrollBottomLoadMoreCubit;

  void loadMore(FeedbackAnswerListCubit answersCubit) {
    answersCubit.fetch();

    //Отключить реагирование на скроллинг вниз, если нет больше элементов
    scrollBottomLoadMoreCubit.switchIsOn(answersCubit.pagination.next);
  }

  int currentPage(int page) => page - 1;

  void linkScreenToCubit(Function loadMore) {
    scrollBottomLoadMoreCubit.setLoadFunction(() => loadMore());
  }

  @override
  Widget build(BuildContext context) {
    final _answersCubit = FeedBackScreen.of(context).feedbackAnswerListCubit;
    scrollBottomLoadMoreCubit =
        FeedBackScreen.of(context).scrollBottomLoadMoreCubit;

    linkScreenToCubit(() => loadMore(_answersCubit));

    return BlocBuilder<FeedbackAnswerListCubit, FeedbackAnswerListCubitState>(
      bloc: _answersCubit,
      builder: (BuildContext context, state) {
        if (state.state == FeedbackAnswerListCubitStateEnums.LOADING) {
          _answersCubit.fetch();
          return _loadingWidget(context);
        } else if (state.state == FeedbackAnswerListCubitStateEnums.SUCCESS) {
          return _listWidget(
            state.data,
            _answersCubit,
            () => loadMore(_answersCubit),
          );
        } else if (state.state == FeedbackAnswerListCubitStateEnums.ERROR) {
          return ErrorLoadingWidget(
              errorMsg: localizationInstance.errorLoadingQuestions);
        }

        return SizedBox();
      },
    );
  }

  Widget _loadingWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomCircularProgressIndicator(),
    );
  }

  Widget _listWidget(List<ManagementAnswer> answers,
      FeedbackAnswerListCubit cubit, Function loadMore) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            controller: ScrollController(keepScrollOffset: false),
            itemCount: answers.length,
            itemBuilder: (BuildContext context, int index) => AnswerWidget(
              index: index,
              item: answers[index],
            ),
          ),
          if (currentPage(cubit.pagination.pageNumber) == 1 &&
              cubit.pagination.next) ...[
            LoadMoreBtn(
              onPressed: () => loadMore(),
              text: localizationInstance.allAnswers,
            ),
          ],
        ],
      ),
    );
  }
}
