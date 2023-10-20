import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/contacts_row.dart';
import 'package:ink_mobile/screens/profile/components/section_title.dart';

class Contacts extends StatelessWidget {
  static late AppLocalizations _strings;
  final UserContacts? contacts;
  const Contacts({Key? key, required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    if (contacts != null) {
      return getContactsWidget(context);
    }
    return SliverToBoxAdapter(child: const SizedBox.shrink());
  }

  getContactsWidget(BuildContext context) {
    if (contacts!.workPhone != null ||
        contacts!.mobilePhone != null ||
        contacts!.workMobilePhone != null ||
        contacts!.email != null) {
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        sliver: SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(
                  title: _strings.contacts,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                ...getContactWidgetRows(context),
              ],
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  List<Widget> getContactWidgetRows(BuildContext context) {
    List<Widget> contactRows = [];

    getRowsInfo(context).forEach(
      (element) {
        if (element['value'] != null) {
          contactRows.add(
            ContactsRow(
              title: element['title'],
              value: element['value'],
              icon: element['icon'],
              type: element['type'],
            ),
          );
        }
      },
    );

    return contactRows;
  }

  List getRowsInfo(BuildContext context) {
    return [
      {
        'title': _strings.workPhone,
        'value': contacts!.workPhone,
        'icon': SvgPicture.asset(
          IconLinks.PHONE_ICON,
          width: 20.0,
          height: 20.0,
          color: Palette.white,
        ),
        'type': 'none'
      },
      {
        'title': _strings.workMobilePhone,
        'value': contacts!.workMobilePhone,
        'icon': SvgPicture.asset(
          IconLinks.SMARTPHONE_ICON,
          width: 20.0,
          height: 20.0,
          color: Palette.white,
        ),
        'type': 'call'
      },
      {
        'title': _strings.mobilePhone,
        'value': contacts!.mobilePhone,
        'icon': SvgPicture.asset(
          IconLinks.SMARTPHONE_ICON,
          width: 20.0,
          height: 20.0,
          color: Palette.white,
        ),
        'type': 'call'
      },
      {
        'title': 'Email',
        'value': contacts!.email,
        'icon': SvgPicture.asset(
          IconLinks.MAIL_ICON,
          width: 20.0,
          height: 20.0,
          color: Palette.white,
        ),
        'type': 'email'
      },
    ];
  }
}
