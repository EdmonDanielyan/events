import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class SearchItemText extends StatelessWidget {
  final int id;
  final String title;
  final String query;
  final String route;

  const SearchItemText(
      {Key? key,
      required this.id,
      required this.title,
      required this.query,
      required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, route, arguments: {'id': id});
      },
      child: Container(
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: EasyRichText(
                  title,
                  caseSensitive: false,
                  patternList: [
                    EasyRichTextPattern(
                        targetString: query,
                        style: TextStyle(color: Colors.blue)),
                  ],
                )),
            Divider(
              color: Color(0xFFE5E5E5),
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
