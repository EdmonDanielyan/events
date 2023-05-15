import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/absence.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:intl/intl.dart';

class UserMainInfo extends StatefulWidget {
  final UserProfileData user;
  final bool? isOtherUser;
  UserMainInfo({
    Key? key,
    required this.user,
    this.isOtherUser,
  }) : super(key: key);

  @override
  State<UserMainInfo> createState() => _UserMainInfoState();
}

class _UserMainInfoState extends State<UserMainInfo> {
  TextEditingController fioFieldC = TextEditingController();
  late FocusNode textFormFocus;
  bool isEditing = false;
  late bool isOtherUser = widget.isOtherUser ?? true;

  @override
  void initState() {
    fioFieldC.text = getFullName();
    textFormFocus = FocusNode();
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
    return Container(
      padding: EdgeInsets.only(
          bottom: SizeConfig(context, 55).getProportionateScreenHeight),
      width: size.width,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 16.0,
                bottom: SizeConfig(context, 21).getProportionateScreenHeight),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      SizeConfig(context, 65).getProportionateScreenHeight),
                  color: Colors.grey.withOpacity(0.2)),
              padding: EdgeInsets.all(5),
              child: Container(
                child: CachedCircleAvatar(
                  avatarWidth:
                      SizeConfig(context, 140).getProportionateScreenHeight,
                  avatarHeight:
                      SizeConfig(context, 140).getProportionateScreenHeight,
                  url: user.pathToAvatar ?? "",
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.90,
            child: Center(
              child: Column(
                children: [
                  GestureDetector(
                    //onTapDown: (_)=> _enableEdit(),
                    behavior: HitTestBehavior.translucent,
                    child: TextFormField(
                      controller: fioFieldC,
                      readOnly: !isEditing,
                      focusNode: textFormFocus,
                      autofocus: true,
                      maxLines: 2,
                      cursorColor: Theme.of(context).primaryColorLight,
                      textAlign: TextAlign.center,
                      style: FontStyles.rubikH3(color: Palette.textBlack),
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isCollapsed: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          getUserPositionWidget(context),
          getInfoAbsenceUser()
        ],
      ),
    );
  }

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

  // void _enableEdit() {
  //   if(isEditing != true) {
  //     setState(() {
  //       isEditing = true;
  //     });
  //     FocusScope.of(context).requestFocus(textFormFocus);
  //   }
  // }

  Widget getUserPositionWidget(BuildContext context) {
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
      bool isVacation = user.absence!.reason == AbsenceReason.vacation;
      return Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        decoration: BoxDecoration(
          color: isVacation ? Palette.yellow300 : Palette.purple255,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
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
                  "${user.absence!.getAbsenceReasonText ?? ""} c ${DateFormat('dd.MM.yyyy').format(user.absence!.from!)} по ${DateFormat('dd.MM.yyyy').format(user.absence!.to!)}",
                  style: FontStyles.rubikP3Medium(
                      color: isVacation ? Palette.textBlack : Palette.white),
                ),
              ),
            ),
            isVacation
                ? SvgPicture.asset(
              IconLinks.SUN_ICON,
              height: 24.0,
              width: 24.0,
            )
                : SvgPicture.asset(
              IconLinks.PLANE_ICON,
              color: Colors.white,
              height: 24.0,
              width: 24.0,
            )
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
