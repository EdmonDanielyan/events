import 'package:flutter/material.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/cubit/announcements_detail/announcements_detail_cubit.dart';
import 'package:ink_mobile/cubit/announcements_list/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/cubit/birthdays/birthdays_cubit.dart';
import 'package:ink_mobile/cubit/events_detail/events_detail_cubit.dart';
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart';
import 'package:ink_mobile/cubit/learning_materials_list/learning_materials_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/cubit/news_list/news_list_cubit.dart';
import 'package:ink_mobile/cubit/personnel_movements/personnel_movements_cubit.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/screens/announcements_detail/announcements_detail_screen.dart';
import 'package:ink_mobile/screens/announcements_list/announcements_list_screen.dart';
import 'package:ink_mobile/screens/app_layer/app_layer_screen.dart';
import 'package:ink_mobile/screens/auth/auth_screen.dart';
import 'package:ink_mobile/screens/birthdays/birthdays_screen.dart';
import 'package:ink_mobile/screens/config/config_screen.dart';
import 'package:ink_mobile/screens/error/404_screen.dart';
import 'package:ink_mobile/screens/events_detail/events_detail_screen.dart';
import 'package:ink_mobile/screens/events_list/events_list_screen.dart';
import 'package:ink_mobile/screens/initial/initial_screen.dart';
import 'package:ink_mobile/screens/news_comments/news_comment_screen.dart';
import 'package:ink_mobile/screens/news_detail/news_detail.dart';
import 'package:ink_mobile/screens/news_list/news_list_screen.dart';
import 'package:ink_mobile/screens/open_university/cubit/open_university_cubit.dart';
import 'package:ink_mobile/screens/open_university/open_university_screen.dart';
import 'package:ink_mobile/screens/personnel_movements/personnel_movements_screen.dart';
import 'package:ink_mobile/screens/profile/profile_screen.dart';
import 'package:ink_mobile/screens/service_list/service_list_screen.dart';
import 'package:ink_mobile/screens/set_pin_code/set_pin_code_screen.dart';
import 'package:ink_mobile/screens/social_package/content/accident_insurance.dart';
import 'package:ink_mobile/screens/social_package/content/anniversary_bonus.dart';
import 'package:ink_mobile/screens/social_package/content/children_rest.dart';
import 'package:ink_mobile/screens/social_package/content/christmas_gifts.dart';
import 'package:ink_mobile/screens/social_package/content/compensation_travel.dart';
import 'package:ink_mobile/screens/social_package/content/financial_aid.dart';
import 'package:ink_mobile/screens/social_package/content/recreational_activities.dart';
import 'package:ink_mobile/screens/social_package/content/voluntary_medical_insurance.dart';
import 'package:ink_mobile/screens/social_package/social_package_screen.dart';
import 'package:ink_mobile/screens/test/test_screen.dart';
import 'package:ink_mobile/screens/welcome/welcome_screen.dart';
import 'package:ink_mobile/setup.dart';

import '../cubit/main_page/announcements_list_cubit.dart';

class MainRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/init': (BuildContext context) => InitPage(
          cubit: getIt(),
        ),
    '/app_layer': (BuildContext context) => AppLayerScreen(
          newBottomNavBarCubit: getIt<NewBottomNavBarCubit>(),
        ),
    '/config': (BuildContext context) => ConfigScreen(
          packageInfoProvider: getIt<PackageInfoProvider>(),
          env: currentEnv,
        ),
    '/welcome': (BuildContext context) => WelcomeScreen(
          packageInfoProvider: getIt<PackageInfoProvider>(),
        ),
    '/auth': (BuildContext context) => AuthScreen(
          authCubit: getIt<AuthCubit>(),
          newBottomNavBarCubit: getIt<NewBottomNavBarCubit>(),
          // chatDatabaseCubit: getIt<ChatDatabaseCubit>(),
        ),
    '/personal': (BuildContext context) => ProfileScreen(
        profileCubit: getIt(), logFile: getIt(instanceName: "logFile")),
    '/news_detail': (BuildContext context) => NewsDetailScreen(
          newsDetailCubit: getIt<NewsDetailCubit>(),
          newsBlockCubit: getIt<NewsBlockCubit>(),
          newsListCubit: getIt<NewsListCubit>(),
        ),
    '/news_comment': (BuildContext context) => NewsCommentScreen(
          newsCommentsCubit: getIt<NewsCommentsCubit>(),
          newsBlockCubit: getIt<NewsBlockCubit>(),
        ),
    '/announcement_detail': (BuildContext context) => AnnouncementsDetailScreen(
          announcementCubit: getIt<AnnouncementCubit>(),
          mainAnnouncementsListCubit: getIt<MainAnnouncementsListCubit>(),
          announcementsListCubit: getIt<AnnouncementsListCubit>(),
        ),
    '/404': (BuildContext context) => PageNotFoundScreen(),
    '/event_detail': (BuildContext context) => EventDetailScreen(
          eventDetailCubit: getIt<EventDetailCubit>(),
        ),
    '/events_list': (BuildContext context) => EventsListScreen(
          eventsListCubit: getIt<EventsListCubit>(),
        ),
    '/news_list': (BuildContext context) => NewsListScreen(
          newsListCubit: getIt<NewsListCubit>(),
        ),
    '/announcements_list': (BuildContext context) => AnnouncementsListScreen(
          announcementsListCubit: getIt<AnnouncementsListCubit>(),
        ),
    '/services': (BuildContext context) => ServiceListScreen(),
    '/personnel_movements': (BuildContext context) => PersonnelMovementsScreen(
          personnelMovementsCubit: getIt<PersonnelMovementsCubit>(),
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
          birthdaysCubit: getIt<BirthdaysCubit>(),
        ),
    '/open_university': (BuildContext context) => OpenUniversityScreen(
          eventsListCubit: getIt<EventsListCubit>(),
          learningMaterialsListCubit: getIt<LearningMaterialsListCubit>(),
          newsListCubit: getIt<NewsListCubit>(),
          openUniversityCubit: getIt<OpenUniversityCubit>(),
        ),
    '/test': (BuildContext context) => TestScreen(),
    '/set_pin': (BuildContext context) => SetPinCodeScreen(),
    '/anniversary_bonus': (BuildContext context) => AnniversaryBonus(),
    '/compensation_travel': (BuildContext context) => CompensationTravel(),
  };
}
