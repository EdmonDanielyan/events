import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectiveAppBar extends StatelessWidget {
  final void Function()? onDelete;
  final void Function()? onSendOn;
  const SelectiveAppBar({Key? key, this.onDelete, this.onSendOn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: onDelete,
          icon: Icon(Icons.delete),
        ),
        IconButton(
          onPressed: onSendOn,
          icon: Icon(CupertinoIcons.arrowshape_turn_up_right_fill),
        ),
      ],
    );
  }
}
