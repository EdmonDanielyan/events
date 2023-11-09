import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/write_btn.dart';
import 'package:intl/intl.dart';

class UserMainInfo extends StatefulWidget {
  final UserProfileData user;
  final bool showWriteButton;
  final bool? isOtherUser;
  UserMainInfo({
    Key? key,
    required this.user,
    this.showWriteButton = false,
    this.isOtherUser,
  }) : super(key: key);

  @override
  State<UserMainInfo> createState() => _UserMainInfoState();
}

class _UserMainInfoState extends State<UserMainInfo> {
  TextEditingController fioFieldC = TextEditingController();
  FocusNode textFormFocus = FocusNode();
  bool isEditing = false;
  late bool isOtherUser = widget.isOtherUser ?? true;

  @override
  void initState() {
    fioFieldC.text = getFullName();
    super.initState();
  }

  @override
  void dispose() {
    textFormFocus.dispose();
    super.dispose();
  }

  UserProfileData get user => widget.user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverToBoxAdapter(
        child: Container(
          // padding: EdgeInsets.only(bottom: 24.0),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // getUserAvatar(),
              // getUserFullName(),
              // const SizedBox(height: 8.0),
              getUserPositionWidget(),
              if (widget.showWriteButton) ...[
                const SizedBox(height: 24.0),
                WriteBtn(
                  user: User(
                    id: user.id,
                    name: "${user.lastName ?? ""} ${user.name ?? ""}".trim(),
                    avatarUrl: user.pathToAvatar ?? "",
                  ),
                ),
              ],
              const SizedBox(height: 32.0),
              getInfoAbsenceUser()
            ],
          ),
        ),
      ),
    );
  }

  // Widget getUserFullName() {
  //   return Center(
  //     child: Text(
  //       user.fullName,
  //       style: FontStyles.rubikH3(color: Palette.textBlack),
  //       maxLines: 2,
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }

  // Widget getUserAvatar() {
  //   return Padding(
  //     padding: const EdgeInsets.only(
  //       top: 16.0,
  //       bottom: 24.0,
  //     ),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: Palette.text5Grey,
  //       ),
  //       child: CachedCircleAvatar(
  //         avatarWidth: 164.0,
  //         avatarHeight: 164.0,
  //         url: user.pathToAvatar ?? "",
  //       ),
  //     ),
  //   );
  // }

  String getFullName() {
    List nameComponents = [];
    if (user.lastName != null) {
      nameComponents.add(user.lastName);
    }
    if (user.name != null) {
      nameComponents.add(user.name);
    }
    return nameComponents.join(' ');
  }

  Widget getUserPositionWidget() {
    if (user.workPosition != null) {
      return Text(
        user.workPosition!,
        textAlign: TextAlign.center,
        style:
            FontStyles.rubikP3Medium(color: Palette.textBlack.withOpacity(0.7)),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget getInfoAbsenceUser() {
    if (user.absence != null && user.absence!.isNotEmpty) {
      Color backgroundColor = Palette.white;
      Color textColor = Palette.white;
      Color iconColor = Palette.white;
      String iconLink = "";

      iconLink = user.absence!.isBusinessTrip
          ? IconLinks.PLANE_ICON
          : IconLinks.SUN_ICON;
      backgroundColor =
          user.absence!.isBusinessTrip ? Palette.purple255 : Palette.yellow300;
      textColor =
          user.absence!.isBusinessTrip ? Palette.white : Palette.textBlack;
      iconColor =
          user.absence!.isBusinessTrip ? Palette.white : Palette.textBlack;

      return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 4.0,
                    top: 4.0,
                    bottom: 4.0,
                  ),
                  child: Text(
                    "${user.absence!.reason} c ${DateFormat('dd.MM.yyyy').format(user.absence!.from!)} по ${DateFormat('dd.MM.yyyy').format(user.absence!.to!)}",
                    style: FontStyles.rubikP3Medium(
                      color: textColor,
                    ),
                  ),
                ),
              ),
              SvgPicture.asset(
                iconLink,
                height: 24.0,
                width: 24.0,
                color: iconColor,
              )
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
