import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/app.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/handlers/error_catcher.dart';

import 'package:ink_mobile/screens/announcements_list/announcements_list_screen.dart';
import 'package:ink_mobile/screens/auth/auth_screen.dart';
import 'package:ink_mobile/screens/birthdays/birthdays_screen.dart';
import 'package:ink_mobile/screens/error/404_screen.dart';
import 'package:ink_mobile/screens/events_detail/events_detail_screen.dart';
import 'package:ink_mobile/screens/events_list/events_list_screen.dart';
import 'package:ink_mobile/screens/main/main_screen.dart';
import 'package:ink_mobile/screens/news_comments/news_comment_screen.dart';
import 'package:ink_mobile/screens/news_list/news_list_screen.dart';
import 'package:ink_mobile/screens/open_university/open_university_screen.dart';
import 'package:ink_mobile/screens/personnel_movements/personnel_movements_screen.dart';
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
import 'package:ink_mobile/screens/profile/profile_screen.dart';
import 'package:ink_mobile/screens/news_detail/news_detail.dart';
import 'package:ink_mobile/screens/announcements_detail/announcements_detail_screen.dart';
import 'package:ink_mobile/screens/search/search_screen.dart';
import 'package:ink_mobile/screens/initial/initial_screen.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      // exit(1);
    };
    runApp(InkMobile());
  }, (Object error, StackTrace stack) {
      if (error is CustomException) {
        ErrorCatcher catcher = ErrorCatcher.getInstance();

        catcher.onError(error, stack);
      } else {
        print(error);
        print(stack.toString());
        showErrorDialog(ErrorMessages.UNKNOWN_ERROR_MESSAGE);
      }
  });
}

class InkMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    return MaterialApp(
      navigatorKey: App.materialKey,
      title: 'ИНК',
      initialRoute: '/init',
      routes: {
        '/init': (BuildContext context) => InitPage(),
        '/welcome': (BuildContext context) => WelcomeScreen(),
        '/auth': (BuildContext context) => AuthScreen(),
        '/main': (BuildContext context) => MainScreen(),
        '/personal': (BuildContext context) => ProfileScreen(),
        '/news_detail': (BuildContext context) => NewsDetailScreen(),
        '/news_comment': (BuildContext context) => NewsCommentScreen(),
        '/announcement_detail': (BuildContext context) => AnnouncementsDetailScreen(),
        '/search': (BuildContext context) => SearchScreen(),
        '/404': (BuildContext context) => PageNotFoundScreen(),
        '/event_detail': (BuildContext context) => EventDetailScreen(),
        '/events_list': (BuildContext context) => EventsListScreen(),
        '/news_list': (BuildContext context) => NewsListScreen(),
        '/announcements_list': (BuildContext context) => AnnouncementsListScreen(),
        '/services': (BuildContext context) => ServiceListScreen(),
        '/personnel_movements': (BuildContext context) => PersonnelMovementsScreen(),
        '/social_package' : (BuildContext context) => SocialPackageScreen(),
        '/voluntary_medical_insurance' : (BuildContext context) => VoluntaryMedicalInsurance(),
        '/accident_insurance' : (BuildContext context) => AccidentInsurance(),
        '/financial_aid' : (BuildContext context) => FinancialAid(),
        '/children_rest' : (BuildContext context) => ChildrenRest(),
        '/christmas_gifts' : (BuildContext context) => ChristmasGifts(),
        '/recreational_activities' : (BuildContext context) => RecreationalActivities(),
        '/birthdays' : (BuildContext context) => BirthdaysScreen(),
        '/open_university': (BuildContext context) => OpenUniversityScreen(),
        '/test': (BuildContext context) => TestScreen()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Helvetica',
        primaryColor: Color(0xff2b5e4a),
        accentColor: Color(0xFF757678),
        iconTheme: IconThemeData(
          color: Color(0xffbbbbbb)
        ),
      ),
    );
  }
}
