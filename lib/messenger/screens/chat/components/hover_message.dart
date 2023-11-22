import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/messenger/components/popup/popup_menu_container.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import '../../../../components/snackbar/custom_snackbar.dart';
import '../../../components/popup/menu_item.dart' as my;
import '../../../model/message.dart';

const _goTo = "_goTo";
const _respond = "_respond";
const _copy = "copy";
const _delete = "delete";
const _edit = "edit";

class HoverMessageCard extends StatelessWidget {
  final Widget child;
  final Message message;
  final double? iconSize;
  final void Function(BuildContext)? onDelete;
  final void Function(BuildContext)? onEdit;
  final void Function()? onLongPress;
  final void Function(BuildContext)? onRespond;
  final void Function(BuildContext)? onGoTo;
  const HoverMessageCard(
    this.message, {
    Key? key,
    required this.child,
    this.iconSize,
    this.onDelete,
    this.onEdit,
    this.onLongPress,
    this.onRespond,
    this.onGoTo,
  }) : super(key: key);

  void _onGoTo(BuildContext context) {
    if (onGoTo != null) {
      onGoTo!(context);
    }
  }

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
    final _iconSize =
        iconSize ?? SizeConfig(context, 20.0).getProportionateScreenHeight;

    return PopupMenuContainer<String>(
      blurBackground: true,
      items: [
        if (onRespond != null) ...[
          PopupMenuItem(
            value: _respond,
            child: my.MenuItem(
              value: "Ответить",
              icon: Icon(
                CupertinoIcons.arrowshape_turn_up_left_fill,
                size: _iconSize,
              ),
            ),
          ),
        ],
        if (onEdit != null) ...[
          PopupMenuItem(
            value: _edit,
            child: my.MenuItem(
              value: "Редактировать",
              icon: Icon(
                CupertinoIcons.pencil,
                size: _iconSize,
              ),
            ),
          ),
        ],
        PopupMenuItem(
          value: _copy,
          child: my.MenuItem(
            value: "Копировать",
            icon: Icon(
              Icons.file_copy,
              size: _iconSize,
            ),
          ),
        ),
        if (onDelete != null) ...[
          PopupMenuItem(
            value: _delete,
            child: my.MenuItem(
              value: "Удалить",
              icon: Icon(
                Icons.delete,
                size: _iconSize,
              ),
            ),
          ),
        ],
        if (onGoTo != null) ...[
          PopupMenuItem(
            value: _goTo,
            child: my.MenuItem(
              value: "Перейти",
              icon: Icon(
                CupertinoIcons.profile_circled,
                size: _iconSize,
              ),
            ),
          ),
        ],
      ],
      onItemSelected: (value) async {
        if (value == _goTo) {
          _onGoTo(context);
        } else if (value == _respond) {
          _onRespond(context);
        } else if (value == _copy) {
          _onCopy(context);
        } else if (value == _delete) {
          _onDelete(context);
        } else if (value == _edit) {
          _onEdit(context);
        }
      },
      child: child,
    );
  }
}
