import 'package:flutter/material.dart';
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
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade400, width: 0.5),
            bottom: BorderSide(color: Colors.grey.shade400, width: 0.5),
          )),
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(padding: EdgeInsets.only(right: 15), child: icon),
            ),
            Expanded(
                flex: 8,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (type == 'call') {
                            launchUrl('tel:' + value);
                          } else if (type == 'email') {
                            launchUrl('mailto:' + value);
                          }
                        },
                        child: Text(
                          value,
                          style: TextStyle(
                              color: (type == 'call') || (type == 'email')
                                  ? Color(0xFF2B5E4A)
                                  : Color(0xFF1D2126),
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
