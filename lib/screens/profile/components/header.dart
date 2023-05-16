import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/user_main_info.dart';
import 'package:ink_mobile/screens/profile/components/votes_bar.dart';

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
    return Container(
      padding: EdgeInsets.only(bottom: 32.0),
      margin: const EdgeInsetsDirectional.only(bottom: 1.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 20.0),
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
            isOtherUser: false,
          ),
          VotesBar(
            votes: user.votes,
          ),
        ],
      ),
    );
  }
}
