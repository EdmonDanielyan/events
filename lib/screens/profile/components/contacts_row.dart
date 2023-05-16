import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/functions/launch_url.dart';

class ContactsRow extends StatelessWidget {
  final Widget icon;
  final String title;
  final String value;
  final String type;

  const ContactsRow(
      {Key? key,
      required this.icon,
      required this.title,
      required this.value,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getContactsRow(context);
  }

  Widget _getContactsRow(context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      margin: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          Container(
            child: icon,
            height: 36.0,
            width: 36.0,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.0),
              color: Palette.greenE4A,
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: FontStyles.rubikP3Medium(
                  color: Palette.textBlack50,
                ),
              ),
              InkWell(
                onTap: () {
                  if (type == 'call') {
                    launchUrl('tel:' + value);
                  } else if (type == 'email') {
                    launchUrl('mailto:' + value);
                  }
                },
                child: Text(
                  value,
                  style: FontStyles.rubikP1(
                    color: Palette.textBlack,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
