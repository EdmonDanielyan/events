import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/contacts_row.dart';
import 'package:ink_mobile/screens/profile/components/section_title.dart';

class Contacts extends StatelessWidget {
  static late AppLocalizations _strings;
  final UserContacts? contacts;
  final bool isTablet;
  const Contacts({Key? key, required this.contacts, required this. isTablet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    if (contacts != null) {
      return getContactsWidget(context, isTablet);
    } else {
      return Container();
    }
  }

  getContactsWidget(BuildContext context, bool isTablet) {
    if (contacts!.workPhone != null ||
        contacts!.mobilePhone != null ||
        contacts!.workMobilePhone != null ||
        contacts!.email != null) {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: SectionTitle(
                title: _strings.contacts,
                isTablet: isTablet,
              ),
            ),
            Column(children: getContactWidgetRows(context, isTablet))
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  List<Widget> getContactWidgetRows(BuildContext context, bool isTablet) {
    List<Widget> contactRows = [];

    getRowsInfo(context).forEach((element) {
      if (element['value'] != null) {
        contactRows.add(ContactsRow(
          isTablet: isTablet,
          title: element['title'],
          value: element['value'],
          icon: element['icon'],
          type: element['type'],
        ));
      }
    });

    return contactRows;
  }

  List getRowsInfo(BuildContext context) {
    return [
      {
        'title': _strings.workPhone,
        'value': contacts!.workPhone,
        'icon': SvgPicture.asset('assets/images/work_phone.svg'),
        'type': 'none'
      },
      {
        'title': _strings.workMobilePhone,
        'value': contacts!.workMobilePhone,
        'icon': Icon(
          Icons.phone,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
        'type': 'call'
      },
      {
        'title': _strings.mobilePhone,
        'value': contacts!.mobilePhone,
        'icon': Icon(
          Icons.phone_iphone,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
        'type': 'call'
      },
      {
        'title': 'Email',
        'value': contacts!.email,
        'icon': SvgPicture.asset('assets/images/mail_at.svg'),
        'type': 'email'
      },
    ];
  }
}
