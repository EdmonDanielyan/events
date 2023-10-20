import 'package:flutter/material.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/user_data.dart';

class PersonalPageHeader extends StatelessWidget {
  final UserProfileData user;

  const PersonalPageHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(builder: (BuildContext context, constraints) {
      final scrolledValue = constraints.scrollOffset;
      double spaceBarTitleOpacity = 1;
      double appBarTitleOpacity = 0;
      if (scrolledValue <= 130) {
        spaceBarTitleOpacity = 1;
        appBarTitleOpacity = 0;
      } else {
        if (scrolledValue >= 180) {
          spaceBarTitleOpacity = 0;
          appBarTitleOpacity = 1;
        } else {
          spaceBarTitleOpacity = 1 - (scrolledValue - 130) / 50;
          appBarTitleOpacity = (scrolledValue - 130) / 50;
        }
      }
      return SliverAppBar(
        backgroundColor: Palette.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Palette.greenE4A,
            size: 32.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          collapseMode: CollapseMode.pin,
          expandedTitleScale: 1,
          title: titleBar(spaceBarTitleOpacity, appBarTitleOpacity),
          background: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.text5Grey,
                    ),
                    child: CachedCircleAvatar(
                      avatarWidth: 164.0,
                      avatarHeight: 164.0,
                      url: user.pathToAvatar ?? "",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget getUserAvatar() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 24.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Palette.text5Grey,
        ),
        child: CachedCircleAvatar(
          avatarWidth: 164.0,
          avatarHeight: 164.0,
          url: user.pathToAvatar ?? "",
        ),
      ),
    );
  }

  Widget getUserFullName() {
    return Text(
      user.fullName,
      style: FontStyles.rubikH3(color: Palette.textBlack),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }

  Widget titleBar(double opacitySpaceBar, double opacityAppBar) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Opacity(
          opacity: opacitySpaceBar,
          child: Text(
            user.fullName,
            style: FontStyles.rubikH3(color: Palette.textBlack),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        Opacity(
          opacity: opacityAppBar,
          child: Text(
            user.name ?? user.fullName,
            style: FontStyles.rubikH3(color: Palette.textBlack),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
