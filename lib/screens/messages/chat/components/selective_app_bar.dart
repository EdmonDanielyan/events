import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectiveAppBar extends StatelessWidget {
  const SelectiveAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.arrowshape_turn_up_right_fill),
        ),
      ],
    );
  }
}
