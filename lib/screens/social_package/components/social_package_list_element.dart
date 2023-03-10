import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/routes/routes.dart';

class SocialPackageListElement extends StatelessWidget {
  final String title;
  final String link;
  final String id;

  const SocialPackageListElement(
      {Key? key, required this.title, required this.link, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MainRoutes.socialPackageDetailsScreenKey, arguments: {"id": id, "app_bar_title": title});
      },
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        height: 60,
        child: Row(
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  title,
                  style: FontStyles.rubikP1(color: Palette.textBlack),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    size:
                        SizeConfig(context, 10.0).getProportionateScreenHeight,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
