import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/answer_list_cubit.dart';
import 'package:ink_mobile/cubit/send_feedback_form/send_form_cubit.dart';
import 'package:ink_mobile/cubit/tags_list/tags_list_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/feedback/components/body.dart';

class FeedBackScreen extends StatefulWidget {
  static FeedBackScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<FeedBackScreenState>()!;

  final SendManagementFormCubit sendManagementFormCubit;
  final FeedbackAnswerListCubit feedbackAnswerListCubit;
  final TagsListCubit tagsListCubit;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final SelectfieldCubit selectfieldCubit;
  final ScrollBottomLoadMoreCubit scrollBottomLoadMoreCubit;

  const FeedBackScreen({
    Key? key,
    this.appBar,
    this.bottomNavigationBar,
    required this.tagsListCubit,
    required this.sendManagementFormCubit,
    required this.feedbackAnswerListCubit,
    required this.selectfieldCubit,
    required this.scrollBottomLoadMoreCubit,
  }) : super(key: key);

  @override
  FeedBackScreenState createState() => FeedBackScreenState();
}

class FeedBackScreenState extends State<FeedBackScreen>
    with AutomaticKeepAliveClientMixin {
  FeedbackAnswerListCubit get feedbackAnswerListCubit =>
      widget.feedbackAnswerListCubit;
  SendManagementFormCubit get sendManagementFormCubit =>
      widget.sendManagementFormCubit;
  TagsListCubit get tagsListCubit => widget.tagsListCubit;
  SelectfieldCubit get selectfieldCubit => widget.selectfieldCubit;
  ScrollBottomLoadMoreCubit get scrollBottomLoadMoreCubit =>
      widget.scrollBottomLoadMoreCubit;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _strings = localizationInstance;
    return Scaffold(
      appBar:
          widget.appBar ?? InkAppBarWithText(context, title: _strings.feedback),
      body: Body(),
      bottomNavigationBar:
          widget.bottomNavigationBar ?? const NewBottomNavBar(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
