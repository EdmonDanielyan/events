import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/back_btn.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/page_viewer.dart';
import 'package:ink_mobile/screens/feedback/feedback_screen.dart';
import 'package:ink_mobile/screens/medical_insurance/medical_insurance_screen.dart';
import 'package:ink_mobile/screens/references/references_screen.dart';
import 'package:ink_mobile/screens/service_list/service_list_screen.dart';

class ServiceListPageViewer extends StatefulWidget {
  const ServiceListPageViewer({Key? key}) : super(key: key);

  @override
  ServiceListPageViewerState createState() => ServiceListPageViewerState();
}

class ServiceListPageViewerState extends State<ServiceListPageViewer> {
  static PageViewer pageViewer = PageViewer(pageController: PageController());
  late LanguageStrings _strings;

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return Scaffold(
      body: BlocListener<NewBottomNavBarCubit, int>(
        listener: (context, state) {
          print(state);
        },
        child: PageView(
          controller: pageViewer.pageController,
          children: [
            ServiceListScreen(),
            feedBackScreen(),
            referencesScreen(),
            medicalInsuranceScreen(),
          ],
          onPageChanged: pageViewer.onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget feedBackScreen() {
    return wrapWithWillPop(
      child: FeedBackScreen(
        appBar: appBar(_strings.feedback),
        bottomNavigationBar: SizedBox(),
      ),
    );
  }

  Widget referencesScreen() {
    return wrapWithWillPop(
      child: ReferencesScreen(
        appBar: appBar(_strings.orderInquiry),
      ),
    );
  }

  Widget medicalInsuranceScreen() {
    return wrapWithWillPop(
      child: MedicalInsuranceScreen(
        appBar: appBar(_strings.getMedicalInsurance),
      ),
    );
  }

  PreferredSizeWidget appBar(String title) {
    return InkAppBarWithText(
      title: title,
      leading: AppBarBackBtn(
        onPressed: () => jumpToMainPage(),
      ),
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
