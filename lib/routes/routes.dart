import 'package:flutter/material.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
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
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/person_list_params.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/screens/chat/chat_screen.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/chat_screen_params.dart';
import 'package:ink_mobile/messenger/screens/chat_info/chat_info_screen.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/new_group_screen.dart';
import 'package:ink_mobile/messenger/screens/person_list/person_list_screen.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/screens/announcements_detail/announcements_detail_screen.dart';
import 'package:ink_mobile/screens/announcements_list/announcements_list_screen.dart';
import 'package:ink_mobile/screens/app_layer/app_layer_screen.dart';
import 'package:ink_mobile/screens/auth/auth_screen.dart';
import 'package:ink_mobile/screens/birthdays/birthdays_screen.dart';
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

import '../cubit/main_page/announcements_list_cubit.dart';

class MainRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/init': (BuildContext context) => InitPage(
          cubit: sl()..load(),
        ),
    '/app_layer': (BuildContext context) => AppLayerScreen(
          newBottomNavBarCubit: sl<NewBottomNavBarCubit>(),
        ),
    '/welcome': (BuildContext context) => WelcomeScreen(
          packageInfoProvider: sl<PackageInfoProvider>(),
        ),
    '/auth': (BuildContext context) => AuthScreen(
          authCubit: sl<AuthCubit>(),
          newBottomNavBarCubit: sl<NewBottomNavBarCubit>(),
          // chatDatabaseCubit: sl<ChatDatabaseCubit>(),
        ),
    '/personal': (BuildContext context) => ProfileScreen(
        profileCubit: sl(),
        chatDatabaseCubit: sl<ChatDatabaseCubit>(),
        logFile: sl(instanceName: "logFile")),
    '/news_detail': (BuildContext context) => NewsDetailScreen(
          newsDetailCubit: sl<NewsDetailCubit>(),
          newsBlockCubit: sl<NewsBlockCubit>(),
          newsListCubit: sl<NewsListCubit>(),
        ),
    '/news_comment': (BuildContext context) => NewsCommentScreen(
          newsCommentsCubit: sl<NewsCommentsCubit>(),
          newsBlockCubit: sl<NewsBlockCubit>(),
        ),
    '/announcement_detail': (BuildContext context) => AnnouncementsDetailScreen(
          announcementCubit: sl<AnnouncementCubit>(),
          mainAnnouncementsListCubit: sl<MainAnnouncementsListCubit>(),
          announcementsListCubit: sl<AnnouncementsListCubit>(),
        ),
    '/404': (BuildContext context) => PageNotFoundScreen(),
    '/event_detail': (BuildContext context) => EventDetailScreen(
          eventDetailCubit: sl<EventDetailCubit>(),
        ),
    '/events_list': (BuildContext context) => EventsListScreen(
          eventsListCubit: sl<EventsListCubit>(),
        ),
    '/news_list': (BuildContext context) => NewsListScreen(
          newsListCubit: sl<NewsListCubit>(),
        ),
    '/announcements_list': (BuildContext context) => AnnouncementsListScreen(
          announcementsListCubit: sl<AnnouncementsListCubit>(),
        ),
    '/services': (BuildContext context) => ServiceListScreen(),
    '/personnel_movements': (BuildContext context) => PersonnelMovementsScreen(
          personnelMovementsCubit: sl<PersonnelMovementsCubit>(),
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
          birthdaysCubit: sl<BirthdaysCubit>(),
          chatDatabaseCubit: sl<ChatDatabaseCubit>(),
        ),
    '/open_university': (BuildContext context) => OpenUniversityScreen(
          eventsListCubit: sl<EventsListCubit>(),
          learningMaterialsListCubit: sl<LearningMaterialsListCubit>(),
          newsListCubit: sl<NewsListCubit>(),
          openUniversityCubit: sl<OpenUniversityCubit>(),
        ),
    '/message': (BuildContext context) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is ChatScreenParams) {
        return ChatScreen(
          chatScreenParams: args,
          messenger: sl<Messenger>(),
          selectableCubit: SelectableCubit<MessageWithUser>(),
          chatFunctions: sl(),
        );
      }
      return _pageNotFound();
    },
    '/chat_info': (BuildContext context) => ChatInfoScreen(
          chatDatabaseCubit: sl<ChatDatabaseCubit>(),
          selectableCubit: SelectableCubit<UserTable>(),
          chatPersonListCubit: sl.get<ChatPersonListCubit>(),
        ),
    '/new_group': (BuildContext context) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is SelectableCubit<UserTable>) {
        return NewGroupScreen(
          chatDatabaseCubit: sl<ChatDatabaseCubit>(),
          selectableCubit: args,
        );
      }
      return _pageNotFound();
    },
    '/message_person_list': (BuildContext context) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is PersonListParams) {
        return PersonListScreen(
          params: args,
          chatDatabaseCubit: sl<ChatDatabaseCubit>(),
        );
      }

      return _pageNotFound();
    },
    '/test': (BuildContext context) => TestScreen()
  };

  static Widget _pageNotFound() => PageNotFoundScreen();
}
