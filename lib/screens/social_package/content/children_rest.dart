import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:html/dom.dart' as dom;
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class ChildrenRest extends StatelessWidget {
  const ChildrenRest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      appBar: InkAppBarWithText(title: _strings.childrenRest),
      body: SingleChildScrollView(
        child: Container(
          child: Html(
              onLinkTap: (String? url, RenderContext context,
                  Map<String, String> attributes, dom.Element? element) {
                launchUrl(url!);
              },
              data: '''
                  <h3><a style="color: #2b5e4a;" title="детский отдых.docx.doc" href="https://portal.irkutskoil.ru/upload/medialibrary/3cd/3cda83decc6551152149e27cad7293b9.doc">Форма заявки (в формате .doc)</a></h3>
                  <p>
                     В целях сохранения здоровья детей Общество компенсирует расходы на приобретение путевок в детские оздоровительные лагеря, санаторно-курортные учреждения сотрудникам, имеющим детей школьного возраста&nbsp;и отработавшим в компании более 1 года.
                  </p>
                  <p>
                     На основании личных заявлений сотрудников отдел социальных программ приобретает путевки в детские оздоровительные учреждения.
                  </p>
                  <p>
                     Для детей сотрудников, проживающих за пределами Иркутской области, Общество на основании личных заявлений и подтверждающих документов (договор, квитанция об оплате, обратный талон) производит компенсацию в размере не более 60 % от стоимости путевки.
                  </p>
                  <p>
                  <b>К кому обратиться:</b><br>
                     менеджер отдела подбора и адаптации персонала - Князева Екатерина Леонидовна <a style="color: #2b5e4a;" href="mailto:knyazeva_el@irkutskoil.ru">knyazeva_el@irkutskoil.ru</a> тел. 2200.
                  </p>
                '''),
        ),
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
