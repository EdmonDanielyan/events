import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:shimmer/shimmer.dart';

class AnnouncementsListElementPlaceholder extends StatelessWidget {
  const AnnouncementsListElementPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.grey.withOpacity(0.2),
              child: Container(
                  width: 100,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5))),
            ),
          ]),
          Container(
            margin: const EdgeInsets.only(top: 8),
            alignment: Alignment.topLeft,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.grey.withOpacity(0.2),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Row(children: [
                SvgPicture.asset(
                  IconLinks.VIEW_COUNT_SVG_LINK,
                  width: 16,
                ),
                const SizedBox(width: 3),
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                    width: 30,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                )
              ])
            ],
          )
        ],
      ),
    );
  }
}
