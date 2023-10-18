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
    // it's the only method to make circle grey border only at the bottom
    // if you try to use
    // border: Border.only(bottom:...)
    // and
    // borderRadius: BorderRadius.only( bottomLeft:..., bottomRight: ...),
    // you will get an error "A borderRadius can only be given for a uniform Border."
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
      expandedHeight: 240.0,
      flexibleSpace: FlexibleSpaceBar(
        // collapseMode: CollapseMode.pin,
        expandedTitleScale: 1,
        title: getUserFullName(),
        background: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40),
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
}
