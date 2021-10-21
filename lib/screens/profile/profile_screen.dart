import 'package:flutter/material.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/screens/profile/components/body.dart';
import 'package:ink_mobile/cubit/profile/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  static ProfileScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<ProfileScreenState>()!;

  final ProfileCubit profileCubit;
  const ProfileScreen({Key? key, required this.profileCubit}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  ProfileCubit get profileCubit => widget.profileCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: NewBottomNavBar(),
    );
  }
}
