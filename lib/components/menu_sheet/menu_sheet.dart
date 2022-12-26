import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/components/menu_sheet/menu_sheet_item.dart';
import 'package:ink_mobile/cubit/logout/logout_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/messenger/providers/app_token.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/local_pin_provider.dart';
import 'package:ink_mobile/providers/secure_storage.dart';
import 'package:ink_mobile/setup.dart';
import 'package:logging/logging.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class MenuSheet extends StatefulWidget {
  static final Logger logger = Logger('MenuSheet');
  const MenuSheet({Key? key}) : super(key: key);

  @override
  State<MenuSheet> createState() => _MenuSheetState();
}

class _MenuSheetState extends State<MenuSheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: SizeConfig(context, 300).getProportionateScreenHeight,
      width: size.width,
      child: Column(children: [
        Container(
            margin: const EdgeInsets.only(top: 7),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: SizeConfig(context, 40).getProportionateScreenHeight,
                  height: SizeConfig(context, 5).getProportionateScreenHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        SizeConfig(context, 5).getProportionateScreenHeight),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                )
              ],
            )),
        Container(
          margin: const EdgeInsets.only(top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: _getItemsList(context, localizationInstance),
          ),
        ),
      ]),
    );
  }

  List<MenuSheetItem> _getItemsList(
      BuildContext context, AppLocalizations strings) {
    return [
      MenuSheetItem(
        title: strings.news,
        onTap: () {
          Navigator.popAndPushNamed(context, '/news_list');
        },
        icon: SvgPicture.asset(
          'assets/images/menu_news_icon.svg',
          height: SizeConfig(context, 18).getProportionateScreenHeight,
        ),
      ),
      MenuSheetItem(
        title: strings.events,
        onTap: () {
          Navigator.popAndPushNamed(context, '/events_list');
        },
        icon: SvgPicture.asset(
          'assets/images/menu_events_icon.svg',
          height: SizeConfig(context, 18).getProportionateScreenHeight,
        ),
      ),
      MenuSheetItem(
        title: strings.announcements,
        onTap: () {
          Navigator.popAndPushNamed(context, '/announcements_list');
        },
        icon: SvgPicture.asset(
          'assets/images/menu_announcements_icon.svg',
          height: SizeConfig(context, 18).getProportionateScreenHeight,
        ),
      ),
      MenuSheetItem(
        title: strings.myData,
        onTap: () {
          Navigator.popAndPushNamed(context, '/personal');
        },
        icon: SvgPicture.asset(
          'assets/images/menu_personal_icon.svg',
          height: SizeConfig(context, 18).getProportionateScreenHeight,
        ),
      ),
      MenuSheetItem(
        title: strings.signOff,
        onTap: () async {
          showDialog(
            context: context,
            builder: (_) => ExitAlertDialog(
              onPressed: () => _exit(_),
            ),
          );
        },
        icon: SvgPicture.asset(
          'assets/images/exit_icon.svg',
          height: SizeConfig(context, 18).getProportionateScreenHeight,
        ),
        withBottomDivider: false,
      ),
    ];
  }
}

class ExitAlertDialog extends StatefulWidget {
  final void Function()? onPressed;
  const ExitAlertDialog({Key? key, required this.onPressed}) : super(key: key);

  @override
  _ExitAlertDialogState createState() => _ExitAlertDialogState();
}

class _ExitAlertDialogState extends State<ExitAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        localizationInstance.signOffAlertTitle,
        style: TextStyle(
          fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizationInstance.signOffAlertBody,
            style: TextStyle(
              fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            localizationInstance.cancel,
            style: TextStyle(
              fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
          ),
        ),
        TextButton(
          child: Text(
            localizationInstance.yes,
            style: TextStyle(
              fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
            ),
          ),
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}

Future<void> _exit(BuildContext context) async {
  getIt<LogoutCubit>().logout();
  getIt<AppTokenProvider>().deleteToken();
  getIt<LocalPinProvider>().removePin();
  getIt<SecureStorage>().deleteAll();
  getIt<MessengerProvider>().dispose();
  getIt<CachedChatsCubit>().clean();
  Token.deleteTokens();
  FlutterSecureStorage().deleteAll();
  OneSignal.shared.removeExternalUserId();

  Navigator.of(context).popUntil((route) => route.isFirst);
  Navigator.pushReplacementNamed(context, '/init');
}
