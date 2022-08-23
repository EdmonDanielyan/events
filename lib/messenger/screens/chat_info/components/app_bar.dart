import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/app_bars/app_bar_with_text.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class ChatInfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onEdit;
  const ChatInfoAppBar({Key? key, this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarWithText(
      context,
      titleWidget: Text(
        "Информация о чате",
        style: TextStyle(
          fontSize: SizeConfig(context, 13.0).getProportionateScreenHeight,
        ),
      ),
      actions: [
        if (onEdit != null) ...[
          IconButton(
            onPressed: onEdit,
            icon: Icon(
              Icons.edit,
              size: SizeConfig(context, 20).getProportionateScreenHeight,
            ),
          ),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
