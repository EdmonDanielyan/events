import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/announcements_detail/announcements_detail_screen.dart';
import 'package:ink_mobile/screens/announcements_list/announcements_list_screen.dart';
import 'package:ink_mobile/screens/app_layer/app_layer_screen.dart';
import 'package:ink_mobile/screens/auth/auth_screen.dart';
import 'package:ink_mobile/screens/birthdays/birthdays_screen.dart';
import 'package:ink_mobile/screens/error/404_screen.dart';
import 'package:ink_mobile/screens/events_detail/events_detail_screen.dart';
import 'package:ink_mobile/screens/events_list/events_list_screen.dart';
import 'package:ink_mobile/screens/feedback/feedback_screen.dart';
import 'package:ink_mobile/screens/initial/initial_screen.dart';
import 'package:ink_mobile/screens/main/main_screen.dart';
import 'package:ink_mobile/screens/medical_insurance/medical_insurance_screen.dart';
import 'package:ink_mobile/screens/messages/chat/chat_screen.dart';
import 'package:ink_mobile/screens/messages/chat_info/chat_info_screen.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/new_group_screen.dart';
import 'package:ink_mobile/screens/news_comments/news_comment_screen.dart';
import 'package:ink_mobile/screens/news_detail/news_detail.dart';
import 'package:ink_mobile/screens/news_list/news_list_screen.dart';
import 'package:ink_mobile/screens/open_university/open_university_screen.dart';
import 'package:ink_mobile/screens/personnel_movements/personnel_movements_screen.dart';
import 'package:ink_mobile/screens/profile/profile_screen.dart';
import 'package:ink_mobile/screens/references/references_screen.dart';
import 'package:ink_mobile/screens/search/search_screen.dart';
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

class MainRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/init': (BuildContext context) => InitPage(),
    '/app_layer': (BuildContext context) => AppLayerScreen(),
    '/welcome': (BuildContext context) => WelcomeScreen(),
    '/auth': (BuildContext context) => AuthScreen(),
    '/main': (BuildContext context) => MainScreen(),
    '/personal': (BuildContext context) => ProfileScreen(),
    '/news_detail': (BuildContext context) => NewsDetailScreen(),
    '/news_comment': (BuildContext context) => NewsCommentScreen(),
    '/announcement_detail': (BuildContext context) =>
        AnnouncementsDetailScreen(),
    '/search': (BuildContext context) => SearchScreen(),
    '/404': (BuildContext context) => PageNotFoundScreen(),
    '/event_detail': (BuildContext context) => EventDetailScreen(),
    '/events_list': (BuildContext context) => EventsListScreen(),
    '/news_list': (BuildContext context) => NewsListScreen(),
    '/announcements_list': (BuildContext context) => AnnouncementsListScreen(),
    '/services': (BuildContext context) => ServiceListScreen(),
    '/feedback': (BuildContext context) => FeedBackScreen(),
    '/references': (BuildContext context) => ReferencesScreen(),
    '/medical_insurance': (BuildContext context) => MedicalInsuranceScreen(),
    '/personnel_movements': (BuildContext context) =>
        PersonnelMovementsScreen(),
    '/social_package': (BuildContext context) => SocialPackageScreen(),
    '/voluntary_medical_insurance': (BuildContext context) =>
        VoluntaryMedicalInsurance(),
    '/accident_insurance': (BuildContext context) => AccidentInsurance(),
    '/financial_aid': (BuildContext context) => FinancialAid(),
    '/children_rest': (BuildContext context) => ChildrenRest(),
    '/christmas_gifts': (BuildContext context) => ChristmasGifts(),
    '/recreational_activities': (BuildContext context) =>
        RecreationalActivities(),
    '/birthdays': (BuildContext context) => BirthdaysScreen(),
    '/open_university': (BuildContext context) => OpenUniversityScreen(),
    '/message': (BuildContext context) => ChatScreen(),
    '/chat_info': (BuildContext context) => ChatInfoScreen(),
    '/new_group': (BuildContext context) => NewGroupScreen(),
    '/test': (BuildContext context) => TestScreen()
  };
}
