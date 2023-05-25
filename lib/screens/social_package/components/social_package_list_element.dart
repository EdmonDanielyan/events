import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/routes/routes.dart';

class SocialPackageListElement extends StatelessWidget {
  final String title;
  final String link;
  final String id;
  final String iconUrl;

  const SocialPackageListElement({
    Key? key,
    required this.title,
    required this.link,
    required this.id,
    required this.iconUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MainRoutes.socialPackageDetailsScreenKey,
            arguments: {"id": id, "app_bar_title": title});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            iconUrl.isNotEmpty
                ? SvgPicture.network(
                    iconUrl,
                    width: 24.0,
                    height: 24.0,
                    color: Palette.greenE4A,
                  )
                : const SizedBox.square(
                    dimension: 24.0,
                  ),
            const SizedBox(width: 12.0,),
            Expanded(
              child: Text(
                title,
                style: FontStyles.rubikP1(color: Palette.textBlack),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            const SizedBox(width: 24.0,),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.0,
              color: Palette.greenE4A,
            )
          ],
        ),
      ),
    );
  }
}
