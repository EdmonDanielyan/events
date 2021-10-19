import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:html/dom.dart' as dom;
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class ChristmasGifts extends StatelessWidget {
  const ChristmasGifts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      appBar: InkAppBarWithText(title: _strings.christmasGifts),
      body: SingleChildScrollView(
        child: Container(
          child: Html(
              onLinkTap: (String? url, RenderContext context,
                  Map<String, String> attributes, dom.Element? element) {
                launchUrl(url!);
              },
              data: '''
                  <p>
                     Ежегодно за счет средств Общества детям сотрудников в возрасте до 14 лет (включительно) приобретаются подарки к Новому году.
                  </p>
                  <p>
                     Выдача подарков для сотрудников, работающих вахтовым методом, осуществляется сотрудниками отдела кадрового администрирования в офисе г. Усть-Кут,&nbsp;для сотрудников&nbsp;офиса г. Иркутск - отделом подбора и адаптации персонала
                  </p>
                '''),
        ),
      ),
      bottomNavigationBar: NewBottomNavBar(),
    );
  }
}
