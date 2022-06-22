import 'package:flutter/services.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrl(String url, {bool formatUrl = true}) async {
  try {
    if (!url.contains("http")) {
      final separate = url.split(":");
      if (separate.length == 2) {
        url = Uri(scheme: separate[0], path: separate[1]).toString();
        launchUrl(url.toString());
      }
    }

    String newUrl = formatUrl ? Uri.encodeFull(url) : url;

    await canLaunchUrl(Uri.parse(newUrl))
        ? await launchUrl(newUrl)
        : showErrorDialog('Не удалось перейти по внешней ссылке');
  } on PlatformException {
    //Unsupported message codecs links
  } catch (_) {}
}
