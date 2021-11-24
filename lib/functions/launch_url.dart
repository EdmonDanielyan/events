import 'package:flutter/services.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrl(String url) async {
  if (url.contains("mailto")) {
    sendMail(url);
    return;
  }
  try {
    await canLaunch(Uri.encodeFull(url))
        ? await launch(Uri.encodeFull(url))
        : showErrorDialog('Не удалось перейти по внешней ссылке');
  } on PlatformException {
    //Unsupported codecs url
  }
}

Future<void> sendMail(String url) async {
  final split = url.split(":");
  if (split.length > 1) {
    final mailtoLink = Mailto(
      to: [split[1]],
      subject: '',
      body: '',
    );
    print(mailtoLink.toString());
    await launch('$mailtoLink');
  }
}
