import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/open_university/components/about_project.dart';

class AboutProjectContact extends StatelessWidget {
  final bool isTablet;

  const AboutProjectContact(
      {Key? key,
      required this.text,
      this.title,
      required this.type,
      required this.data,
      required this. isTablet})
      : super(key: key);

  final String? title;
  final String text;
  final AboutProjectType type;
  final String data;

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return GestureDetector(
      onTap: () {
        if (type == AboutProjectType.URL) {
          launchUrl(data);
        } else if (type == AboutProjectType.CLIPBOARD) {
          Clipboard.setData(ClipboardData(text: data)).then(
              (value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(_strings.textCopied),
                    duration: Duration(seconds: 1),
                  )));
        }
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 0.5,
                  blurRadius: 20,
                  offset: Offset(0, 15),
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title != null
                  ? Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(title!, style: TextStyle(fontSize:  isTablet ? 18 : 12)),
                    )
                  : Container(),
              Text(
                text,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: isTablet ? 20 : 16),
              ),
            ],
          )),
    );
  }
}
