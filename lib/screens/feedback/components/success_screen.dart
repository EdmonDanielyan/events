import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class SuccessScreen extends StatelessWidget {
  final void Function() onDismiss;
  final void Function(BuildContext) onSendNew;

  const SuccessScreen({
    required this.onDismiss,
    required this.onSendNew,
  });

  @override
  Widget build(BuildContext context) {

    final style = ElevatedButton.styleFrom(
      fixedSize: Size(150, 40),
      backgroundColor: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(11.0),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: InkAppBarWithText(context, title: localizationInstance.feedback),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                localizationInstance.yourApplyCreated,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onDismiss,
                child: Text(localizationInstance.end),
                style: style,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () =>  onSendNew(context),
                child: Text(localizationInstance.createNew),
                style: style,
              )
            ]),
      ),
    );
  }
}
