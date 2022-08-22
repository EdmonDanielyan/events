import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:html/dom.dart' as dom;
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class VoluntaryMedicalInsurance extends StatelessWidget {
  const VoluntaryMedicalInsurance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      appBar:
          InkAppBarWithText(context, title: _strings.voluntaryMedicalInsurance),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5)))),
            child: Html(
                onLinkTap: (String? url, RenderContext context,
                    Map<String, String> attributes, dom.Element? element) {
                  launchUrl(url!);
                },
                data: '''
<p style="background: white;">
 <span style="color: #40403b;">ООО «ИНК» в рамках системы ДМС сотрудничает с страховой компанией: АО "СОГАЗ".</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Сотрудники, прошедшие испытательный срок, имеют возможность получить бесплатное медицинское обслуживание и консультации в частных и государственных медицинских учреждениях в следующих размерах:</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">- сотрудники категории А и В (высшие должностные лица, эксперты и руководители верхнего звена) – по фактическим затратам;</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">- сотрудники категории С (эксперты и руководители среднего звена) – до 30 000 рублей в календарный год;</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">- сотрудники категории D и E (эксперты и руководители нижнего звена, руководители, специалисты, служащие операционного звена, рабочие) – до 20 000 рублей в календарный год.</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Категорию должности можно уточнить в Положении о гарантиях и компенсациях.</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Для&nbsp;</span><b><span style="color: #7a0045;">получения медицинских услуг в рамках системы ДМС</span></b><span style="color: #40403b;">&nbsp;необходимо минимум за 2-3 дня до обращения в медучреждение написать заявление и направить его&nbsp;</span><a href="https://portal.irkutskoil.ru/services/dms/"><b><span style="color: #006654;">через ИНК-Портал</span></b></a><span style="color: #40403b;">&nbsp;либо в отдел медицинского страхования и договорной работы по электронной почте&nbsp;</span><a href="mailto:med@irkutskoil.ru"><span style="color: #006654;">med@irkutskoil.ru</span></a><span style="color: #40403b;">. В течение 1-3 рабочих дней с момента отправки заявления, направляется смс-сообщение на указанный в заявлении телефон о том, что гарантийное письмо направлено в медицинское учреждение.</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Срок действия гарантийного письма составляет 1 месяц.</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Сумму лимита можно использовать частями.</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Обращаем ваше внимание, что заявление на ДМС необходимо подавать заблаговременно, обработка заявления занимает 1-3 дня!&nbsp;&nbsp;</span>
</p>
 <span style="color: #40403b;">Фактические расходы по гарантийным письмам, известны через 2-3 месяца после окончания гарантийного письма.</span>&nbsp;&nbsp;<br>
<p>
 <a href="https://portal.irkutskoil.ru/services/dms/"><b><span style="color: #006654;">Отправить заявку на ДМС через портал</span></b></a><span style="color: #40403b;"> </span>
</p>
<p style="background: white;">
 <b><span style="color: #7a0045;">По вопросам ДМС</span></b><span style="color: #40403b;">&nbsp;необходимо обращаться к начальнику отдела медицинского страхования и договорной работы&nbsp;</span><a href="https://portal.irkutskoil.ru/personal/?USER_ID=9073"><b><span style="color: #006654;">Щегловой Елизавете Викторовне</span></b></a><b><span style="color: #40403b;"> </span></b><span style="color: #40403b;">(тел.&nbsp;1718, каб. 203, БЦ «Альфа») или главному специалисту по работе со страховыми компаниями&nbsp;</span><a href="https://portal.irkutskoil.ru/personal/?USER_ID=15353"><b><span style="color: #006654;">Николаевой Ирине Ивановне</span></b></a><span style="color: #40403b;">&nbsp;(тел. 1421, каб. 203 БЦ «Альфа»).&nbsp;&nbsp;</span>
</p>
 <span style="color: #005951;"><b>Санаторно-курортное лечение и реабилитационно-восстановительное лечение (РВЛ)</b></span><br>
 <br>
 Чтобы воспользоваться санаторно-курортным лечением, вам необходимо заполнить заявление, указав наименование санатория, его адрес, даты проживания, категорию номера. Далее&nbsp;заявление передается на подпись непосредственному руководителю (ходатайствую, должность, ФИО, дата, подпись), а после отправляется/передается в Департамент охраны здоровья. Обращаем ваше внимание, что заявление на санаторно-курортное лечение необходимо подавать не позднее чем за 2 месяца (в пределах Иркутской области и г. Иркутска) и не позднее чем за 4-6 месяцев (за пределами Иркутской области и г. Иркутска) до предполагаемой даты начала лечения в санатории. Бронировать самостоятельно ничего не нужно.&nbsp;
<p>
	 Прием заявлений в санатории, расположенные в ином регионе нежели проживание сотрудника, только при предоставлении сертификата профилактической прививки от COVID-19, либо сертификат о перенесенном заболевании COVID-19 и с даты выздоровления прошло не более 6 месяцев.
</p>
<p>
	 К заявлению обязательно необходимо приложить справку для получения путевки (форма № 070/у, оформляется у терапевта по месту жительства). Оригинал справки (форма № 070/у) отправляется/передается в Департамент охраны здоровья. Перед заездом в санаторий необходимо обратиться к терапевту и оформить санаторно-курортную карту (форма № 072/у) для прохождения лечения в санатории.
</p>
<p>
	 Воспользоваться санаторно-курортным лечением (не просто отдых!) можно не ранее чем через 2 года, с момента фактического получения услуги, стаж работы в компании, более 2-х лет. Лимит на лечение 55 000 рублей. Длительность путевки на санаторно-курортное или реабилитационно-восстановительное лечение должна составлять 12 (Двенадцать) или более дней. Оплата за родственников производится за счет собственных средств.
</p>
<p>
	 Заявления с подписью необходимо отправлять на адрес департамента охраны здоровья&nbsp;<a href="mailto:med@irkutskoil.ru">med@irkutskoil.ru</a>
</p>
<p>
	 Бланки заявлений, список санаториев, список лечебных учреждений размещены на странице Департамента охраны здоровья на ИНК-Портале (на странице ниже)&nbsp;и на диске R.
</p>
<p>
 <b><span style="color: #005951;">Список клиник</span></b><br>
</p>
 <span style="color: #006654;"><span style="color: #0000ff;"><a title="Список клиник и санаторно-курортных учреждений.xls" href="https://portal.irkutskoil.ru/upload/medialibrary/757/kd1gqadx521hz8sk1268i8fjexdkjyho/Spisok-klinik-i-sanatorno_kurortnykh-uchrezhdeniy.xls">Список клиник и санаторно-курортных учреждений</a></span></span><span style="color: #40403b;"><br>
 <span style="color: #0000ff;"> </span><span style="color: #0000ff;"> </span><span style="color: #0000ff;"> </span></span><a href="https://portal.irkutskoil.ru/upload/medialibrary/6d9/Spisok-lechebnykh-uchrezhdenii_-Moskva.xlsx" title="Список лечебных учреждений_ Москва.xlsx"></a><a title="Список рекомендованных санаторно-курортных учреждений.xls" href="https://portal.irkutskoil.ru/upload/medialibrary/1fa/b2z0gapv9ak842k5u9buk6or7ohudssj/Spisok-rekomendovannykh-sanatorno_kurortnykh-uchrezhdeniy.xls"></a><a title="Список рекомендованных санаторно-курортных учреждений.xls" href="https://portal.irkutskoil.ru/upload/medialibrary/1fa/b2z0gapv9ak842k5u9buk6or7ohudssj/Spisok-rekomendovannykh-sanatorno_kurortnykh-uchrezhdeniy.xls">Список рекомендованных</a><a title="Список рекомендованных санаторно-курортных учреждений.xls" href="https://portal.irkutskoil.ru/upload/medialibrary/1fa/b2z0gapv9ak842k5u9buk6or7ohudssj/Spisok-rekomendovannykh-sanatorno_kurortnykh-uchrezhdeniy.xls"> </a><a title="Список рекомендованных санаторно-курортных учреждений.xls" href="https://portal.irkutskoil.ru/upload/medialibrary/1fa/b2z0gapv9ak842k5u9buk6or7ohudssj/Spisok-rekomendovannykh-sanatorno_kurortnykh-uchrezhdeniy.xls">санаторно-курортных учреждений</a><span style="color: #006654;"><a title="Список рекомендованных санаторно-курортных учреждений.xls" href="https://portal.irkutskoil.ru/upload/medialibrary/1fa/b2z0gapv9ak842k5u9buk6or7ohudssj/Spisok-rekomendovannykh-sanatorno_kurortnykh-uchrezhdeniy.xls"></a><a title="Список рекомендованных санаторно-курортных учреждений.xls" href="https://portal.irkutskoil.ru/upload/medialibrary/1fa/b2z0gapv9ak842k5u9buk6or7ohudssj/Spisok-rekomendovannykh-sanatorno_kurortnykh-uchrezhdeniy.xls"></a></span><a title="Список рекомендованных санаторно-курортных учреждений.xls" href="https://portal.irkutskoil.ru/upload/medialibrary/1fa/b2z0gapv9ak842k5u9buk6or7ohudssj/Spisok-rekomendovannykh-sanatorno_kurortnykh-uchrezhdeniy.xls"> </a><a title="Список рекомендованных санаторно-курортных учреждений.xls" href="https://portal.irkutskoil.ru/upload/medialibrary/1fa/b2z0gapv9ak842k5u9buk6or7ohudssj/Spisok-rekomendovannykh-sanatorno_kurortnykh-uchrezhdeniy.xls"> </a>
<p>
 <a title="Список рекомендованных санаторно-курортных учреждений.xls" href="https://portal.irkutskoil.ru/upload/medialibrary/1fa/b2z0gapv9ak842k5u9buk6or7ohudssj/Spisok-rekomendovannykh-sanatorno_kurortnykh-uchrezhdeniy.xls"> </a>
</p>
 <a title="Список рекомендованных санаторно-курортных учреждений.xls" href="https://portal.irkutskoil.ru/upload/medialibrary/1fa/b2z0gapv9ak842k5u9buk6or7ohudssj/Spisok-rekomendovannykh-sanatorno_kurortnykh-uchrezhdeniy.xls"> </a>
<p>
</p>
<p>
 <b><span style="color: #005951;">Телемедицина</span></b>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Телемедицина - это медицинская помощь в удобном формате, возможность обратиться к врачам онлайн, где бы вы ни находились.</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;"><a title="Программа Телемедицина.docx" href="https://portal.irkutskoil.ru/upload/medialibrary/447/h7qtsm2civwpsttuly158i4zj7uwjsfj/Programma-Telemeditsina.docx">Программа Телемедицина</a></span>
</p>
<p style="background: white;">
 <span style="color: #40403b;"> </span>
</p>
<p style="background: white;">
 <b><span style="color: #006654;">Порядок проведения и график консультации:</span></b>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Телемедицинские консультации врачами-консультантами по: терапии, кардиологии, гастроэнтерологии, эндокринологии, неврологии, гинекологии, ЛОР-врача, офтальмологии, урологии, хирургии, дерматовенерологии, травматологии, ортопедии, онкологии, аллергическим заболеваниям, COVID-19, диетологии, психологии проводятся в онлайн-режиме, круглосуточно, других специалистов – по предварительной записи.</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Для получения медицинской помощи необходимо скачать на свое мобильное устройство приложение АО «СОГАЗ-Телемед» c AppStore или Google Play. Зарегистрироваться в мобильном приложении. </span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">В случае возникновения проблем с регистрацией и получением помощи в рамках программы необходимо обратиться в Федеральный контактный центр СОГАЗ по телефону горячей линии 8 (800) 333-0-888.</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;"> </span>
</p>
<p>
 <span style="color: #006654;"><a title="Программа Телемедицина.docx" href="https://portal.irkutskoil.ru/upload/medialibrary/df5/xzht90d3yrgj2lsi4o6kuzew5uvxn9zi/Programma-Telemeditsina.docx">Программа Телемедицина</a></span>
</p>
<p>
 <span style="color: #006654;"><a title="Памятка по Телемедицине.docx" href="https://portal.irkutskoil.ru/upload/medialibrary/8a4/7xwhbhit2mu9t2pzqx563nv5lyi5eelu/Pamyatka-po-Telemeditsine.docx">Памятка по телемедицине</a></span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Все сотрудники компании, трудоустроенные до 26 мая 2022 года, застрахованы от укуса клещом в АО «АльфаСтрахование» по программе «Альфа Клещ».</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Договор страхования действует с 05 марта 2022 г. по 04 марта 2023 г.</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Страховая сумма на 1 застрахованное лицо – 1 000 000 руб.</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Территория страхования – Российская Федерация.</span>
</p>
<p style="background: white;">
 <span style="color: #40403b;">Период страхового покрытия – 24 часа в сутки.</span>
</p>
<p style="background: white;">
 <b><span style="color: #40403b;">Документы&nbsp;</span></b>
</p>
<p style="background: white;">
 <span style="color: #40403b;"><span style="color: #006654;"><a title="ПАМЯТКА ПРИ УКУСЕ КЛЕЩОМ.docx" href="https://portal.irkutskoil.ru/upload/medialibrary/42b/fw8dwgnjpr94oyupywasmd36vbmjeiwu/PAMYATKA-PRI-UKUSE-KLESHCHOM.docx">Памятка при укусе клещ</a><a title="ПАМЯТКА ПРИ УКУСЕ КЛЕЩОМ.docx" href="https://portal.irkutskoil.ru/upload/medialibrary/42b/fw8dwgnjpr94oyupywasmd36vbmjeiwu/PAMYATKA-PRI-UKUSE-KLESHCHOM.docx">а</a></span></span>
</p>
<p>
</p>
<p style="background: white;">
 <span style="color: #40403b;"><span style="color: #006654;"><a title="Программа АльфаКлещ.doc" href="https://portal.irkutskoil.ru/upload/medialibrary/f16/mgvn4k4eb38kf9xjcpj4snx83381v36m/Programma-AlfaKleshch.doc">Приложение 1 Программа страхования</a></span></span>
</p>
<p>
 <a href="https://portal.irkutskoil.ru/upload/medialibrary/d42/d428701873c4da4b101c075d5b54731c.pdf" title="Программа АльфаТелемед ВИП.pdf"></a>
</p>
                '''),
          ),
        ],
      )),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
