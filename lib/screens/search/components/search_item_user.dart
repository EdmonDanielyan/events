import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class SearchItemUser extends StatelessWidget {
  final int id;
  final String? fullName;
  final ImageProvider<Object> avatar;
  final String query;
  final String route;

  const SearchItemUser(
      {Key? key,
      required this.id,
      required this.fullName,
      required this.avatar,
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
        alignment: Alignment.topLeft,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          children: [
            Container(
                child: CircleAvatar(
              radius: 25,
              backgroundImage: avatar,
            )),
            Flexible(
              child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: EasyRichText(
                    fullName ?? '',
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    defaultStyle: TextStyle(
                        color: Color(0xFF1D2126),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                    caseSensitive: false,
                    patternList: [
                      EasyRichTextPattern(
                          targetString: RegExp.escape(query),
                          style: TextStyle(color: Colors.blue)),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
