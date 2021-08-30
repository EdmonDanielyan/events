import 'package:flutter/material.dart';

class ContactsRow extends StatelessWidget {
  final Widget icon;
  final String title;
  final String value;

  const ContactsRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.value
  }) : super(key: key);

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
            top: BorderSide(
                color: Colors.grey.shade400,
                width: 0.5
            ),
            bottom: BorderSide(
                color: Colors.grey.shade400,
                width: 0.5
            ),
          )
      ),
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(
            left: 20,
            top: 20,
            bottom: 20
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: icon
              ),
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
                          color: Theme.of(context).accentColor,
                          fontSize: 14
                      ),
                    ),
                    Text(
                      value,
                      style: TextStyle(
                          color: Color(0xFF1D2126),
                          fontSize: 16
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
