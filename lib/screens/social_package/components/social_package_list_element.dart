import 'package:flutter/material.dart';
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';

class SocialPackageListElement extends StatelessWidget {
  final String title;
  final String link;

  const SocialPackageListElement(
      {Key? key, required this.title, required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, link);
        },
        child: CustomLayoutBuilder(
          builder: (context, constraints, isTablet) {
            return Container(
                color: Colors.white,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 60,
                child: Row(children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: isTablet ? 19 : 15),
                        overflow: TextOverflow.ellipsis,
                      )),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ))
                ]));
          }
        ));
  }
}
