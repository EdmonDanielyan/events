import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../messenger/functions/size_config.dart';

class Award extends StatelessWidget {
  final AwardsItem award;
  const Award({Key? key, required this.award}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig(context, 65).getProportionateScreenHeight,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: getWidgetByExtension(context),
    );
  }

  Widget getWidgetByExtension(BuildContext context) {
    int dotPosition = this.award.link.lastIndexOf('.');
    String extension = this.award.link.substring(dotPosition);

    List<String> imageExtensions = ['.png', '.jpg', '.jpeg'];

    if (extension == '.svg') {
      return SvgPicture.asset(
        this.award.link,
        width: SizeConfig(context, 25).getProportionateScreenHeight,
        height: SizeConfig(context, 25).getProportionateScreenHeight,
      );
    } else if (imageExtensions.contains(extension)) {
      return Image.asset(
        this.award.link,
        width: SizeConfig(context, 25).getProportionateScreenHeight,
        height: SizeConfig(context, 25).getProportionateScreenHeight,
      );
    } else {
      return Container();
    }
  }
}

class AwardsItems {
  static const AwardsItem tanker =
      AwardsItem('assets/images/award_golden_tanker.svg');
  static const AwardsItem greenLeaf =
      AwardsItem('assets/images/award_green_leaf.svg');
}

class AwardsItem {
  final String link;

  const AwardsItem(String link) : link = link;
}
