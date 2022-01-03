import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/components/menu_sheet/menu_sheet_item.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/setup.dart';

class MenuSheet extends StatelessWidget {
  const MenuSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 325,
      width: size.width,
      child: Column(children: [
        Container(
            margin: const EdgeInsets.only(top: 7),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
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
          Navigator.pushNamed(context, '/news_list');
        },
        icon: SvgPicture.asset(
          'assets/images/menu_news_icon.svg',
          height: 20,
        ),
      ),
      MenuSheetItem(
        title: strings.events,
        onTap: () {
          Navigator.pushNamed(context, '/events_list');
        },
        icon: SvgPicture.asset(
          'assets/images/menu_events_icon.svg',
          height: 20,
        ),
      ),
      MenuSheetItem(
        title: strings.announcements,
        onTap: () {
          Navigator.pushNamed(context, '/announcements_list');
        },
        icon: SvgPicture.asset(
          'assets/images/menu_announcements_icon.svg',
          height: 20,
        ),
      ),
      MenuSheetItem(
        title: strings.myData,
        onTap: () {
          Navigator.pushNamed(context, '/personal');
        },
        icon: SvgPicture.asset(
          'assets/images/menu_personal_icon.svg',
          height: 20,
        ),
      ),
      MenuSheetItem(
        title: strings.signOff,
        onTap: () async {
          var messenger = sl<Messenger>();
          await messenger.dispose();
          await Token.deleteTokens();
          Navigator.pushNamedAndRemoveUntil(context, '/init', (route) => true);
        },
        icon: SvgPicture.asset(
          'assets/images/exit_icon.svg',
          height: 20,
        ),
        withBottomDivider: false,
      ),
    ];
  }
}
