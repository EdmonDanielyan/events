import 'package:flutter/material.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/files.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/messages/chat/entities/attach_entities.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

class ChatAttachScreen extends StatefulWidget {
  final Function(ChatEntities)? onSend;
  const ChatAttachScreen({Key? key, this.onSend}) : super(key: key);
  static double _titleGap = 15.0;
  static double _horizontalPadding = 20.0;

  @override
  _ChatAttachScreenState createState() => _ChatAttachScreenState();
}

class _ChatAttachScreenState extends State<ChatAttachScreen> {
  ChatAttachEntities chatAttachEntities = ChatAttachEntities();

  void _onSubmit() {
    if (widget.onSend != null) {
      final entities = ChatEntities(
        text: chatAttachEntities.link,
        type: MessageType.Document,
      );
      widget.onSend!(entities);
      Navigator.of(context).pop();
    }
  }

  void _onLinkChanged(String val) {
    final isValidUrl = isStringUrl(val);

    if (isValidUrl) {
      setState(() {
        chatAttachEntities.link = val;
      });
    } else if (chatAttachEntities.link.isNotEmpty) {
      setState(() {
        chatAttachEntities.link = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return CustomBottomSheetChild(
      title: _strings.attach,
      cancelBtnTxt: _strings.cancel,
      submitBtnTxt: chatAttachEntities.link.isNotEmpty ? _strings.submit : "",
      onSubmit: _onSubmit,
      horizontalPadding: ChatAttachScreen._horizontalPadding,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ChatAttachScreen._horizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 20),
            textfieldWidget(
              hint: _strings.addLink,
              validator: (val) =>
                  !isStringUrl(val!) ? _strings.fillTheFieldCorrectly : null,
              onChanged: _onLinkChanged,
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget textfieldWidget({
    String? initalValue,
    String hint = "",
    FontWeight fontWeight = FontWeight.normal,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
  }) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: ChatAttachScreen._horizontalPadding),
      child: TextFormField(
        onChanged: onChanged,
        initialValue: initalValue,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hint,
        ),
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: fontWeight,
          color: Colors.black,
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
            SizedBox(width: ChatAttachScreen._titleGap),
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
        SizedBox(width: ChatAttachScreen._titleGap),
        Expanded(child: Divider(color: Colors.grey, height: 11)),
      ],
    );
  }
}
