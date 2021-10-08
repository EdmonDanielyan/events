import 'package:flutter/material.dart';

class PopupMenuContainer<T> extends StatefulWidget {
  final Widget child;
  final bool blurBackground;
  final List<PopupMenuEntry<T>> items;
  final void Function(T) onItemSelected;

  PopupMenuContainer(
      {required this.child,
      this.blurBackground = false,
      required this.items,
      required this.onItemSelected,
      Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => PopupMenuContainerState<T>();
}

class PopupMenuContainerState<T> extends State<PopupMenuContainer<T>> {
  late Offset _tapDownPosition;
  late T? value;

  bool isMenuShown = false;

  void switchMenuShown(bool show) {
    setState(() {
      isMenuShown = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return mainChild();
  }

  Widget mainChild() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (TapDownDetails details) {
        _tapDownPosition = details.globalPosition;
      },
      onLongPress: () async {
        final RenderBox overlay =
            Overlay.of(context)!.context.findRenderObject()! as RenderBox;

        switchMenuShown(true);
        value = await showMenu<T>(
          context: context,
          items: widget.items,
          position: RelativeRect.fromLTRB(
            _tapDownPosition.dx,
            _tapDownPosition.dy,
            overlay.size.width - _tapDownPosition.dx,
            overlay.size.height - _tapDownPosition.dy,
          ),
        ).then((value) {
          switchMenuShown(false);
        });

        if (value != null) {
          widget.onItemSelected(value!);
        }
      },
      child: widget.child,
    );
  }
}
