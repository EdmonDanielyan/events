import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, bottom: 8),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).iconTheme.color,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          )
        )
      ],
    );
  }

}
