//comment on refactoring because it don't use
// import 'package:flutter/material.dart';
// import 'package:flutter_linkify/flutter_linkify.dart';
// import 'package:ink_mobile/functions/launch_url.dart';

// class LinkifyText extends StatelessWidget {
//   final String text;
//   final TextStyle? style;
//   final TextStyle? linkStyle;
//   const LinkifyText({
//     Key? key,
//     required this.text,
//     this.style,
//     this.linkStyle,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Linkify(
//       text: text,
//       options: const LinkifyOptions(humanize: false),
//       style: style,
//       onOpen: (url) {
//         launchUrl(url.url);
//       },
//       linkStyle: linkStyle ??
//           TextStyle(
//             color: Theme.of(context).textTheme.bodyLarge!.color,
//           ),
//     );
//   }
// }
