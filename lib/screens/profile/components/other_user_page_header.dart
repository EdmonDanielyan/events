import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/codes.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/cached_avatar/cached_avatar.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/user_main_info.dart';

class OtherUserPageHeader extends StatelessWidget {
  final UserProfileData user;

  const OtherUserPageHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map? arg = ModalRoute.of(context)!.settings.arguments as Map?;

    if (arg != null && arg.isNotEmpty) {
      if (arg.containsKey(HIDE_WRITE_BTN)) {}
    }
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
        // expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          collapseMode: CollapseMode.pin,
          expandedTitleScale: 1,
          title: titleBar(spaceBarTitleOpacity, appBarTitleOpacity),
          // background: Stack(
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.only(top: 30),
          //       child: Center(
          //         child: Container(
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: Palette.text5Grey,
          //           ),
          //           child: CachedCircleAvatar(
          //             avatarWidth: 164.0,
          //             avatarHeight: 164.0,
          //             url: user.pathToAvatar ?? "",
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
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
        // Opacity(
        //   opacity: opacitySpaceBar,
        //   child: Text(
        //     user.fullName,
        //     style: FontStyles.rubikH3(color: Palette.textBlack),
        //     maxLines: 2,
        //     textAlign: TextAlign.center,
        //   ),
        // ),
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

class UserAdditionalHeader extends StatelessWidget {
  final UserProfileData user;
  const UserAdditionalHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool showWriteBtn = true;
    Map? arg = ModalRoute.of(context)!.settings.arguments as Map?;

    if (arg != null && arg.isNotEmpty) {
      if (arg.containsKey(HIDE_WRITE_BTN)) {
        showWriteBtn = false;
      }
    }
    return UserMainInfo(
      isOtherUser: true,
      user: user,
      showWriteButton: showWriteBtn,
    );
  }
}



  //  return Container(
  //     padding: EdgeInsets.only(bottom: 10),
  //     child: Column(
  //       children: [
  //         Align(
  //           alignment: Alignment.topLeft,
  //           child: Padding(
  //             padding: const EdgeInsets.only(top: 32.0),
  //             child: IconButton(
  //               icon: Icon(
  //                 Icons.arrow_back_ios,
  //                 color: Palette.greenE4A,
  //                 size: 32.0,
  //               ),
  //               onPressed: () => Navigator.of(context).pop(),
  //             ),
  //           ),
  //         ),
  //         UserMainInfo(
  //           user: user,
  //           showWriteButton: showWriteBtn,
  //           isOtherUser: true,
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(bottom: 24),
  //           child: VotesBar(votes: user.votes),
  //         ),
  //         user.canBeThanked
  //             ? ThanksButton(userId: user.id)
  //             : const SizedBox.shrink()
  //       ],
  //     ),
  //   );
