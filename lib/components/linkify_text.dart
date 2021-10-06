import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:ink_mobile/functions/launch_url.dart';

class LinkifyText extends StatelessWidget {
  final String text;
  const LinkifyText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Linkify(
      text: text,
      options: LinkifyOptions(
        humanize: false,
      ),
      onOpen: (url) {
        launchUrl(url.url);
      },
      linkStyle: TextStyle(
        color: Theme.of(context).textTheme.bodyText1!.color,
      ),
    );
  }
}
