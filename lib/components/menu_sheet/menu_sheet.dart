import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/components/menu_sheet/menu_sheet_item.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/setup.dart';

class MenuSheet extends StatelessWidget {
  MenuSheet({Key? key}) : super(key: key);
  static late BuildContext _context;
  static late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _context = context;
    _strings = localizationInstance;

    return Container(
      height: 325,
      width: size.width,
      child: Column(children: [
        Container(
            margin: EdgeInsets.only(top: 7),
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
            margin: EdgeInsets.only(top: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _getItemsList(),
            )),
      ]),
    );
  }

  List<MenuSheetItem> _getItemsList() {
    return [
      MenuSheetItem(
        title: _strings.news,
        onTap: () {
          Navigator.pushNamed(_context, '/news_list');
        },
        icon: SvgPicture.asset(
          'assets/images/menu_news_icon.svg',
          height: 20,
        ),
      ),
      MenuSheetItem(
        title: _strings.events,
        onTap: () {
          Navigator.pushNamed(_context, '/events_list');
        },
        icon: SvgPicture.asset(
          'assets/images/menu_events_icon.svg',
          height: 20,
        ),
      ),
      MenuSheetItem(
        title: _strings.announcements,
        onTap: () {
          Navigator.pushNamed(_context, '/announcements_list');
        },
        icon: SvgPicture.asset(
          'assets/images/menu_announcements_icon.svg',
          height: 20,
        ),
      ),
      MenuSheetItem(
        title: _strings.myData,
        onTap: () {
          Navigator.pushNamed(_context, '/personal');
        },
        icon: SvgPicture.asset(
          'assets/images/menu_personal_icon.svg',
          height: 20,
        ),
      ),
      MenuSheetItem(
        title: _strings.signOff,
        onTap: () async {
          await sl<Messenger>().dispose();
          await Token.deleteTokens();
          Navigator.pushNamedAndRemoveUntil(
              _context, '/auth', (route) => false);
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
