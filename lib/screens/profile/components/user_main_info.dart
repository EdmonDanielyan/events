import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/components/textfields/service_btn.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/screens/profile/components/photo_preview_page.dart';
import 'package:intl/intl.dart';

class UserMainInfo extends StatefulWidget {
  final String? userName;
  final String? userLastName;
  final String? userPosition;
  final String? pathToAvatar;
  final bool? isOtherUser;
  final String? absenceUser;
  UserMainInfo(
      {Key? key,
      this.userLastName,
      this.userName,
      this.userPosition,
      this.pathToAvatar,
      this.isOtherUser, this.absenceUser})
      : super(key: key);

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
      child:  Column(
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
                        url: widget.pathToAvatar ?? "",
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
                      GestureDetector(
                        //onTapDown: (_)=> _enableEdit(),
                        behavior: HitTestBehavior.translucent,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: TextFormField(
                            controller: fioFieldC,
                            readOnly: !isEditing,
                            focusNode: textFormFocus,
                            autofocus: true,
                            maxLines: 2,
                            cursorColor: Theme.of(context).primaryColorLight,
                            textAlign: TextAlign.center,
                            style:  TextStyle(
                              overflow: TextOverflow.visible,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: SizeConfig(context, 20)
                                  .getProportionateScreenHeight,
                              fontWeight: FontWeight.bold,
                            ),
                            textInputAction: TextInputAction.go,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isCollapsed: true,
                            ),
                          ),
                        ),
                      ),
                      // if(isEditing)
                      //   Padding(
                      //     padding: const EdgeInsets.only(top: 10.0),
                      //     child: ServiceBtn(
                      //         txt: 'Сохранить',
                      //         onPressed: (){
                      //           setState((){
                      //             isEditing = false;
                      //           });
                      //         }),
                      //   )
                    ],
                  )),
                ),
                getUserPositionWidget(context),
                getInfoAbsenceUser()
              ],
            ),
          );
  }

  String getFullName() {
    List nameComponents = [];
    if (widget.userLastName != null) {
      nameComponents.add(widget.userLastName);
    }
    if (widget.userName != null) {
      nameComponents.add(widget.userName);
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
    if (widget.userPosition != null) {
      return Padding(
          padding: EdgeInsets.only(top: 10),
          child: Opacity(
              opacity: 0.7,
              child: Text(
                widget.userPosition!.toUpperCase(),
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

  Widget getInfoAbsenceUser() {
    String str = widget.absenceUser ?? '' ;

    if(str != ''){
      return Container(
          margin: EdgeInsets.only(top:20,left: 20,right: 20),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: str.contains('Отсутствие')? Color(0xFFEBB300) : Color(0xFF6E3255),
            // border: Border.all(
            //     style: BorderStyle.solid,
            //     width: 1.0
            // ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Expanded(child: Padding(
                 padding: const EdgeInsets.only(left: 6.0),
                 child: Text(str,style: TextStyle(color: (!str.contains('Отсутствие'))?  Colors.white: Colors.black),),
               )),

              Padding(
                padding: const EdgeInsets.all(6.0),
                child: str.contains('Отсутствие')? Icon(Icons.sunny,color: Colors.black,):Icon(Icons.airplanemode_on_outlined,color: Colors.white,),
              )
            ],
          ));
    } else return SizedBox();
  }
}

