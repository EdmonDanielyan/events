import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/components/menu_sheet/menu_sheet_item.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'package:logging/logging.dart';

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
          Navigator.of(context).pop();
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
          Navigator.of(context).pop();
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
          Navigator.of(context).pop();
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
          Navigator.of(context).pop();
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
          showDialog(
            context: context,
            builder: (_) => ExitAlertDialog(),
          );
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

class ExitAlertDialog extends StatefulWidget {
  const ExitAlertDialog({Key? key}) : super(key: key);

  @override
  _ExitAlertDialogState createState() => _ExitAlertDialogState();
}

class _ExitAlertDialogState extends State<ExitAlertDialog> {
  bool _deleteCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(localizationInstance.signOffAlertTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(localizationInstance.signOffAlertBody),
          CheckboxListTile(
            contentPadding: const EdgeInsets.all(0),
            value: _deleteCheckbox,
            title: Text(localizationInstance.deleteData),
            onChanged: (check) {
              if (check != null) {
                setState(() {
                  _deleteCheckbox = check;
                });
              }
            },
          )
        ],
      ),
      actions: [
        TextButton(
          child: Text(localizationInstance.cancel),
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            primary: Colors.red,
          ),
        ),
        TextButton(
          child: Text(localizationInstance.yes),
          onPressed: () => _exit(context),
          style: TextButton.styleFrom(
            primary: Colors.blue,
          ),
        ),
      ],
    );
  }

  Future<void> _exit(BuildContext context) async {
    try {
      var messenger = sl<Messenger>();
      await messenger.dispose();
      await Token.deleteTokens();

      if (_deleteCheckbox) {
        await messenger.chatDatabaseCubit.db.deleteEverything();
      }
    } catch (e, s) {
      MenuSheet.logger.severe("Error during sing off", e, s);
    }
    await setup();
    Navigator.pushNamedAndRemoveUntil(context, '/init', (route) => true);
  }
}
