import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:html/dom.dart' as dom;
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class ChristmasGifts extends StatelessWidget {
  const ChristmasGifts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      appBar: InkAppBarWithText(context, title: _strings.christmasGifts),
      body: SingleChildScrollView(
        child:CustomLayoutBuilder(builder: (context, constraint, isTablet) {
            return Container(
              child: Html(
                style: isTablet
                      ? {
                          "body": Style(
                            fontSize: FontSize(24.0),
                          ),
                        
                        }
                      : {},
                  onLinkTap: (String? url, RenderContext context,
                      Map<String, String> attributes, dom.Element? element) {
                    launchUrl(url!);
                  },
                  data: '''
                     <p>
	 Ежегодно за счет средств Общества детям сотрудников в возрасте в возрасте не старше 15 лет на дату окончания года приобретаются подарки к Новому году.
</p>
<p>
	 Выдача подарков для сотрудников, работающих вахтовым методом, осуществляется техником цеха/менеджером, отвечающим за координацию процессов в подразделении, для сотрудников офиса г. Иркутск - отделом&nbsp;социальных программ.&nbsp;<br>
</p>
<p>
	 Компания не гарантирует выдачу детского новогоднего подарка работникам, принятым на работу позднее первого декабря текущего года.<br>
                    '''),
            );
          }
        ),
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
