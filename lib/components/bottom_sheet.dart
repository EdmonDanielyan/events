import 'package:flutter/material.dart';

import '../messenger/functions/size_config.dart';

class CustomBottomSheet {
  final BuildContext context;
  final Widget child;
  final ShapeBorder shape;

  CustomBottomSheet({
    required this.context,
    required this.child,
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: shape,
      builder: (context) => child,
    );
  }
}

class CustomBottomSheetChild extends StatelessWidget {
  final Widget child;
  final double? height;
  final BoxConstraints? constraints;
  final bool showTopLine;
  final String? title;
  final String cancelBtnTxt;
  final Function? onCancel;
  final String submitBtnTxt;
  final Function? onSubmit;
  final double horizontalPadding;
  const CustomBottomSheetChild({
    Key? key,
    required this.child,
    this.height,
    this.constraints,
    this.title,
    this.showTopLine = true,
    this.cancelBtnTxt = "Отмена",
    this.onCancel,
    this.submitBtnTxt = "Готово",
    this.onSubmit,
    this.horizontalPadding = 20.0,
  }) : super(key: key);

  void _onCancel(BuildContext context) {
    if (onCancel != null) {
      onCancel!();
    } else {
      Navigator.of(context).pop();
    }
  }

  void _onSubmit(BuildContext context) {
    if (onSubmit != null) {
      onSubmit!();
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      constraints: constraints,
      padding: MediaQuery.of(context).viewInsets,
      margin: const EdgeInsets.only(top: 7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTopLine) ...[
            topLineWidget(),
          ],
          Container(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: actionBtn(
                    context: context,
                    ignoring: cancelBtnTxt.isEmpty,
                    txt: cancelBtnTxt,
                    onPressed: () => _onCancel(context),
                  ),
                ),
                title != null ? titleWidget() : const SizedBox.shrink(),
                Align(
                  alignment: Alignment.centerRight,
                  child: actionBtn(
                    context: context,
                    ignoring: submitBtnTxt.isEmpty,
                    txt: submitBtnTxt,
                    onPressed: () => _onSubmit(context),
                  ),
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }

  Widget topLineWidget() {
    return Center(
      child: Container(
        width: 45,
        height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget titleWidget() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget actionBtn({
    required BuildContext context,
    required String txt,
    required void Function()? onPressed,
    bool ignoring = false,
  }) {
    return IgnorePointer(
      ignoring: ignoring,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          txt,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SizeConfig(context, 13.0).getProportionateScreenHeight,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
