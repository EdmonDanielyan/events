import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/palette.dart';

import '../../../constants/font_styles.dart';

class EventsListEmptyState extends StatelessWidget {
  const EventsListEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        color: Palette.text5Grey,
      ),
      child: Column(
        children: [
          SvgPicture.asset(IconLinks.SEARCH_ICON,
              colorFilter:
                  ColorFilter.mode(Palette.text20Grey, BlendMode.srcIn),
              height: 81.0,
              width: 81.0),
          const SizedBox(height: 24.0),
          Text("Ничего не найдено",
              style: FontStyles.rubikP1Medium(), textAlign: TextAlign.center),
          const SizedBox(height: 4.0),
          Text("Пока что у нас нет никаких объявлений для вас",
              style: FontStyles.rubikP1(),
              textAlign: TextAlign.center,
              maxLines: 2),
        ],
      ),
    );
  }
}
