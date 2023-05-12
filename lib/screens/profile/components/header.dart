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
          Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: UserMainInfo(
                  user: user,
                  isOtherUser: false,

                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment(-0.98, -0.7),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: SizeConfig(context, 24)
                          .getProportionateScreenHeight,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: VotesBar(
              votes: user.votes,
            ),
          ),
        ],
      ),
    );
  }
}
