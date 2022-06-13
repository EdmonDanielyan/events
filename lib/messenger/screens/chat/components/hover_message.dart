import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../components/popup/popup_menu_container.dart';
import '../../../../components/snackbar/custom_snackbar.dart';
import '../../../components/popup/menu_item.dart';
import '../../../model/message.dart';

const _respond = "_respond";
const _copy = "copy";
const _delete = "delete";
const _edit = "edit";

class HoverMessageCard extends StatelessWidget {
  final Widget child;
  final Message message;
  final double iconSize;
  final void Function(BuildContext)? onDelete;
  final void Function(BuildContext)? onEdit;
  final void Function()? onLongPress;
  final void Function(BuildContext)? onRespond;
  const HoverMessageCard(
    this.message, {
    Key? key,
    required this.child,
    this.iconSize = 14.0,
    this.onDelete,
    this.onEdit,
    this.onLongPress,
    this.onRespond,
  }) : super(key: key);

  void _onCopy(BuildContext context) {
    Clipboard.setData(ClipboardData(text: message.body));
    SimpleCustomSnackbar(context: context, txt: "Скопировано в буфер");
  }

  void _onDelete(BuildContext context) {
    if (onDelete != null) {
      onDelete!(context);
    }
  }

  void _onEdit(BuildContext context) {
    if (onEdit != null) {
      onEdit!(context);
    }
  }

  void _onRespond(BuildContext context) {
    if (onRespond != null) {
      onRespond!(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuContainer<String>(
      blurBackground: true,
      child: child,
      items: [
        PopupMenuItem(
          value: _respond,
          child: MenuItem(
            value: "Ответить",
            icon: Icon(
              CupertinoIcons.arrowshape_turn_up_left_fill,
              size: iconSize,
            ),
          ),
        ),
        PopupMenuItem(
          value: _copy,
          child: MenuItem(
            value: "Копировать",
            icon: Icon(
              Icons.file_copy,
              size: iconSize,
            ),
          ),
        ),
        if (onDelete != null) ...[
          PopupMenuItem(
            value: _delete,
            child: MenuItem(
              value: "Удалить",
              icon: Icon(
                Icons.delete,
                size: iconSize,
              ),
            ),
          ),
        ],
        if (onEdit != null) ...[
          PopupMenuItem(
            value: _edit,
            child: MenuItem(
              value: "Редактировать",
              icon: Icon(
                CupertinoIcons.pencil,
                size: iconSize,
              ),
            ),
          ),
        ],
      ],
      onItemSelected: (value) async {
        if (value == _respond) {
          _onRespond(context);
        } else if (value == _copy) {
          _onCopy(context);
        } else if (value == _delete) {
          _onDelete(context);
        } else if (value == _edit) {
          _onEdit(context);
        }
      },
    );
  }
}
