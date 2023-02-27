import 'package:flutter/material.dart';
import 'package:ink_mobile/components/webview_screen.dart';
import 'package:ink_mobile/functions/files.dart';
import '../functions/launch_url.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


class CustomHtml extends StatelessWidget {
  final String? data;
  const CustomHtml({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      data ?? "",
      onTapUrl: (url) async {
        if (isStringHttpUrl(url)) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => WebviewScreen(url),
            ),
          );
        } else {
          launchUrl(url);
        }

        return true;
      },
      customStylesBuilder: (element) {
        if (element.localName == "a") {
          return {
            'color': 'blue',
          };
        }
        if (element.localName?.contains("tbody") == true ||
            element.localName?.contains("td") == true ||
            element.localName?.contains("tr") == true ||
            element.localName?.contains("span") == true ||
            element.localName?.contains("table") == true) {
          return {
            'border': 'none !important',
          };
        }

        return null;
      },
    );
  }
}
