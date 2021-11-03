import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/models/learning_materials_data.dart';
import 'package:intl/intl.dart';

class LearningMaterialsListElement extends StatelessWidget {
  static const String DEFAULT_PREVIEW_PICTURE_LINK =
      'assets/images/default_news.jpg';
  final LearningMaterialsData learningMaterial;

  const LearningMaterialsListElement({Key? key, required this.learningMaterial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
        // GestureDetector(
        //   onTap: () {
        //     Navigator.pushNamed(
        //        context,
        //        '/learningMaterial_detail',
        //        arguments: {'id': learningMaterial.id}
        //      );
        //   },
        //   child:
        Container(
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Color(0xffe5e5e5)))),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            learningMaterial.dateCreate != null
                                ? DateFormat('dd.MM.yyyy')
                                    .format(learningMaterial.dateCreate!)
                                : '',
                            style: TextStyle(
                                color: Theme.of(context).iconTheme.color),
                            textAlign: TextAlign.start,
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          alignment: Alignment.topLeft,
                          child: Text(
                            learningMaterial.title ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 4,
                            textAlign: TextAlign.start,
                          )),
                      Container(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(top: 24),
                          child: Row(mainAxisSize: MainAxisSize.max, children: [
                            Row(children: [
                              SvgPicture.asset(IconLinks.BARREL_SVG_LINK,
                                  width: 16),
                              Container(
                                  margin: EdgeInsets.only(left: 4),
                                  child: Text(
                                      learningMaterial.barrels != null
                                          ? learningMaterial.barrels.toString()
                                          : '0',
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      )))
                            ])
                          ]))
                    ],
                  ))
            ]));
    // );
  }
}
