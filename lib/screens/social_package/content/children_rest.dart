import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/social_package/content/social_package_widget.dart';

class ChildrenRest extends StatefulWidget {
  const ChildrenRest({Key? key}) : super(key: key);

  @override
  State<ChildrenRest> createState() => _ChildrenRestState();
}

class _ChildrenRestState extends State<ChildrenRest> {
  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return SocialPackageWidget(
      appBarTitle: _strings.childrenRest,
      errorWidget: _oldTextWidget(),
    );
  }

  Widget _oldTextWidget() {
    return CustomLayoutBuilder(builder: (context, constraint, isTablet) {
      return Container(
        child: Html(
            style: isTablet
                ? {
                    "body": Style(
                      fontSize: FontSize(24.0),
                    ),
                    "h3": Style(
                      fontSize: FontSize(26.0),
                    )
                  }
                : {},
            onLinkTap: (String? url, RenderContext context,
                Map<String, String> attributes, dom.Element? element) {
              launchUrl(url!);
            },
            data: '''
                  <h3><span style="color: #00736a;"><u><span style="color: #00736a;"><a href="https://portal.irkutskoil.ru/upload/medialibrary/619/tr3mi9e5kzokh8xx8vthocqu3pvujhux/F_14.P.11.15-_red.-11_detskiy-otdykh.docx">Форма заявки</a><a href="https://portal.irkutskoil.ru/upload/medialibrary/619/tr3mi9e5kzokh8xx8vthocqu3pvujhux/F_14.P.11.15-_red.-11_detskiy-otdykh.docx">&nbsp;(в формате .doc)</a></span></u></span></h3>
        <p>
        	 В целях сохранения здоровья детей Общество компенсирует расходы на приобретение путевок в детские оздоровительные лагеря, санаторно-курортные учреждения сотрудникам, имеющим детей школьного возраста и отработавшим в ООО «ИНК» не менее одного года на момент приобретения путёвки.
        </p>
        <p>
        	 На основании личных заявлений сотрудников отдел социальных программ приобретает путевки в детские оздоровительные учреждения.
        </p>
        <p>
        	 Для детей сотрудников, проживающих за пределами Иркутской области, Общество на основании личных заявлений и подтверждающих документов (договор, квитанция об оплате, обратный талон) производит компенсацию в размере не более 60 % от стоимости путевки.
        </p>
        <p>
         <b><span style="color: #00736a;">К кому обратиться:&nbsp;</span></b>
        </p>
        <p>
        	 Ведущий специалист отдела социальных программ – Марина Константинова, тел. 9060, <a href="mailto:konstantinova_me@irkutskoil.ru">konstantinova_me@irkutskoil.ru</a>
        </p>
                '''),
      );
    });
  }
}
