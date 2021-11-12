import 'package:flutter/material.dart';
import 'package:ink_mobile/components/menu_sheet/menu_sheet.dart';
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart';
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
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
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/main/main_screen.dart';
import 'package:ink_mobile/screens/messages/chat_list/chat_list_screen.dart';
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
  String icon = 'assets/images/home.svg';
  String label = localizationInstance.home;
  Widget screen = MainScreen(
    mainAnnouncementsListCubit: sl<MainAnnouncementsListCubit>(),
    eventsAndAnnouncementsBlockCubit:
        sl<EventsAndAnnouncementsBlockCubit>(),
    mainEventsListCubit: sl<MainEventsListCubit>(),
    mainPageCubit: sl<MainPageCubit>(),
    newsBlockCubit: sl<NewsBlockCubit>(),
  );

  void onTap(BuildContext context, Function onChanged, int index) {
    NavigationUtils.popScreenIfCan(context);
    onChanged(index);
  }
}

class SearchBottomNavBarItem extends NavBottomNavBarItem {
  String icon = 'assets/images/search.svg';
  String label = localizationInstance.search;
  Widget screen = SearchScreen(
    searchCubit: sl<SearchCubit>(),
  );

  void onTap(BuildContext context, Function onChanged, int index) {
    NavigationUtils.popScreenIfCan(context);
    onChanged(index);
  }
}

class MessagesBottomNavBarItem extends NavBottomNavBarItem {
  String icon = 'assets/images/message.svg';
  String label = localizationInstance.messages;
  Widget screen = ChatListScreen(
    chatDatabaseCubit: sl<ChatDatabaseCubit>(),
    selectableCubit: SelectableCubit<UserTable>(),
    chatPersonListCubit: sl<ChatPersonListCubit>(),
  );

  void onTap(BuildContext context, Function onChanged, int index) {
    NavigationUtils.popScreenIfCan(context);
    onChanged(index);
  }
}

class ServicesBottomNavBarItem extends NavBottomNavBarItem {
  String icon = 'assets/images/services.svg';
  String label = localizationInstance.services;
  Widget screen = ServiceListPageViewer(
      feedbackAnswerListCubit: sl<FeedbackAnswerListCubit>(),
      referencesPageCubit: sl<ReferencesPageCubit>(),
      sendManagementFormCubit: sl<SendManagementFormCubit>(),
      sendMedicalInsFormCubit: sl<SendMedicalInsFormCubit>(),
      sendReferenceFormCubit: sl<SendReferenceFormCubit>(),
      tagsListCubit: sl<TagsListCubit>(),
      selectfieldCubitFeedback: sl<SelectfieldCubit>(),
      selectfieldCubitMedical: sl<SelectfieldCubit>(),
      scrollBottomLoadMoreCubit: sl<ScrollBottomLoadMoreCubit>(
        param1: ScrollBottomLoadMoreState(isOn: false),
      ));

  void onTap(BuildContext context, Function onChanged, int index) {
    NavigationUtils.popScreenIfCan(context);
    onChanged(index);
  }
}

class MenuBottomNavBarItem extends NavBottomNavBarItem {
  String icon = 'assets/images/menu.svg';
  String label = localizationInstance.menu;
  Widget screen = SizedBox();

  void onTap(BuildContext context, Function onChanged, int index) {
    showMaterialModalBottomSheet(
      backgroundColor: Color(0xfff9f9f9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return MenuSheet();
      },
    );
  }
}
