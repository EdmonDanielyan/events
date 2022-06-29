import 'package:flutter/services.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:url_launcher/url_launcher.dart' as urlLaucnher;

Future<void> launchUrl(String url, {bool formatUrl = true}) async {
  try {
    if (!url.contains("http")) {
      final separate = url.split(":");
      if (separate.length == 2) {
        url = Uri(scheme: separate[0], path: separate[1]).toString();
        urlLaucnher.launchUrl(Uri.parse(url.toString()));
      }
    }

    String newUrl = formatUrl ? Uri.encodeFull(url) : url;

    await urlLaucnher.canLaunchUrl(Uri.parse(newUrl))
        ? await urlLaucnher.launchUrl(Uri.parse(newUrl),
            mode: urlLaucnher.LaunchMode.externalApplication)
        : showErrorDialog('Не удалось перейти по внешней ссылке');
  } on PlatformException {
    //Unsupported message codecs links
  } catch (_) {}
}
