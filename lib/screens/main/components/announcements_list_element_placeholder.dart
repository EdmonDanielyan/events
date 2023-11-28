import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/screens/main/components/placeholder_constructor.dart';
import 'package:ink_mobile/screens/main/components/placeholder_text.dart';

class AnnouncementsListElementPlaceholder extends StatelessWidget {
  const AnnouncementsListElementPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PlaceHolderConstructor(width: 100, height: 20),
            const SizedBox(height: 8),
            const PlaceHolderConstructor(width: double.infinity, height: 60),
            const SizedBox(height: 21),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(IconLinks.OPENED_EYE_ICON_LINK,
                    height: 16.0,
                    width: 16.0,
                    colorFilter:
                        ColorFilter.mode(Palette.textBlack50, BlendMode.srcIn)),
                const SizedBox(width: 9),
                const PlaceholderText(),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 12,
                  child:
                      Icon(Icons.share, size: 16, color: Palette.textBlack50),
                ),
              ],
            ),
          ],
        ));
  }
}
