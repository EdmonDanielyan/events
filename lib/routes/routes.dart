import 'package:flutter/material.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/cubit/announcements_detail/announcements_detail_cubit.dart';
import 'package:ink_mobile/cubit/announcements_list/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/cubit/birthdays/birthdays_cubit.dart';
import 'package:ink_mobile/cubit/events_detail/events_detail_cubit.dart';
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart';
import 'package:ink_mobile/cubit/learning_materials_list/learning_materials_list_cubit.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/cubit/news_list/news_list_cubit.dart';
import 'package:ink_mobile/cubit/personnel_movements/personnel_movements_cubit.dart';
import 'package:ink_mobile/cubit/profile/profile_cubit.dart';
import 'package:ink_mobile/models/chat/person_list_params.dart';
import 'package:ink_mobile/screens/announcements_detail/announcements_detail_screen.dart';
import 'package:ink_mobile/screens/announcements_list/announcements_list_screen.dart';
import 'package:ink_mobile/screens/app_layer/app_layer_screen.dart';
import 'package:ink_mobile/screens/auth/auth_screen.dart';
import 'package:ink_mobile/screens/birthdays/birthdays_screen.dart';
import 'package:ink_mobile/screens/error/404_screen.dart';
import 'package:ink_mobile/screens/events_detail/events_detail_screen.dart';
import 'package:ink_mobile/screens/events_list/events_list_screen.dart';
import 'package:ink_mobile/screens/initial/initial_screen.dart';
import 'package:ink_mobile/screens/messages/chat/chat_screen.dart';
import 'package:ink_mobile/screens/messages/chat_info/chat_info_screen.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/new_group_screen.dart';
import 'package:ink_mobile/screens/messages/person_list/person_list_screen.dart';
import 'package:ink_mobile/screens/news_comments/news_comment_screen.dart';
import 'package:ink_mobile/screens/news_detail/news_detail.dart';
import 'package:ink_mobile/screens/news_list/news_list_screen.dart';
import 'package:ink_mobile/screens/open_university/cubit/open_university_cubit.dart';
import 'package:ink_mobile/screens/open_university/open_university_screen.dart';
import 'package:ink_mobile/screens/personnel_movements/personnel_movements_screen.dart';
import 'package:ink_mobile/screens/profile/profile_screen.dart';
import 'package:ink_mobile/screens/service_list/service_list_screen.dart';
import 'package:ink_mobile/screens/social_package/content/accident_insurance.dart';
import 'package:ink_mobile/screens/social_package/content/children_rest.dart';
import 'package:ink_mobile/screens/social_package/content/christmas_gifts.dart';
import 'package:ink_mobile/screens/social_package/content/financial_aid.dart';
import 'package:ink_mobile/screens/social_package/content/recreational_activities.dart';
import 'package:ink_mobile/screens/social_package/content/voluntary_medical_insurance.dart';
import 'package:ink_mobile/screens/social_package/social_package_screen.dart';
import 'package:ink_mobile/screens/test/test_screen.dart';
import 'package:ink_mobile/screens/welcome/welcome_screen.dart';
import 'package:ink_mobile/setup.dart';

class MainRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/init': (BuildContext context) => InitPage(),
    '/app_layer': (BuildContext context) => AppLayerScreen(
          newBottomNavBarCubit: sl.get<NewBottomNavBarCubit>(),
        ),
    '/welcome': (BuildContext context) => WelcomeScreen(),
    '/auth': (BuildContext context) => AuthScreen(
          authCubit: sl.get<AuthCubit>(),
          newBottomNavBarCubit: sl.get<NewBottomNavBarCubit>(),
        ),
    '/personal': (BuildContext context) => ProfileScreen(
          profileCubit: sl.get<ProfileCubit>(),
        ),
    '/news_detail': (BuildContext context) => NewsDetailScreen(
          newsDetailCubit: sl.get<NewsDetailCubit>(),
        ),
    '/news_comment': (BuildContext context) => NewsCommentScreen(
          newsCommentsCubit: sl.get<NewsCommentsCubit>(),
        ),
    '/announcement_detail': (BuildContext context) => AnnouncementsDetailScreen(
          announcementCubit: sl.get<AnnouncementCubit>(),
        ),
    '/404': (BuildContext context) => PageNotFoundScreen(),
    '/event_detail': (BuildContext context) => EventDetailScreen(
          eventDetailCubit: sl.get<EventDetailCubit>(),
        ),
    '/events_list': (BuildContext context) => EventsListScreen(
          eventsListCubit: sl.get<EventsListCubit>(),
        ),
    '/news_list': (BuildContext context) => NewsListScreen(
          newsListCubit: sl.get<NewsListCubit>(),
        ),
    '/announcements_list': (BuildContext context) => AnnouncementsListScreen(
          announcementsListCubit: sl.get<AnnouncementsListCubit>(),
        ),
    '/services': (BuildContext context) => ServiceListScreen(),
    '/personnel_movements': (BuildContext context) => PersonnelMovementsScreen(
          personnelMovementsCubit: sl.get<PersonnelMovementsCubit>(),
        ),
    '/social_package': (BuildContext context) => SocialPackageScreen(),
    '/voluntary_medical_insurance': (BuildContext context) =>
        VoluntaryMedicalInsurance(),
    '/accident_insurance': (BuildContext context) => AccidentInsurance(),
    '/financial_aid': (BuildContext context) => FinancialAid(),
    '/children_rest': (BuildContext context) => ChildrenRest(),
    '/christmas_gifts': (BuildContext context) => ChristmasGifts(),
    '/recreational_activities': (BuildContext context) =>
        RecreationalActivities(),
    '/birthdays': (BuildContext context) => BirthdaysScreen(
          birthdaysCubit: sl.get<BirthdaysCubit>(),
        ),
    '/open_university': (BuildContext context) => OpenUniversityScreen(
          eventsListCubit: sl.get<EventsListCubit>(),
          learningMaterialsListCubit: sl.get<LearningMaterialsListCubit>(),
          newsListCubit: sl.get<NewsListCubit>(),
          openUniversityCubit: sl.get<OpenUniversityCubit>(),
        ),
    '/message': (BuildContext context) => ChatScreen(),
    '/chat_info': (BuildContext context) => ChatInfoScreen(),
    '/new_group': (BuildContext context) => NewGroupScreen(),
    '/message_person_list': (BuildContext context) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is PersonListParams) {
        return PersonListScreen(params: args);
      } else {
        return PageNotFoundScreen();
      }
    },
    '/test': (BuildContext context) => TestScreen()
  };
}
