import 'package:flutter/material.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/other_user_votes_bar.dart';
import 'package:ink_mobile/screens/profile/components/thanks_button.dart';
import 'package:ink_mobile/screens/profile/components/user_main_info.dart';

class OtherUserPageHeader extends StatelessWidget {
  final UserProfileData user;

  const OtherUserPageHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade400, width: 0.5))),
      child: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Align(
                alignment: AlignmentDirectional.topCenter,
                child: UserMainInfo(
                  userLastName: user.lastName,
                  userName: user.name,
                  userPosition: user.workPosition,
                  pathToAvatar: user.pathToAvatar,
                )),
            Positioned.fill(
              child: Align(
                alignment: Alignment(-0.98, -0.7),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            // WriteBtn(
            //   user: ChatUserViewModel.userDataToUserTable(user),
            // ),
          ]),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
            child: OtherUserVotesBar(votes: user.votes),
          ),
          user.canBeThanked == true
              ? ThanksButton(userId: user.id)
              : Container()
        ],
      ),
    );
  }
}
