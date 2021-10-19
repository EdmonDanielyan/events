import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

class ChatAttachScreen extends StatelessWidget {
  const ChatAttachScreen({Key? key}) : super(key: key);
  static double _titleGap = 15.0;
  static double _horizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return CustomBottomSheetChild(
      height: 250.0,
      title: _strings.attach,
      cancelBtnTxt: _strings.cancel,
      submitBtnTxt: "",
      horizontalPadding: _horizontalPadding,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 20),
            iconTextWidget(
              icon: cameraIcon(),
              text: _strings.takePicture,
              onTap: () => print("TAKE A PICTURE"),
            ),
            divider(),
            iconTextWidget(
              icon: picsIcon(),
              text: _strings.picVidFromGallery,
              onTap: () => print("IMAGE OR VIDEO FROM GALLERY"),
            ),
            divider(),
            iconTextWidget(
              icon: docsIcon(),
              text: _strings.document,
              onTap: () => print("Document"),
            ),
          ],
        ),
      ),
    );
  }

  Widget cameraIcon() {
    return Icon(
      Icons.camera_alt_rounded,
      color: Colors.black,
      size: 21.0,
    );
  }

  Widget picsIcon() {
    return Icon(
      Icons.image,
      color: Colors.black,
      size: 21.0,
    );
  }

  Widget docsIcon() {
    return Icon(
      Icons.file_copy_sharp,
      color: Colors.black,
      size: 21.0,
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
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: _titleGap),
            Expanded(
                child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
              ),
            )),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 0, child: Opacity(opacity: 0, child: cameraIcon())),
        SizedBox(width: _titleGap),
        Expanded(child: Divider(color: Colors.grey, height: 11)),
      ],
    );
  }
}
