import 'package:flutter/material.dart';
import 'package:ink_mobile/models/movements_data.dart';

class PersonnelMovement extends StatelessWidget {
  static const String DATE_OF_TAKING_POSITION = 'Дата вступления в должность';
  static const String POSITION = 'Должность';
  static const String DEPARTMENT = 'Подразделение';
  static const String ORGANIZATION = 'Организация';
  static const String STATUS = 'Статус';
  static const String PERSONNEL_NUMBER = 'Табельный номер';

  final PersonnelMovementLabel? label;
  final MovementsData movement;

  PersonnelMovement({
    required this.movement,
    Key? key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              width: 1,
              color: Color(0xFFE5E5E5)
          ),
          bottom: BorderSide(
              width: 1,
              color: Color(0xFFE5E5E5)
          ),
        )
      ),
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
                          DATE_OF_TAKING_POSITION,
                          style: TextStyle(
                              color: Theme.of(context).accentColor
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.period,
                    style: TextStyle(fontSize: 18),
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
                          POSITION,
                          style: TextStyle(
                              color: Theme.of(context).accentColor
                          ),
                        ),
                        getLabel()
                      ],
                    ),
                  ),
                  Text(
                    movement.position,
                    style: TextStyle(fontSize: 18),
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
                          DEPARTMENT,
                            style: TextStyle(
                                color: Theme.of(context).accentColor
                            ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.department,
                    style: TextStyle(fontSize: 18),
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
                          ORGANIZATION,
                          style: TextStyle(
                              color: Theme.of(context).accentColor
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.organization,
                    style: TextStyle(fontSize: 18),
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
                          STATUS,
                          style: TextStyle(
                              color: Theme.of(context).accentColor
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.operation,
                    style: TextStyle(fontSize: 18),
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
                          PERSONNEL_NUMBER,
                          style: TextStyle(
                              color: Theme.of(context).accentColor
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.pnum,
                    style: TextStyle(fontSize: 18),
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
              borderRadius: BorderRadius.all(
                  Radius.circular(80)
              ),
            ),
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Text(
              label!.title,
              style: TextStyle(
                  fontSize: 10,
                  color: label!.color,
                  fontWeight: FontWeight.bold
              ),
            ),
          )
        : Container();
  }
}

class PersonnelMovementLabel
{
  Color color;
  Color background;
  String title;

  PersonnelMovementLabel({
    required this.background,
    required this.color,
    required this.title
  });
}
