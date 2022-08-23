import 'package:flutter/material.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class UserMainInfo extends StatelessWidget {
  final String? userName;
  final String? userLastName;
  final String? userPosition;
  final String? pathToAvatar;

  UserMainInfo(
      {Key? key,
      this.userLastName,
      this.userName,
      this.userPosition,
      this.pathToAvatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          bottom: SizeConfig(context, 55).getProportionateScreenHeight),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(600, 50),
          bottomRight: Radius.elliptical(600, 50),
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/personal_background_line.png"),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          colors: [Theme.of(context).primaryColor, const Color(0xFF182B23)],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.decal,
        ),
      ),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            SizeConfig(context, 65)
                                .getProportionateScreenHeight),
                        color: Colors.grey.withOpacity(0.2)),
                    padding: EdgeInsets.all(5),
                    child: Container(
                      child: CachedCircleAvatar(
                        avatarWidth: SizeConfig(context, 140)
                            .getProportionateScreenHeight,
                        avatarHeight: SizeConfig(context, 140)
                            .getProportionateScreenHeight,
                        url: pathToAvatar ?? "",
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(
                      top: SizeConfig(context, 50).getProportionateScreenHeight,
                      bottom:
                          SizeConfig(context, 21).getProportionateScreenHeight),
                ),
                Container(
                  width: size.width * 0.90,
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        getFullName(),
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontSize: SizeConfig(context, 20)
                              .getProportionateScreenHeight,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
                ),
                getUserPositionWidget(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getFullName() {
    List nameComponents = [];

    if (userLastName != null) {
      nameComponents.add(userLastName);
    }

    if (userName != null) {
      nameComponents.add(userName);
    }

    return nameComponents.join(' ');
  }

  Widget getUserPositionWidget(BuildContext context) {
    if (userPosition != null) {
      return Padding(
          padding: EdgeInsets.only(top: 10),
          child: Opacity(
              opacity: 0.7,
              child: Text(
                userPosition!.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize:
                      SizeConfig(context, 12).getProportionateScreenHeight,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              )));
    } else {
      return Container();
    }
  }
}
