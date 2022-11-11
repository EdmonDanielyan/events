import 'package:flutter/material.dart';

import 'birthday_title.dart';

class BirthdaysListViewBuilder extends StatelessWidget {
  final String title;
  final itemCount;
  final Widget Function(int) itemBuilder;
  const BirthdaysListViewBuilder({
    Key? key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BirthdayTitle(title),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(width: 1, color: Color(0xFFE5E5E5)),
                  bottom: BorderSide(width: 1, color: Color(0xFFE5E5E5)),
                )),
            child: ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(keepScrollOffset: false),
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemBuilder(index),
                    if (index != (itemCount - 1)) ...[
                      Divider(
                        thickness: 1,
                        height: 4,
                      )
                    ]
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
