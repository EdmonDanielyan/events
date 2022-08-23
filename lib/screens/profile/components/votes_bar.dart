import 'package:flutter/material.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/ink_icons.dart';

import '../../../messenger/functions/size_config.dart';

class VotesBar extends StatelessWidget {
  final UserVotes? votes;

  const VotesBar({Key? key, required this.votes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Container(
          height: SizeConfig(context, 50).getProportionateScreenHeight,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: size.width * 0.90,
          child: Row(
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
                        size: SizeConfig(context, 27)
                            .getProportionateScreenHeight,
                      )),
                  Text(
                    votes?.barrels.toString() ?? '0',
                    style: TextStyle(
                        fontSize: SizeConfig(context, 22)
                            .getProportionateScreenHeight,
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
                        InkIcons.storage,
                        size: SizeConfig(context, 27)
                            .getProportionateScreenHeight,
                      )),
                  Text(
                    votes?.reservoir.toString() ?? '0',
                    style: TextStyle(
                        fontSize: SizeConfig(context, 22)
                            .getProportionateScreenHeight,
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
                        size: SizeConfig(context, 27)
                            .getProportionateScreenHeight,
                      )),
                  Text(
                    votes?.tankers.toString() ?? '0',
                    style: TextStyle(
                        fontSize: SizeConfig(context, 22)
                            .getProportionateScreenHeight,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300),
                  )
                ],
              )),
            ],
          ),
        ));
  }
}
