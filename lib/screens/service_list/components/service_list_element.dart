import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceListElement extends StatelessWidget {
  final String svgPicturePath;
  final String title;
  final String link;

  const ServiceListElement({
    Key? key,
    required this.title,
    required this.svgPicturePath,
    required this.link
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, link);
      },
      child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: 60,
          child: Row(
              children: [
                Container(
                    width: 50,
                    child: SvgPicture.asset(
                      svgPicturePath,
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 16
                      ),
                    )
                ),
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
                    )
                )
              ]
          )
      )
    );
  }
}
