import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class MenuSheetItem extends StatelessWidget {
  const MenuSheetItem(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.icon,
      this.withBottomDivider = true})
      : super(key: key);

  final Function onTap;
  final String title;
  final SvgPicture icon;
  final bool withBottomDivider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          onTap();
        },
        child: Container(
          color: Color(0xfff9f9f9),
          alignment: Alignment.centerLeft,
          height: SizeConfig(context, 47).getProportionateScreenHeight,
          padding: EdgeInsets.only(
              top: SizeConfig(context, 13).getProportionateScreenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Container(child: icon),
                    Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: SizeConfig(context, 16)
                                  .getProportionateScreenHeight,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1d2126)),
                          textAlign: TextAlign.start,
                        )),
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: SizeConfig(context, 11)
                                    .getProportionateScreenHeight,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              withBottomDivider
                  ? Expanded(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig(context, 10)
                                    .getProportionateScreenHeight),
                            child: Divider(
                              color: Color(0xffe5e5e5),
                              height: 1,
                              thickness: 1.3,
                              endIndent: 0,
                              indent: 55,
                            ))
                      ],
                    ))
                  : Container()
            ],
          ),
        ));
  }
}
