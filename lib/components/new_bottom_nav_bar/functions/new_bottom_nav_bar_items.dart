import 'package:flutter/material.dart';
import 'package:ink_mobile/components/menu_sheet/menu_sheet.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart';
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/answer_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_and_announcements_block_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/main_cubit.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/cubit/references/references_cubit.dart';
import 'package:ink_mobile/cubit/search/search_cubit.dart';
import 'package:ink_mobile/cubit/send_feedback_form/send_form_cubit.dart';
import 'package:ink_mobile/cubit/send_medical_ins_form/send_form_cubit.dart';
import 'package:ink_mobile/cubit/send_reference_form/send_form_cubit.dart';
import 'package:ink_mobile/cubit/tags_list/tags_list_cubit.dart';
import 'package:ink_mobile/functions/navigation_utils.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/chat_list_screen/chat_list_screen.dart';
import 'package:ink_mobile/screens/main/main_screen.dart';
import 'package:ink_mobile/screens/search/search_screen.dart';
import 'package:ink_mobile/screens/service_list/service_list_page_viewer.dart';
import 'package:ink_mobile/setup.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

abstract class NavBottomNavBarItem {
  abstract String icon;
  abstract String label;
  abstract Widget screen;
  void onTap(BuildContext context, Function(int) onChanged, int index);
}

class MainBottomNavBarItem extends NavBottomNavBarItem {
  @override
  String icon = 'assets/svg/home.svg';
  @override
  String label = localizationInstance.home;
  @override
  Widget screen = MainScreen(
    mainAnnouncementsListCubit: getIt<MainAnnouncementsListCubit>(),
    eventsAndAnnouncementsBlockCubit: getIt<EventsAndAnnouncementsBlockCubit>(),
    mainEventsListCubit: getIt<MainEventsListCubit>(),
    mainPageCubit: getIt<MainPageCubit>(),
    newsBlockCubit: getIt<NewsBlockCubit>(),
  );

  @override
  void onTap(BuildContext context, Function onChanged, int index) {
    NavigationUtils(context).popToFirstScreenIfCan();
    onChanged(index);
  }
}

class SearchBottomNavBarItem extends NavBottomNavBarItem {
  @override
  String icon = SEARCH_ICON;
  @override
  String label = localizationInstance.search;
  @override
  Widget screen = SearchScreen(
    searchCubit: getIt<SearchCubit>(),
  );

  @override
  void onTap(BuildContext context, Function onChanged, int index) {
    NavigationUtils(context).popToFirstScreenIfCan();
    onChanged(index);
  }
}

class MessagesBottomNavBarItem extends NavBottomNavBarItem {
  @override
  String icon = 'assets/svg/chat.svg';
  @override
  String label = localizationInstance.messages;

  @override
  Widget screen = const ChatListScreen();

  @override
  void onTap(BuildContext context, Function onChanged, int index) {
    NavigationUtils(context).popToFirstScreenIfCan();
    onChanged(index);
  }
}

class ServicesBottomNavBarItem extends NavBottomNavBarItem {
  @override
  String icon = 'assets/svg/service.svg';
  @override
  String label = localizationInstance.services;
  @override
  Widget screen = ServiceListPageViewer(
      feedbackAnswerListCubit: getIt<FeedbackAnswerListCubit>(),
      referencesPageCubit: getIt<ReferencesPageCubit>(),
      sendManagementFormCubit: getIt<SendManagementFormCubit>(),
      sendMedicalInsFormCubit: getIt<SendMedicalInsFormCubit>(),
      sendReferenceFormCubit: getIt<SendReferenceFormCubit>(),
      tagsListCubit: getIt<TagsListCubit>(),
      selectfieldCubitFeedback: getIt<SelectfieldCubit>(),
      selectfieldCubitMedical: getIt<SelectfieldCubit>(),
      scrollBottomLoadMoreCubit: getIt<ScrollBottomLoadMoreCubit>(
        param1: ScrollBottomLoadMoreState(isOn: false),
      ));

  @override
  void onTap(BuildContext context, Function onChanged, int index) {
    NavigationUtils(context).popToFirstScreenIfCan();
    onChanged(index);

    if (ServiceListPageViewerState.pageViewer.pageController.hasClients) {
      ServiceListPageViewerState.pageViewer.pageController.jumpToPage(0);
    }
  }
}

class MenuBottomNavBarItem extends NavBottomNavBarItem {
  @override
  String icon = 'assets/svg/menu.svg';
  @override
  String label = localizationInstance.menu;
  @override
  Widget screen = const SizedBox.shrink();

  @override
  void onTap(BuildContext context, Function onChanged, int index) {
    showMaterialModalBottomSheet(
      backgroundColor: Palette.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      context: context,
      builder: (context) {
        return const MenuSheet();
      },
    );
  }
}
