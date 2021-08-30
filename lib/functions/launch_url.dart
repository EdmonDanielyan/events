import 'package:ink_mobile/functions/errors.dart';
import 'package:url_launcher/url_launcher.dart';

void launchUrl(String url) async {
  await canLaunch(url) ?
    await launch(url) :
    showErrorDialog('Не удалось перейти по внешней ссылке')
  ;
}