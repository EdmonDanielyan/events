import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/app_bars/app_bar_with_text.dart';

class ChatInfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onEdit;
  const ChatInfoAppBar({Key? key, this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarWithText(
      titleWidget: const Text("Информация о чате"),
      actions: [
        if (onEdit != null) ...[
          IconButton(onPressed: onEdit, icon: const Icon(Icons.edit)),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
