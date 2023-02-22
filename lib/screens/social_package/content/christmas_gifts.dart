import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/social_package/content/social_package_widget.dart';

class ChristmasGifts extends StatefulWidget {
  const ChristmasGifts({Key? key}) : super(key: key);

  @override
  State<ChristmasGifts> createState() => _ChristmasGiftsState();
}

class _ChristmasGiftsState extends State<ChristmasGifts> {

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return SocialPackageWidget(
      errorWidget: _oldTextWidget(),
    );
  }

  Widget _oldTextWidget() {
    return CustomLayoutBuilder(
      builder: (context, constraint, isTablet) {
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
    );
  }
}
