import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
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
        color: Palette.white,
        alignment: Alignment.centerLeft,
        height: 52.0,
        padding: EdgeInsets.only(
            top: SizeConfig(context, 13).getProportionateScreenHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  icon,
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Text(
                      title,
                      style: FontStyles.rubikP1(color: Palette.textBlack),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20.0,
                            color: Palette.greenE4A,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
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
                              color: Palette.text20Grey,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
