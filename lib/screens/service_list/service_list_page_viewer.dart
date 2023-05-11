import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/back_btn.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/answer_list_cubit.dart';
import 'package:ink_mobile/cubit/references/references_cubit.dart';
import 'package:ink_mobile/cubit/send_feedback_form/send_form_cubit.dart';
import 'package:ink_mobile/cubit/send_medical_ins_form/send_form_cubit.dart';
import 'package:ink_mobile/cubit/send_reference_form/send_form_cubit.dart';
import 'package:ink_mobile/cubit/tags_list/tags_list_cubit.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/page_viewer.dart';
import 'package:ink_mobile/screens/feedback/feedback_screen.dart';
import 'package:ink_mobile/screens/medical_insurance/medical_insurance_screen.dart';
import 'package:ink_mobile/screens/references/references_screen.dart';
import 'package:ink_mobile/screens/service_list/service_list_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceListPageViewer extends StatefulWidget {
  final FeedbackAnswerListCubit feedbackAnswerListCubit;
  final ReferencesPageCubit referencesPageCubit;
  final SendManagementFormCubit sendManagementFormCubit;
  final SendMedicalInsFormCubit sendMedicalInsFormCubit;
  final SendReferenceFormCubit sendReferenceFormCubit;
  final TagsListCubit tagsListCubit;
  final SelectfieldCubit selectfieldCubitFeedback;
  final SelectfieldCubit selectfieldCubitMedical;
  final ScrollBottomLoadMoreCubit scrollBottomLoadMoreCubit;

  const ServiceListPageViewer({
    Key? key,
    required this.feedbackAnswerListCubit,
    required this.referencesPageCubit,
    required this.sendManagementFormCubit,
    required this.sendMedicalInsFormCubit,
    required this.sendReferenceFormCubit,
    required this.tagsListCubit,
    required this.selectfieldCubitFeedback,
    required this.selectfieldCubitMedical,
    required this.scrollBottomLoadMoreCubit,
  }) : super(key: key);

  @override
  ServiceListPageViewerState createState() => ServiceListPageViewerState();
}

class ServiceListPageViewerState extends State<ServiceListPageViewer> {
  static PageViewer pageViewer = PageViewer(pageController: PageController());
  late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return Scaffold(
      body: PageView(
        controller: pageViewer.pageController,
        children: [
          ServiceListScreen(),
          feedBackScreen(context),
          referencesScreen(context),
          medicalInsuranceScreen(context),
        ],
        onPageChanged: (page) {
          TextFieldUtils.loseTextFieldFocus();
          pageViewer.onPageChanged(page);
        },
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget feedBackScreen(BuildContext context) {
    return wrapWithWillPop(
      child: FeedBackScreen(
        sendManagementFormCubit: widget.sendManagementFormCubit,
        feedbackAnswerListCubit: widget.feedbackAnswerListCubit,
        tagsListCubit: widget.tagsListCubit,
        selectfieldCubit: widget.selectfieldCubitFeedback,
        scrollBottomLoadMoreCubit: widget.scrollBottomLoadMoreCubit,
        appBar: appBar(context, _strings.feedback),
        bottomNavigationBar: SizedBox(),
      ),
    );
  }

  Widget referencesScreen(BuildContext context) {
    return wrapWithWillPop(
      child: ReferencesScreen(
        appBar: appBar(context, _strings.orderInquiry),
        referencesPageCubit: widget.referencesPageCubit,
        sendReferenceFormCubit: widget.sendReferenceFormCubit,
      ),
    );
  }

  Widget medicalInsuranceScreen(BuildContext context) {
    return wrapWithWillPop(
      child: MedicalInsuranceScreen(
        appBar: appBar(context, _strings.getMedicalInsurance),
        sendMedicalInsFormCubit: widget.sendMedicalInsFormCubit,
        selectFieldCubit: widget.selectfieldCubitMedical,
      ),
    );
  }

  PreferredSizeWidget appBar(BuildContext context, String title) {
    return InkAppBar(
      context,
      title: title,
      leading: AppBarBackBtn(
        onPressed: () => jumpToMainPage(),
      ),
      showPersonalPageLink: true,
    );
  }

  Widget wrapWithWillPop({required Widget child}) {
    return WillPopScope(
      onWillPop: () async {
        jumpToMainPage();
        return Future.value(false);
      },
      child: child,
    );
  }

  void jumpToMainPage() => pageViewer.pageController.jumpToPage(0);
}
