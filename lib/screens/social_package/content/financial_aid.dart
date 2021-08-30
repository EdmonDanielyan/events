import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:html/dom.dart' as dom;

class FinancialAid extends StatelessWidget {
  const FinancialAid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(title: 'Материальная помощь'),
      body: SingleChildScrollView(
        child: Container(
          child: Html(
              onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element) {
                print(url!);
              },
              data: '''
                   <b>Материальная помощь </b>- разовая выплата, предоставляемая сотруднику по решению руководства Компании. Размер материальной помощи определен Положением о гарантиях и компенсациях сотрудникам ООО «ИНК» и составляет <b>20 000 (Двадцать тысяч) рублей</b>.
                  <h3>Формы заявлений на предоставление материальной помощи (в формате .doc):</h3>
                  <p>
                   <a style="color: #2b5e4a;" href="https://portal.irkutskoil.ru/upload/medialibrary/380/380b53e9e119823d8b3231f34bff8075.doc" title="Рождение ребенка.doc">в связи с рождением ребенка</a>
                  </p>
                  <p>
                   <a style="color: #2b5e4a;" title="Регистрация брака.doc" href="https://portal.irkutskoil.ru/upload/medialibrary/fbf/fbf897021f2078250b77877a27f10430.doc">в связи с регистрацией брака</a>
                  </p>
                  <p>
                   <a style="color: #2b5e4a;" title="Смерть родственника.doc" href="https://portal.irkutskoil.ru/upload/medialibrary/1a6/1a6e8cffbe72b34af8409069f4caa8d9.doc">в связи со смертью близкого родственника</a>
                  </p>
                  <p>
                   <a style="color: #2b5e4a;" title="8. ОБРАЗЕЦ Заявление на материальную помощь_1 клсс.doc" href="https://portal.irkutskoil.ru/upload/medialibrary/a76/a766635504c55d6e12506d9c497b2541.doc">в связи с поступлением ребенка в 1 класс</a>
                  </p>
                  <p>
                     Для получения материальной помощи <b>при рождении ребенка </b>необходимо подать следующие документы:
                  </p>
                  <p>
                     - заявление;
                  </p>
                  <p>
                     - копию свидетельства о рождении.
                  </p>
                  <p>
                     Для получения материальной помощи в связи с <b>регистрацией брака </b>необходимо подать следующие документы:
                  </p>
                  <p>
                     - заявление;
                  </p>
                  <p>
                     - копию свидетельства о заключении брака.
                  </p>
                  <p>
                     Для получения материальной помощи в связи со <b>смертью близкого родственника</b> необходимо подать следующие документы:
                  </p>
                  <p>
                     - заявление;
                  </p>
                  <p>
                     - копию свидетельства о смерти;
                  </p>
                  <p>
                     - копии документов, подтверждающих родство.
                  </p>
                  <p>
                     Для получения материальной помощи в связи с <b>поступлением ребенка в 1 класс</b> необходимо подать следующие документы:
                  </p>
                  <p>
                     - заявление;
                  </p>
                  <p>
                  </p>
                  <p>
                     - справка о зачислении ребенка в 1 класс.
                  </p>
                  <p>
                    <b>К кому обратиться:</b><br>
                     Главный специалист отдела социальных программ - Екатерина Князева, тел. 2200, <a style="color: #2b5e4a;" href="mailto:knyazeva_el@irkutskoil.ru">knyazeva_el@irkutskoil.ru</a>&nbsp;&nbsp;
                  </p>
                  <p>
                  </p>
                   <br>
                  <p>
                  </p>
                '''),
        ),
      ),
    );
  }
}
