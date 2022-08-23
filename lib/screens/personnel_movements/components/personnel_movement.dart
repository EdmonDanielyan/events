import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/movements_data.dart';

class PersonnelMovement extends StatelessWidget {
  final PersonnelMovementLabel? label;
  final MovementsData movement;
  
  final bool isTablet;

  PersonnelMovement({
    required this.movement,
    Key? key,
    this.label,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 1, color: Color(0xFFE5E5E5)),
        bottom: BorderSide(width: 1, color: Color(0xFFE5E5E5)),
      )),
      child: Column(
        children: [
          Container(
            width: size.width,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          _strings.dateOfTakingPosition,
                          style: TextStyle(
                             fontSize: isTablet ? 18 : 14,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.period,
                    style: TextStyle(fontSize: isTablet ? 22 : 18),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Container(
            width: size.width,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          _strings.position,
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 14,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        getLabel()
                      ],
                    ),
                  ),
                  Text(
                    movement.position,
                    style: TextStyle( fontSize: isTablet ? 24 : 18,),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Container(
            width: size.width,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          _strings.department,
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 14,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.department,
                    style: TextStyle(fontSize: isTablet ? 22 : 18,),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Container(
            width: size.width,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          _strings.company,
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 14,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.organization,
                    style: TextStyle( fontSize: isTablet ? 22 : 18,),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Container(
            width: size.width,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          _strings.status,
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 14,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.operation,
                    style: TextStyle(fontSize: isTablet ? 22 : 18,),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Container(
            width: size.width,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          _strings.staffNumber,
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 14,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.pnum,
                    style: TextStyle(fontSize: isTablet ? 22 : 18,),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getLabel() {
    return label != null
        ? Container(
            decoration: BoxDecoration(
              color: label!.background,
              borderRadius: BorderRadius.all(Radius.circular(80)),
            ),
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Text(
              label!.title,
              style: TextStyle(
                  fontSize:  isTablet ? 14 : 10,
                  color: label!.color,
                  fontWeight: FontWeight.bold),
            ),
          )
        : Container();
  }
}

class PersonnelMovementLabel {
  Color color;
  Color background;
  String title;

  PersonnelMovementLabel(
      {required this.background, required this.color, required this.title});
}
