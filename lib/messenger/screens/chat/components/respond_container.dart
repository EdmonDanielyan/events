import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';

class RespondContainer extends StatelessWidget {
  final bool isByMe;
  final String body;
  final String name;
  const RespondContainer({
    Key? key,
    required this.isByMe,
    required this.body,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: isByMe
            ? Colors.black.withOpacity(0.3)
            : Colors.grey[600]!.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2.0),
            GoogleText(
              name,
              color: isByMe ? Colors.purple[300] : Colors.purple,
              fontSize: 13.0,
            ),
            const SizedBox(height: 3.0),
            GoogleText(
              body,
              color: isByMe ? Colors.white : Colors.black,
              fontSize: 13.0,
            ),
            const SizedBox(height: 3.0),
          ],
        ),
      ),
    );
  }
}
