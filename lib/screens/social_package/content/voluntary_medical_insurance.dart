import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:html/dom.dart' as dom;

class VoluntaryMedicalInsurance extends StatelessWidget {
  const VoluntaryMedicalInsurance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(title: 'Добровольное мед. страхование'),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFE5E5E5)
                      )
                    )
                ),
                child: Html(
                    onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element) {
                      print(url!);
                    },
                    data: '''
                  <h1 align="center">Комплексное медицинское обслуживание</h1>
                    <p>
                     <span style="color: #40403b;">ООО «ИНК» в рамках системы ДМС сотрудничает со следующими страховыми компаниями: ООО СК «ВТБ Страхование», ПАО СК «Росгосстрах», АО «СОГАЗ» и СПАО «Ингосстрах». </span>
                    </p>
                    <p>
                     <span style="color: #40403b;">Сотрудники, прошедшие испытательный срок, имеют возможность получить бесплатное медицинское обслуживание и консультации в частных и государственных медицинских учреждениях в следующих размерах: </span>
                    </p>
                    <p>
                     <span style="color: #40403b;">- сотрудники категории А и В – по фактическим затратам; </span>
                    </p>
                    <p>
                     <span style="color: #40403b;">- сотрудники категории С – до 30 000 рублей в календарный год; </span>
                    </p>
                    <p>
                     <span style="color: #40403b;">- сотрудники категории D и E - до 20 000 рублей в календарный год. </span>
                    </p>
                    <p>
                     <span style="color: #40403b;">Для получения медицинских услуг в рамках системы ДМС необходимо минимум за 2-3 дня до обращения в медучреждение написать заявление и направить его в группу по работе со страховыми компаниями. На основании Вашего заявления в лечебное учреждение будет направлено гарантийное письмо. Срок действия гарантийного письма составляет 1 месяц. </span>
                    </p>
                    <p>
                     <span style="color: #40403b;">Сумму лимита можно использовать частями. </span>
                    </p>
                    <p>
                     <b><span style="color: #40403b;">Как воспользоваться:</span></b><br><span style="color: #40403b;">Определить лимит - категории сотрудников, выбрать клинику (бланки заявлений, список санаториев, список лечебных учреждений размещены на корпоративном портале в разделе «Документы» -  </span><a style="color: #2b5e4a;" href="https://portal.irkutskoil.ru/documents/1163/">«Управление персоналом»</a><span style="color: #40403b;"> и на диске R (Общие документы/ДМС)), заполнить заявление. Оставить заявку на оформление или продление сроков гарантийного письма на ДМС можно:</span>
                    </p>
                    <p>
                     <span style="color: #40403b;">&nbsp;</span>- через <b><a style="color: #2b5e4a;" href="https://portal.irkutskoil.ru/services/dms/">ИНК-Портал</a></b>
                    </p>
                    <p>
                     <span style="color: #40403b;">- по электронной почте (</span><a style="color: #2b5e4a;" href="mailto:med@irkutskoil.ru">med@irkutskoil.ru</a><span style="color: #40403b;">),</span>
                    </p>
                    <p>
                     <b><span style="color: #40403b;">К кому обратиться:</span></b><span style="color: #40403b;">&nbsp;</span>
                    </p>
                    <p>
                     <span style="color: #40403b;">- ведущий специалист&nbsp;по работе со страховыми компаниями –&nbsp;Щеглова Елизавета Викторовна,&nbsp;тел. 1718,&nbsp;E-mail: </span><a style="color: #2b5e4a;" href="mailto:shcheglova_ev@irkutskoil.ru">shcheglova_ev@irkutskoil.ru</a><span style="color: #40403b;">, каб. Б-504, </span>
                    </p>
                    <p>
                     <span style="color: #40403b;">- специалист по работе со страховыми компаниями – Николаева Ирина Ивановна, тел. 1421, </span><span style="color: #40403b;">E</span><span style="color: #40403b;">-</span><span style="color: #40403b;">mail</span><span style="color: #40403b;">: </span><a style="color: #2b5e4a;" href="mailto:nikolaeva_ii@irkutskoil.ru">nikolaeva_ii@irkutskoil.ru</a><span style="color: #40403b;">, каб. Б-504.</span>
                    </p>
                '''),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: Color(0xFFE5E5E5)
                        ),
                        top: BorderSide(
                          color: Color(0xFFE5E5E5)
                        )
                    )
                ),
                child: Html(
                    onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element) {
                      print(url!);
                    },
                    data: '''
                  <h1 align="center">Санаторно-курортное и реабилитационно-восстановительное лечение</h1>
                    <p>
                    <span style="color: #40403b;">Сотрудники, проработавшие в компании более 2 лет, имеют возможность пройти курс санаторно-курортного и реабилитационно-восстановительного лечения в оздоровительных учреждениях на территории Российской Федерации. </span>
                    </p>
                    <p>
                    <span style="color: #40403b;">Воспользоваться данной льготой сотрудник может один раз в 2 года с момента фактического получения услуги. Лимит стоимости путевки составляет 55&nbsp;000 рублей. </span>
                    </p>
                    <p>
                    <span style="color: #40403b;">Для получения направления необходимо минимум за 2 - 3 месяца до предполагаемой даты заезда в санаторий написать заявление, подписать ходатайство у непосредственного руководителя (ходатайствую, должность, ФИО, дата, подпись) и направить его в группу по работе со страховыми компаниями. </span>
                    </p>
                    <p>
                    <span style="color: #40403b;">К заявлению обязательно необходимо приложить справку для получения путевки (форма № 070/у, оформляется у терапевта), а перед заездом в санаторий необходимо обратиться к терапевту и оформить санаторно-курортную карту. </span>
                    </p>
                    <p>
                    <b><span style="color: #40403b;">Как воспользоваться:</span></b><span style="color: #40403b;"> выбрать санаторий, написать заявление (бланки заявлений, список санаториев, список лечебных учреждений размещены на корпоративном портале в разделе «Документы» - «Управление персоналом» (</span><a style="color: #2b5e4a;" href="https://portal.irkutskoil.ru/documents/1163/">https://portal.irkutskoil.ru/documents/1163/</a><span style="color: #40403b;">) и на диске R (Общие документы/ДМС)), подписать ходатайство у непосредственного руководителя (ходатайствую, должность, ФИО, дата, подпись), получить у терапевта справку для оформления&nbsp;путевки – формы № 070/у (передать оригинал в группу по работе со страховыми компаниями) и санаторно-курортную карту (взять с собой в санаторий). </span>
                    </p>
                    <p>
                    <b><span style="color: #40403b;">К кому обратиться:</span></b><span style="color: #40403b;">&nbsp; </span>
                    </p>
                    <p>
                    <span style="color: #40403b;">- ведущий специалист&nbsp;по работе со страховыми компаниями –&nbsp;Щеглова Елизавета Викторовна,&nbsp;тел. 1718,&nbsp;E-mail: </span><a style="color: #2b5e4a;"  href="mailto:shcheglova_ev@irkutskoil.ru">shcheglova_ev@irkutskoil.ru</a><span style="color: #40403b;">, каб. Б-504, </span>
                    </p>
                    <p>
                    <span style="color: #40403b;">- специалист по работе со страховыми компаниями – Николаева Ирина Ивановна, тел. 1421, </span><span style="color: #40403b;">E</span><span style="color: #40403b;">-</span><span style="color: #40403b;">mail</span><span style="color: #40403b;">: </span><a style="color: #2b5e4a;"  href="mailto:nikolaeva_ii@irkutskoil.ru">nikolaeva_ii@irkutskoil.ru</a><span style="color: #40403b;">, каб. Б-504. </span>
                    </p>
                  '''),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: Color(0xFFE5E5E5)
                        ),
                        top: BorderSide(
                            color: Color(0xFFE5E5E5)
                        )
                    )
                ),
                child: Html(
                  onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element) {
                    print(url!);
                  },
                  data: '''
                  <h1 align="center">Вакцинация</h1>
                  <p>
                  <span style="color: #40403b;">Ежегодно в компании проходит вакцинация сотрудников: </span>
                  </p>
                  <p>
                  <span style="color: #40403b;">- в осенний период от гриппа (октябрь); </span>
                  </p>
                  <p>
                  <span style="color: #40403b;">- в весенний период от клещевого энцефалита (март). </span>
                  </p>
                  <p>
                  <span style="color: #40403b;">Сотрудники офиса г. Иркутск проходят вакцинацию в медицинском кабинете Б-505, дата и время вакцинации&nbsp;сообщается предварительно специалистом группы по работе со страховыми компаниями.</span>
                  </p>
                  <p>
                  <span style="color: #40403b;">Сотрудники, работающие вахтовым методом, проходят вакцинацию в медицинских кабинетах на месторождениях Общества. </span>
                  </p>
                  <p>
                  <b><span style="color: #40403b;">К кому обратиться: </span></b>
                  </p>
                  <p>
                  <span style="color: #40403b;">- ведущий специалист по работе со страховыми компаниями – Щеглова Елизавета Викторовна, тел. 1718, E-mail: </span><a style="color: #2b5e4a;" href="mailto:shcheglova_ev@irkutskoil.ru">shcheglova_ev@irkutskoil.ru</a><span style="color: #40403b;">, каб. Б-504, </span>
                  </p>
                  <p>
                  <span style="color: #40403b;">- специалист по работе со страховыми компаниями – Николаева Ирина Ивановна, тел. 1421, E-mail: </span><a style="color: #2b5e4a;" href="mailto:nikolaeva_ii@irkutskoil.ru">nikolaeva_ii@irkutskoil.ru</a><span style="color: #40403b;">, каб. Б-504. </span>
                  </p>
                  ''',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: Color(0xFFE5E5E5)
                        ),
                        top: BorderSide(
                            color: Color(0xFFE5E5E5)
                        )
                    )
                ),
                child: Html(
                  onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element) {
                    print(url!);
                  },
                  data: '''
                  <h1 align="center">Страхование сотрудников от несчастных случаев</h1>
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
                  <p>
                  <b><span style="color: #40403b;">Порядок действий при наступлении события, имеющего признаки страхового случая:</span></b>
                  </p>
                  <p>
                  1.&nbsp;&nbsp;&nbsp; Ознакомиться с <a style="color: #2b5e4a;" href="https://portal.irkutskoil.ru/upload/medialibrary/4db/4db0bedbb0859cb4c8d9c9729035f30b.docx%20" title="Список документов.docx"><b><span style="color: #00736a;"><u>перечнем документов</u></span></b></a>, предоставляемых в ПАО СК «Росгосстрах» для принятия решения о страховой выплате;&nbsp;
                  </p>
                  <p>
                  2.&nbsp;&nbsp;&nbsp; Заполнить <a style="color: #2b5e4a;" href="https://portal.irkutskoil.ru/upload/medialibrary/2cd/2cdf468ce2e738964dd227df2c54aa67.doc%20" title="Форма заявления на страховую выплату.doc"><b><span style="color: #00736a;"><u>заявление</u></span></b></a><b>&nbsp;</b>на&nbsp; страховую выплату;
                  </p>
                  <p>
                  3.&nbsp;&nbsp;&nbsp; Собрать и передать пакет документов:
                  </p>
                  <p>
                  -в центр урегулирования убытков по личному страхованию Иркутского филиала&nbsp; г. Иркутска, ул. Красногвардейская, 23
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
                  <p>
                  <b><span style="color: #40403b;">К кому обратиться: </span></b>
                  </p>
                  <p>
                  <span style="color: #40403b;">- ведущий специалист по работе со страховыми компаниями – Щеглова Елизавета Викторовна, тел. 1718, E-mail: </span><a style="color: #2b5e4a;" href="mailto:shcheglova_ev@irkutskoil.ru">shcheglova_ev@irkutskoil.ru</a><span style="color: #40403b;">, каб. Б-504, </span>
                  </p>
                  <p>
                  <span style="color: #40403b;">- специалист по работе со страховыми компаниями – Николаева Ирина Ивановна, тел. 1421, E-mail: </span><a style="color: #2b5e4a;" href="mailto:nikolaeva_ii@irkutskoil.ru">nikolaeva_ii@irkutskoil.ru</a><span style="color: #40403b;">, каб. Б-504.</span>
                  </p>
                  ''',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(
                            color: Color(0xFFE5E5E5)
                        )
                    )
                ),
                child: Html(
                  onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element) {
                    print(url!);
                  },
                  data: '''
                  <h1 align="center">Корпоративный врач</h1>
                  <p>
                  <span style="color: #40403b;">В офисе г. Иркутск работает корпоративный врач – Карцева Оксана Владимировна, тел. медицинского кабинета 2119,</span> <span style="color: #40403b;">E-mail: </span><a style="color: #2b5e4a;" href="mailto:kartseva_ov@irkutskoil.ru">kartseva_ov@irkutskoil.ru</a><span style="color: #40403b;">, каб. Б-505.</span>
                  </p>
                  <p>
                  <span style="color: #40403b;">Все сотрудники компании имеют возможность получить бесплатную консультацию врача. </span>
                  </p>
                  <p>
                  <span style="color: #40403b;">Врач принимает в будние дни с 08:30 до 17:30.</span>
                  </p>
                  <p>
                  &nbsp;
                  </p>
                  ''',
                ),
              )
            ],
          )
      ),
    );
  }
}
