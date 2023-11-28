import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:shimmer/shimmer.dart';

import '../../../messenger/functions/size_config.dart';

class NewsListSliderElementPlaceholder extends StatelessWidget {
  static const String DEFAULT_PREVIEW_PICTURE_LINK =
      'assets/images/default_news.jpg';

  const NewsListSliderElementPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final elementWidth = MediaQuery.of(context).size.width * 0.73;
    final elementHeight =
        SizeConfig(context, 300.0).getProportionateScreenHeight;

    return SizedBox(
      width: elementWidth,
      height: elementHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(10, 10))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.grey.withOpacity(0.2),
                child: SizedBox(
                  height: SizeConfig(context, 130).getProportionateScreenHeight,
                  width: elementWidth,
                  child: const ColoredBox(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmerConstructor(width: 100, height: 20),
                    const SizedBox(height: 8),
                    shimmerConstructor(width: 400, height: 80),
                    Flexible(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(IconLinks.BARREL_SVG_LINK,
                                width: 16.0,
                                height: 16.0,
                                colorFilter: ColorFilter.mode(
                                    Palette.textBlack50, BlendMode.srcIn)),
                            const SizedBox(width: 9),
                            shimmerText(),
                            const SizedBox(width: 24),
                            SvgPicture.asset(IconLinks.COMMENT_ICON_LINK,
                                width: 16.0,
                                height: 16.0,
                                colorFilter: ColorFilter.mode(
                                    Palette.textBlack50, BlendMode.srcIn)),
                            const SizedBox(width: 9),
                            shimmerText(),
                            const SizedBox(width: 16),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.5),
                              highlightColor: Colors.grey.withOpacity(0.2),
                              child: const CircleAvatar(
                                radius: 9,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(IconLinks.OPENED_EYE_ICON_LINK,
                                width: 16.0,
                                height: 16.0,
                                colorFilter: ColorFilter.mode(
                                    Palette.textBlack50, BlendMode.srcIn)),
                            const SizedBox(width: 4),
                            shimmerText(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget shimmerText() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(0.5),
    highlightColor: Colors.grey.withOpacity(0.2),
    child: SizedBox(
      width: 30,
      height: 16,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
      ),
    ),
  );
}

Widget shimmerConstructor({required double width, required double height}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(0.5),
    highlightColor: Colors.grey.withOpacity(0.2),
    child: SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
      ),
    ),
  );
}
