import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'custom_popup_route.dart';

class PopupMenuContainer<T> extends StatefulWidget {
  final Widget child;
  final bool blurBackground;
  final List<PopupMenuEntry<T>> items;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function(T) onItemSelected;

  const PopupMenuContainer(
      {required this.child,
      this.blurBackground = false,
      required this.items,
      required this.onItemSelected,
      this.onTap,
      this.onLongPress,
      Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => PopupMenuContainerState<T>();
}

class PopupMenuContainerState<T> extends State<PopupMenuContainer<T>> {
  Offset? _tapDownPosition;
  late T? value;
  late StreamSubscription<bool> keyboardSubscription;
  bool isKeyboardVisible = false;
  bool isMenuShown = false;

  @override
  void initState() {
    super.initState();
    final keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      isKeyboardVisible = visible;
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

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

  Future<void> pushEntry(BuildContext context) async {
    NavigatorState navigator = Navigator.of(context);
    await navigator.push(
      MyPopupRoute(child: entryWidget(context)),
    );
  }

  Widget entryWidget(BuildContext context) {
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
                children: [widget.child],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onTap(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (isKeyboardVisible) {
      await Future.delayed(const Duration(milliseconds: 500));
    }

    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;

    switchMenuShown(true);

    final widgetPosition = RelativeRect.fromLTRB(
      _tapDownPosition?.dx ?? 0,
      (_tapDownPosition?.dy ?? 0) + 25,
      overlay.size.width - (_tapDownPosition?.dx ?? 0),
      overlay.size.height - (_tapDownPosition?.dy ?? 0),
    );

    if (widget.blurBackground) {
      pushEntry(context);
    }

    await showMenu<T>(
      context: context,
      items: widget.items,
      position: widgetPosition,
    ).then((value) {
      if (value != null) {
        widget.onItemSelected(value);
      }
      switchMenuShown(false);
      closeBluredBg();
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (TapDownDetails details) {
        _tapDownPosition = details.globalPosition;
      },
      onTap: widget.onTap ?? () => onTap(context),
      child: widget.child,
    );
  }
}
