import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/palette.dart';

import '../../../constants/font_styles.dart';

class EventsListEmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: Palette.text5Grey,
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            IconLinks.SEARCH_ICON,
            color: Palette.text20Grey,
            height: 81.0,
            width: 81.0,
          ),
          const SizedBox(height: 24.0,),
          Text(
            "Ничего не найдено",
            style: FontStyles.rubikP1Medium(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4.0,),
          Text(
            "Пока что у нас нет никаких объявлений для вас",
            style: FontStyles.rubikP1(),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}