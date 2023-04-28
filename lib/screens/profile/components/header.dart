import 'package:flutter/material.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/user_main_info.dart';
import 'package:ink_mobile/screens/profile/components/votes_bar.dart';

import '../../../messenger/functions/size_config.dart';

class PersonalPageHeader extends StatelessWidget {
  final UserProfileData user;

  const PersonalPageHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 50),
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
                absenceUser: user.absence,
                isOtherUser: false,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment(0, 1.25),
                child: VotesBar(
                  votes: user.votes,
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment(-0.98, -0.7),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: SizeConfig(context, 24).getProportionateScreenHeight,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
