import 'package:flutter/material.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/constants/codes.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/profile/profile_cubit.dart';
import 'package:ink_mobile/screens/profile/components/body.dart';

class ProfileScreen extends StatefulWidget {
  final String logFile;

  static ProfileScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<ProfileScreenState>()!;

  final ProfileCubit profileCubit;

  const ProfileScreen({
    Key? key,
    required this.profileCubit,
    required this.logFile,
  }) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  ProfileCubit get profileCubit => widget.profileCubit;

  bool showWriteBtn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(userCubit: profileCubit),
      bottomNavigationBar: bottomNavBar(context),
      backgroundColor: Palette.white,
    );
  }

  Widget? bottomNavBar(BuildContext context) {
    Map? arg = ModalRoute.of(context)!.settings.arguments as Map?;

    if (arg != null && arg.isNotEmpty) {
      if (arg.containsKey(HIDE_BOTTOM_NAV_BAR_CODE)) {
        return null;
      }
    }

    return NewBottomNavBar(showActive: false);
  }
}
