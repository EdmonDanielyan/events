import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/user_data.dart';

class VotesBar extends StatelessWidget {
  final UserVotes? votes;

  const VotesBar({Key? key, required this.votes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 32.0,
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      IconLinks.BARREL_SVG_LINK,
                      height: 30.0,
                      width: 30.0,
                      color: Palette.greenE4A,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      votes?.barrels.toString() ?? '0',
                      style: FontStyles.rubikH2Medium(color: Palette.textBlack),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32.0,
                child: VerticalDivider(
                  color: Palette.text20Grey,
                  thickness: 2,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      IconLinks.TANK_ICON,
                      height: 30.0,
                      width: 30.0,
                      color: Palette.greenE4A,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      votes?.reservoir.toString() ?? '0',
                      style: FontStyles.rubikH2Medium(color: Palette.textBlack),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32.0,
                child: VerticalDivider(
                  color: Palette.text20Grey,
                  thickness: 2,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      IconLinks.TANKER_ICON,
                      height: 32.0,
                      width: 32.0,
                      color: Palette.greenE4A,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      votes?.tankers.toString() ?? '0',
                      style: FontStyles.rubikH2Medium(color: Palette.textBlack),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
