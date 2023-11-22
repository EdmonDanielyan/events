import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:url_launcher/url_launcher.dart' as urlLaucnher;

Future<void> launchUrl(String url,
    {bool formatUrl = true, BuildContext? context}) async {
  try {
    if (url.contains("USER_ID")) {
      if (context != null) {
        var _id = int.tryParse(url.substring(url.indexOf('=') + 1, url.length));
        if (_id == null) {
          showErrorDialog('Не удалось перейти по внешней ссылке');
        } else {
          Navigator.pushNamed(context, "/personal", arguments: {'id': _id});
        }
        return;
      }
    }

    if (!url.contains("http")) {
      if (url[0] == "/") {
        url = UrlsConfig.defaultUrl + url;
        urlLaucnher.launchUrl(Uri.parse(url),
            mode: urlLaucnher.LaunchMode.externalApplication);
        return;
      } else if (url.contains('/')) {
        url = UrlsConfig.defaultUrl + url;
        urlLaucnher.launchUrl(Uri.parse(url),
            mode: urlLaucnher.LaunchMode.externalApplication);
        return;
      }
      final separate = url.split(":");
      if (separate.length == 2) {
        url = Uri(scheme: separate[0], path: separate[1]).toString();
        urlLaucnher.launchUrl(Uri.parse(url.toString()),
            mode: urlLaucnher.LaunchMode.externalApplication);
        return;
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
