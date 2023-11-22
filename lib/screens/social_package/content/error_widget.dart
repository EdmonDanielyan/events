import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class SocialPackageErrorWidget extends StatelessWidget {
  const SocialPackageErrorWidget({required this.data, Key? key})
      : super(key: key);

  final String? data;

  @override
  Widget build(BuildContext context) {
    return Html(
      style: {
        "h2": Style(
          fontSize:
              FontSize(SizeConfig(context, 14.0).getProportionateScreenHeight),
        ),
        "p": Style(
          fontSize:
              FontSize(SizeConfig(context, 14.0).getProportionateScreenHeight),
        ),
        "body": Style(
          fontSize: FontSize(24.0),
        ),
        "h3": Style(
          fontSize: FontSize(26.0),
        ),
      },
      onLinkTap:
          (String? url, Map<String, String> attributes, dom.Element? element) {
        launchUrl(url!);
      },
      data: data,
    );
  }
}
