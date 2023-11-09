import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/date_functions.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/movements_data.dart';
import 'package:intl/intl.dart';

class PersonnelMovement extends StatelessWidget {
  final PersonnelMovementLabel? label;
  final MovementsData movement;

  PersonnelMovement({required this.movement, Key? key, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
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
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          _strings.dateOfTakingPosition,
                          style: TextStyle(
                              fontSize: SizeConfig(context, 14)
                                  .getProportionateScreenHeight,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    DateFunctions(
                            DateFormat('dd.MM.yyyy').parse(movement.period))
                        .ddMMyyyyString(),
                    style: TextStyle(
                        fontSize: SizeConfig(context, 18)
                            .getProportionateScreenHeight),
                  )
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Container(
            width: size.width,
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          _strings.position,
                          style: TextStyle(
                              fontSize: SizeConfig(context, 14)
                                  .getProportionateScreenHeight,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        getLabel(context)
                      ],
                    ),
                  ),
                  Text(
                    movement.position,
                    style: TextStyle(
                        fontSize: SizeConfig(context, 18)
                            .getProportionateScreenHeight),
                  )
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Container(
            width: size.width,
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          _strings.department,
                          style: TextStyle(
                              fontSize: SizeConfig(context, 14)
                                  .getProportionateScreenHeight,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.department,
                    style: TextStyle(
                        fontSize: SizeConfig(context, 18)
                            .getProportionateScreenHeight),
                  )
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Container(
            width: size.width,
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          _strings.company,
                          style: TextStyle(
                              fontSize: SizeConfig(context, 14)
                                  .getProportionateScreenHeight,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.organization,
                    style: TextStyle(
                        fontSize: SizeConfig(context, 18)
                            .getProportionateScreenHeight),
                  )
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Container(
            width: size.width,
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          _strings.status,
                          style: TextStyle(
                              fontSize: SizeConfig(context, 14)
                                  .getProportionateScreenHeight,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.operation,
                    style: TextStyle(
                        fontSize: SizeConfig(context, 18)
                            .getProportionateScreenHeight),
                  )
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Container(
            width: size.width,
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          _strings.staffNumber,
                          style: TextStyle(
                              fontSize: SizeConfig(context, 14)
                                  .getProportionateScreenHeight,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    movement.pnum,
                    style: TextStyle(
                      fontSize:
                          SizeConfig(context, 18).getProportionateScreenHeight,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getLabel(BuildContext context) {
    return label != null
        ? Container(
            decoration: BoxDecoration(
              color: label!.background,
              borderRadius: BorderRadius.all(Radius.circular(80)),
            ),
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Text(
              label!.title,
              style: TextStyle(
                  fontSize:
                      SizeConfig(context, 10).getProportionateScreenHeight,
                  color: label!.color,
                  fontWeight: FontWeight.bold),
            ),
          )
        : const SizedBox();
  }
}

class PersonnelMovementLabel {
  Color color;
  Color background;
  String title;

  PersonnelMovementLabel(
      {required this.background, required this.color, required this.title});
}
