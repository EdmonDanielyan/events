import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/menu_sheet/menu_sheet_item.dart';
import 'package:ink_mobile/constants/palette.dart';
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

    return SizedBox(
      height: 324.0,
      width: size.width,
      child: Column(
        children: [
          const SizedBox(height: 7),
          Row(
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
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: _getItemsList(context, localizationInstance),
          ),
        ],
      ),
    );
  }

  List<MenuSheetItem> _getItemsList(
      BuildContext context, AppLocalizations strings) {
    return [
      MenuSheetItem(
        title: strings.news,
        onTap: () {
          Navigator.popAndPushNamed(context, '/news_list',
              arguments: {'filter': 'news'});
        },
        icon: SvgPicture.asset(IconLinks.NEWS_ICON_LINK,
            height: 24.0,
            width: 24.0,
            colorFilter: ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
      ),
      MenuSheetItem(
        title: strings.events,
        onTap: () {
          Navigator.popAndPushNamed(context, '/events_list');
        },
        icon: SvgPicture.asset(IconLinks.CALENDAR_ICON_LINK,
            height: 24.0,
            width: 24.0,
            colorFilter: ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
      ),
      MenuSheetItem(
        title: strings.announcements,
        onTap: () {
          Navigator.popAndPushNamed(context, '/announcements_list');
        },
        icon: SvgPicture.asset(IconLinks.ANNOUNCEMENT_ICON_LINK,
            height: 24.0,
            width: 24.0,
            colorFilter: ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
      ),
      MenuSheetItem(
        title: strings.myData,
        onTap: () {
          Navigator.popAndPushNamed(context, '/personal');
        },
        icon: SvgPicture.asset(IconLinks.USER_ICON_LINK,
            height: 24.0,
            width: 24.0,
            colorFilter: ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
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
        icon: SvgPicture.asset(IconLinks.LOGOUT_ICON_LINK,
            height: 24.0,
            width: 24.0,
            colorFilter: ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
        withBottomDivider: false,
      ),
    ];
  }
}

class ExitAlertDialog extends StatefulWidget {
  final void Function()? onPressed;
  const ExitAlertDialog({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<ExitAlertDialog> createState() => _ExitAlertDialogState();
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
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
          ),
          child: Text(
            localizationInstance.cancel,
            style: TextStyle(
              fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
            ),
          ),
        ),
        TextButton(
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
          ),
          child: Text(
            localizationInstance.yes,
            style: TextStyle(
              fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _exit(BuildContext context) async {
  await getIt<LogoutCubit>().logout();
  getIt<AppTokenProvider>().deleteToken();
  getIt<LocalPinProvider>().removePin();
  getIt<SecureStorage>().deleteAll();
  getIt<MessengerProvider>().dispose();
  getIt<CachedChatsCubit>().clean();
  Token.deleteTokens();
  const FlutterSecureStorage().deleteAll();
  // OneSignal.shared.removeExternalUserId();
  OneSignal.logout();
  Navigator.of(context).popUntil((route) => route.isFirst);
  Navigator.pushReplacementNamed(context, '/init');
}
