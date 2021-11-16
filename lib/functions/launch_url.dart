import 'package:ink_mobile/functions/errors.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrl(String url) async {
  if (!url.contains("http")) {
    final separate = url.split(":");
    if (separate.length == 2) {
      print(separate[0]);
      print(separate[1]);
      url = Uri(scheme: separate[0], path: separate[1]).toString();
      launch(url.toString());
    }
  }

  print(url);
  await canLaunch(url)
      ? await launch(url)
      : showErrorDialog('Не удалось перейти по внешней ссылке');
}
