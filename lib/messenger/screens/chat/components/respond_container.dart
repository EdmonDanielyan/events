import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

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
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: isByMe
            // колор
            // Colors.black.withOpacity(0.3)
            ? Colors.grey[600]!.withOpacity(0.2)
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
              // колор
              // isByMe ? Colors.purple[300] : Colors.purple,
              color: isByMe ? Colors.purple : Colors.purple,
              fontSize: SizeConfig(context, 11).getProportionateScreenHeight,
            ),
            const SizedBox(height: 3.0),
            GoogleText(
              body,
              // колор
              //isByMe ? Colors.white : Colors.black
              color: isByMe ? Colors.black : Colors.black,
              fontSize: SizeConfig(context, 11).getProportionateScreenHeight,
            ),
            const SizedBox(height: 3.0),
          ],
        ),
      ),
    );
  }
}
