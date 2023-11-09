import 'package:flutter/material.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class SelectFileDialog extends StatefulWidget {
  final void Function() onGallery;
  final void Function() onFiles;
  const SelectFileDialog(
      {Key? key, required this.onGallery, required this.onFiles})
      : super(key: key);

  @override
  _SelectFileDialogState createState() => _SelectFileDialogState();
}

class _SelectFileDialogState extends State<SelectFileDialog> {
  final _horizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return CustomBottomSheetChild(
      title: "",
      cancelBtnTxt: _strings.cancel,
      submitBtnTxt: "",
      horizontalPadding: _horizontalPadding,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 20),
            iconTextWidget(
              icon: Icon(
                Icons.image,
                color: Colors.black,
                size: SizeConfig(context, 19.0).getProportionateScreenHeight,
              ),
              text: _strings.picVidFromGallery,
              onTap: widget.onGallery,
            ),
            const SizedBox(height: 15.0),
            iconTextWidget(
              icon: Icon(
                Icons.file_copy_sharp,
                color: Colors.black,
                size: SizeConfig(context, 19.0).getProportionateScreenHeight,
              ),
              text: _strings.allFiles,
              onTap: widget.onFiles,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget iconTextWidget({
    required Widget icon,
    String text = "",
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10.0),
            Expanded(
                child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize:
                    SizeConfig(context, 13.0).getProportionateScreenHeight,
              ),
            )),
            Icon(
              Icons.chevron_right,
              size: SizeConfig(context, 20.0).getProportionateScreenHeight,
            ),
          ],
        ),
      ),
    );
  }
}
