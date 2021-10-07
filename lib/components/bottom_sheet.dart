import 'package:flutter/material.dart';

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
      shape: shape,
      builder: (context) => child,
    );
  }
}

class CustomBottomSheetChild extends StatelessWidget {
  final Widget child;
  final bool showTopLine;
  final String? title;
  final bool showCancelBtn;
  final String cancelBtnTxt;
  final Function? onCancel;
  final bool showSubmitBtn;
  final String submitBtnTxt;
  final Function? onSubmit;
  final double horizontalPadding;
  const CustomBottomSheetChild({
    Key? key,
    required this.child,
    this.title,
    this.showTopLine = true,
    this.showCancelBtn = true,
    this.cancelBtnTxt = "Отмена",
    this.onCancel,
    this.showSubmitBtn = true,
    this.submitBtnTxt = "Готово",
    this.onSubmit,
    this.horizontalPadding = 20.0,
  }) : super(key: key);

  void _onCancel(BuildContext context) {
    if (this.onCancel != null) {
      this.onCancel!();
    } else {
      Navigator.of(context).pop();
    }
  }

  void _onSubmit(BuildContext context) {
    if (this.onSubmit != null) {
      this.onSubmit!();
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (showTopLine) ...[
            topLineWidget(),
          ],
          Container(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  child: showCancelBtn ? actionBtn(cancelBtnTxt) : SizedBox(),
                  onPressed: () => _onCancel(context),
                ),
                title != null ? titleWidget() : SizedBox(),
                TextButton(
                  child: showSubmitBtn ? actionBtn(submitBtnTxt) : SizedBox(),
                  onPressed: () => _onSubmit(context),
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
    return Container(
      width: 45,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.withOpacity(0.3),
      ),
    );
  }

  Widget titleWidget() {
    return Text(
      title!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget actionBtn(String txt) {
    return Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13.0,
        color: Colors.blue,
      ),
    );
  }
}
