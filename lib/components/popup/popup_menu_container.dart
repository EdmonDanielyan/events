import 'package:flutter/material.dart';
import 'package:ink_mobile/components/popup/custom_popup_route.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';

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
  Offset? _tapDownPosition;
  late T? value;

  bool isMenuShown = false;

  void closeBluredBg() {
    if (widget.blurBackground) {
      Navigator.of(context).pop();
    }
  }

  void switchMenuShown(bool show) {
    setState(() {
      isMenuShown = show;
    });
  }

  void pushEntry() {
    NavigatorState navigator = Navigator.of(context);
    navigator.push(
      MyPopupRoute(child: entryWidget()),
    );
  }

  Widget entryWidget() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    return Stack(
      children: [
        Positioned(
          left: offset.dx,
          top: offset.dy,
          width: size.width,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Stack(
                children: [
                  widget.child,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onTap() async {
    TextFieldUtils.loseTextFieldFocus();
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject()! as RenderBox;

    switchMenuShown(true);

    if (widget.blurBackground) {
      pushEntry();
    }

    await showMenu<T>(
      context: context,
      items: widget.items,
      position: RelativeRect.fromLTRB(
        _tapDownPosition?.dx ?? 0,
        (_tapDownPosition?.dy ?? 0) + 25,
        overlay.size.width - (_tapDownPosition?.dx ?? 0),
        overlay.size.height - (_tapDownPosition?.dy ?? 0),
      ),
    ).then((value) {
      if (value != null) {
        widget.onItemSelected(value);
      }
      switchMenuShown(false);
      closeBluredBg();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (TapDownDetails details) {
        //Todo: _tapDownPosition может быть не заполнен поскольку onTapDown не вызывается на onLongPress
        _tapDownPosition = details.globalPosition;
      },
      onLongPress: onTap,
      onTap: () {
        TextFieldUtils.loseTextFieldFocus();
      },
      child: widget.child,
    );
  }
}
