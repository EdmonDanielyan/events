import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:html/dom.dart' as dom;

class AccidentInsurance extends StatelessWidget {
  const AccidentInsurance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(title: 'Страхование от несч. случаев'),
      body: SingleChildScrollView(
          child: Container(
            child: Html(
                onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element) {
                  print(url!);
                },
                data: '''
                  <h1>Страхование от несчастных случаев</h1>
                  <p>
                     Все сотрудники компании застрахованы от несчастных случаев в размере, определенном договором страхования от несчастных случаев (Договор 2020-2021 гг. с ПАО СК &nbsp;«Росгосстрах» № НСК81-Д-63809000-000081-20 от «14» марта 2020 г.)
                  </p>
                  <p>
                     Договор страхования действуют с 15 марта&nbsp;2020 г. по 14&nbsp;марта 2021 г.
                  </p>
                  <p>
                     Территория страхования — весь мир.
                  </p>
                  <p>
                     Период страхового покрытия - 24 часа в сутки (круглосуточно).
                  </p>
                  <p>
                  </p>
                  <p>
                     Страховая сумма на 1 застрахованное лицо –&nbsp;600&nbsp;000 рублей.&nbsp;&nbsp;
                  </p>
                  <table style="border-collapse: collapse;">
                  <tbody>
                  <tr>
                    <td style="border:1px solid;">
                      <p>
                   <span style="color: #40403b;">Страховые риски* </span>
                      </p>
                    </td>
                    <td style="border:1px solid;">
                      <p align="center">
                   <span style="color: #40403b;">Объем выплат** </span>
                      </p>
                    </td>
                  </tr>
                  <tr style="height: 36.45pt;">
                    <td style="border:1px solid;">
                      <p>
                   <span style="color: #40403b;">Смерть Застрахованного лица </span>
                      </p>
                    </td>
                    <td style="border:1px solid;">
                      <p>
                   <span style="color: #40403b;">100% страховой суммы выплачивается единовременно Выгодоприобретателю Застрахованного лица </span>
                      </p>
                    </td>
                  </tr>
                  <tr style="height: 53pt;">
                    <td style="border:1px solid;">
                      <p>
                   <span style="color: #40403b;">Постоянная утрата трудоспособности, выразившаяся в установлении инвалидности </span><br><b><span style="color: red;">(!Обязательно предоставить больничный лист)</span></b>
                      </p>
                    </td>
                    <td style="border:1px solid;">
                      <p>
                   <span style="color: #40403b;">Единовременно Застрахованному лицу выплачивается***: </span>
                      </p>
                      <p>
                   <span style="color: #40403b;">1 группа: 100% страховой суммы </span>
                      </p>
                      <p>
                   <span style="color: #40403b;">2 группа: 80% страховой суммы </span>
                      </p>
                      <p>
                   <span style="color: #40403b;">3 группа: 60% страховой суммы </span>
                      </p>
                    </td>
                  </tr>
                  <tr style="height: 71.1pt;">
                    <td style="border:1px solid;">
                      <p>
                   <span style="color: #40403b;">Временная утрата трудоспособности </span>
                      </p>
                    </td>
                    <td style="border:1px solid;">
                      <p>
                   <span style="color: #40403b;">Застрахованному единовременно выплачивается % от страховой суммы в соответствии с «Таблицей размеров страховых выплат в связи с несчастным случаем» </span>
                      </p>
                    </td>
                  </tr>
                  </tbody>
                  </table>
                  <p>
                   <b><span style="color: #40403b;">Порядок действий при наступлении события, имеющего признаки страхового случая:</span></b><span style="color: #40403b;"> </span>
                  </p>
                  <p>
                     1.&nbsp;&nbsp;&nbsp; Ознакомиться с <a style="color: #2b5e4a;" href="https://portal.irkutskoil.ru/upload/medialibrary/ca8/ca87437d6c583d139401973294d2af59.docx" title="Список документов.docx"><b>перечнем документов</b></a>, предоставляемых в ПАО СК «Росгосстрах» для принятия решения о страховой выплате;&nbsp;
                  </p>
                  <p>
                     2.&nbsp;&nbsp;&nbsp; Заполнить <a style="color: #2b5e4a;" href="https://portal.irkutskoil.ru/upload/medialibrary/2d7/2d72dfa341286fa1228c2a9f3aa79fa6.doc" title="Форма заявления на страховую выплату.doc"><b>заявление</b></a> на страховую выплату;
                  </p>
                  <p>
                     3.&nbsp;&nbsp;&nbsp; Собрать и передать пакет документов:
                  </p>
                  <p>
                     -в центр урегулирования убытков по личному страхованию Иркутского филиала &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;г. Иркутска, ул. Красногвардейская, 23
                  </p>
                  <p>
                     Часы работы отдела урегулирования убытков филиала– пн.-пт. с 09.00 до 18.00, обед с 13:00 до 14:00, обед с 13.00 до 14.00 сб.- вс. - выходные.
                  </p>
                  <p>
                     - отправить его почтой России в ближайший Филиал ПАО СК Росгосстрах в Иркутской области на адрес г. Иркутск, ул. Рабочего Штаба, 9.<br>
                   <span style="color: #40403b;"><br>
                   </span><b>Уточнить перечень документов, предоставляемых в страховую компанию для принятия решения о страховой выплате, Вы можете по телефонам:</b>
                  </p>
                  <p>
                     - бесплатной горячей линии 8&nbsp;800&nbsp;200 51 11 (звонок бесплатный);
                  </p>
                  <p>
                  </p>
                  <p>
                     - Филиал ПАО СК Росгосстрах в Иркутской области 8 (3952) 210-100
                  </p>
                  <h3><span style="color: #555555;">Документы</span></h3>
                   <a style="color: #2b5e4a;" title="Договор.docx" href="https://portal.irkutskoil.ru/upload/medialibrary/19b/19b706d11a46c77e0a44ddacb8788538.docx">Договор</a><br>
                   <br>
                   <a style="color: #2b5e4a;" title="Таблица выплат.xlsx" href="https://portal.irkutskoil.ru/upload/medialibrary/03d/03d1e6d812dccef8c47dfe0e47d5d6fe.xlsx">Таблица выплат</a><br>
                   <br>
                   <a style="color: #2b5e4a;" title="Памятка по страхованию от НС.docx" href="https://portal.irkutskoil.ru/upload/medialibrary/e6b/e6b212138acc769fc89053f66009b2e6.docx">Памятка по страхованию от несчастного случая</a><br>
                   <br>
                   <a style="color: #2b5e4a;" title="Правила страхования.pdf" href="https://portal.irkutskoil.ru/upload/medialibrary/ebe/ebe6eef3f2842eaf773f09624cd48f59.pdf">Приложение 1 к Договору Правила страхования</a><br>
                   <br>
                   <a style="color: #2b5e4a;" title="Форма Согласия Застрахованных лиц на обработку их персональных данных.docx" href="https://portal.irkutskoil.ru/upload/medialibrary/2b9/2b9305a4f26a03c96a1bc20d20ca8293.docx">Приложение 3 к Договору Согласие на обработку персональных данных</a><br>
                   <br>
                   <a style="color: #2b5e4a;" title="Форма заявления на страховую выплату.doc" href="https://portal.irkutskoil.ru/upload/medialibrary/2cd/2cdf468ce2e738964dd227df2c54aa67.doc">Приложение
                  <p>
                  </p>
                   <br>
                   </a>
                '''),
          ),
      ),
    );
  }
}
