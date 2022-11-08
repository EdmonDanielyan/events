import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';

import '../functions/launch_url.dart';
import '../messenger/functions/size_config.dart';

class CustomHtml extends StatelessWidget {
  final String? data;
  const CustomHtml({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: data ?? '',
      onLinkTap: (
        String? url,
        RenderContext context,
        Map<String, String> attributes,
        _,
      ) {
        if (url != null) {
          launchUrl(url);
        }
      },
      customRenders: {
        tableMatcher(): tableRender(),
      },
      style: {
        "a": Style(color: Colors.blue, textDecoration: TextDecoration.none),
        "b": Style(
          fontWeight: FontWeight.normal,
          fontSize: FontSize(
            SizeConfig(context, 12.0).getProportionateScreenHeight,
          ),
        ),
        "p": Style(
          fontSize: FontSize(
            SizeConfig(context, 12.0).getProportionateScreenHeight,
          ),
        ),
        "li": Style(
          fontSize: FontSize(
            SizeConfig(context, 12.0).getProportionateScreenHeight,
          ),
        ),
        "span": Style(border: Border.all(width: 0)),
        "td": Style(border: Border.all(width: 0, color: Colors.transparent)),
        "tr": Style(border: Border.all(width: 0))
      },
    );
  }
}
