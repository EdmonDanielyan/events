import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/codes.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/thanks_button.dart';
import 'package:ink_mobile/screens/profile/components/user_main_info.dart';
import 'package:ink_mobile/screens/profile/components/votes_bar.dart';

class OtherUserPageHeader extends StatelessWidget {
  final UserProfileData user;

  const OtherUserPageHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool showWriteBtn = true;
    Map? arg = ModalRoute.of(context)!.settings.arguments as Map?;

    if (arg != null && arg.isNotEmpty) {
      if (arg.containsKey(HIDE_WRITE_BTN)) {
        showWriteBtn = false;
      }
    }
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Palette.greenE4A,
                  size: 32.0,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          UserMainInfo(
            user: user,
            showWriteButton: showWriteBtn,
            isOtherUser: true,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: VotesBar(votes: user.votes),
          ),
          user.canBeThanked
              ? ThanksButton(userId: user.id)
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
