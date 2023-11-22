import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class PermissionDenied extends StatelessWidget {
  const PermissionDenied({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
      child: Center(
          child: Text(
        _strings.accessRightsReferInfo,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, color: Color(0xFF2B5E4A)),
      )),
    );
  }
}
