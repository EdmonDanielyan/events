import 'package:flutter/services.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrl(String url) async {
  try {
    if (!url.contains("http")) {
      final separate = url.split(":");
      if (separate.length == 2) {
        url = Uri(scheme: separate[0], path: separate[1]).toString();
        launch(url.toString());
      }
    }

    await canLaunch(Uri.encodeFull(url))
        ? await launch(Uri.encodeFull(url))
        : showErrorDialog('Не удалось перейти по внешней ссылке');
  } on PlatformException {
    //Unsupported message codecs links
  }
}
