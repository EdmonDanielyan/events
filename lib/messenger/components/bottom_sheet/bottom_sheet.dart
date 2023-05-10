import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/bottom_sheet/top_line.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

import 'action_btn.dart';

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
  final void Function(BuildContext)? onSubmit;
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
      onSubmit!(context);
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
            const TopLineWidget(),
          ],
          Container(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ActionBtn(
                    ignoring: cancelBtnTxt.isEmpty,
                    title: cancelBtnTxt,
                    color: Colors.grey,
                    onPressed: () => _onCancel(context),
                  ),
                ),
                title != null
                    ? Align(
                        alignment: Alignment.center,
                        child: Text(
                          title!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig(context, 13)
                                .getProportionateScreenHeight,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Align(
                  alignment: Alignment.centerRight,
                  child: ActionBtn(
                    ignoring: submitBtnTxt.isEmpty,
                    title: submitBtnTxt,
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
}
