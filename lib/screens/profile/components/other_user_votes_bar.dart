import 'package:flutter/material.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/ink_icons.dart';

class OtherUserVotesBar extends StatelessWidget {
  final UserVotes? votes;

  const OtherUserVotesBar({
    Key? key,
    required this.votes
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      InkIcons.barrel,
                      size: 30,
                    )
                ),
                Text(
                  votes?.barrels.toString() ?? '0',
                  style: TextStyle(
                      fontSize: 28,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300
                  ),
                )
              ],
            )
        ),
        Container(
            height: size.height * 0.05,
            child: VerticalDivider(
              color: Color(0xFFE5E5E5),
              thickness: 2,
            )
        ),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      InkIcons.storage,
                      size: 30,
                    )),
                Text(
                  votes?.reservoir.toString() ?? '0',
                  style: TextStyle(
                      fontSize: 28,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300),
                )
              ],
            )),
        Container(
            height: size.height * 0.05,
            child: VerticalDivider(
              color: Color(0xFFE5E5E5),
              thickness: 2,
            )),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      InkIcons.tanker,
                      size: 30,
                    )
                ),
                Text(
                  votes?.tankers.toString() ?? '0',
                  style: TextStyle(
                      fontSize: 28,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300
                  ),
                )
              ],
            )
        ),
      ],
    );
  }
}
