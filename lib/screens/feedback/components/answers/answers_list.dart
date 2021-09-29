import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/answer_list_cubit.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/answer_list_state.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/feedback/management_answer.dart';
import 'package:ink_mobile/screens/feedback/components/load_more_btn.dart';

import 'answer_widget.dart';

class ManagementFeedbackAnswersList extends StatelessWidget {
  const ManagementFeedbackAnswersList({Key? key}) : super(key: key);

  static late LanguageStrings _strings;

  void loadMore(FeedbackAnswerListCubit answersCubit, scrollBottomLoaderCubit) {
    answersCubit.fetch();

    //Отключить реагирование на скроллинг вниз, если нет больше элементов
    scrollBottomLoaderCubit.switchIsOn(answersCubit.pagination.next);
  }

  int currentPage(int page) => page - 1;

  void linkScreenToCubit(ScrollBottomLoadMoreCubit cubit, Function loadMore) {
    cubit.setLoadFunction(() => loadMore());
  }

  @override
  Widget build(BuildContext context) {
    final _answers_cubit = BlocProvider.of<FeedbackAnswerListCubit>(context);
    final _scrollBottomLoaderCubit =
        BlocProvider.of<ScrollBottomLoadMoreCubit>(context);
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    linkScreenToCubit(_scrollBottomLoaderCubit,
        () => loadMore(_answers_cubit, _scrollBottomLoaderCubit));

    return BlocBuilder<FeedbackAnswerListCubit, FeedbackAnswerListCubitState>(
      bloc: _answers_cubit,
      builder: (BuildContext context, state) {
        if (state.state == FeedbackAnswerListCubitStateEnums.LOADING) {
          _answers_cubit.fetch();
          return _loadingWidget(context);
        } else if (state.state == FeedbackAnswerListCubitStateEnums.SUCCESS) {
          return _listWidget(
            state.data,
            _answers_cubit,
            () => loadMore(_answers_cubit, _scrollBottomLoaderCubit),
          );
        } else if (state.state == FeedbackAnswerListCubitStateEnums.ERROR) {
          return _errorLoadingWidget();
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
            itemBuilder: (BuildContext context, int index) =>
                AnswerWidget(index: index, item: answers[index]),
          ),
          if (currentPage(cubit.pagination.pageNumber) == 1 &&
              cubit.pagination.next) ...[
            LoadMoreBtn(
              onPressed: () => loadMore(),
              text: _strings.allAnswers,
            ),
          ],
        ],
      ),
    );
  }

  Widget _errorLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        _strings.errorLoadingQuestions,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
