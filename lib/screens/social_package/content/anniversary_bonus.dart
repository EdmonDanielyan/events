import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:html/dom.dart' as dom;
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/functions/launch_url.dart';

class AnniversaryBonus extends StatelessWidget {
  const AnniversaryBonus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(context, title: "Премирование сотрудников"),
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
<h4> <b>Единовременная выплата к юбилейным датам</b> </h4>
<p>
	 Работникам может быть произведена единовременная выплата по случаю юбилея (<i>юбилейными считаются даты, начиная с 50 лет, кратные пяти: 50, 55, 60 и т.д.</i>).
</p>
<p>
	 Выплата предусмотрена для работников, проработавших в ООО «ИНК» не менее двух лет до наступления юбилейной даты.
</p>
<p>
	 Решение о выплате принимает генеральный директор на основании <a href="https://portal.irkutskoil.ru/upload/iblock/e03/5a896ocmcpi0cclfw5suiv70kt5w9yjl/Sluzhebnaya-zapiska-o-premirovanii-k-yubileyu.docx"><u>служебной записки</u></a> от руководителя премируемого работника. Служебную записку необходимо направить в подразделение по управлению персоналом не позднее чем за 5 рабочих дней до юбилейной даты работника.
</p>
<p>
	 При наличии у работника дисциплинарных взысканий (замечание, выговор) выплата не производится.
</p>
<p>
	 Размер выплат определяется Положением о гарантиях и компенсациях. Для работников, временно переведённых на другую должность, расчёт премии осуществляется по основному месту работы.
</p>
<p>
	 &nbsp;
</p>
<h4>
Единовременная выплата за стаж работы </h4>
<p>
	 Работникам могут быть вручены ценные подарки, благодарственные письма, а также может быть произведена единовременная выплата при достижении непрерывного стажа работы в ООО «ИНК» и Обществах 10, 15, 20 и 25 лет.
</p>
<p>
	 Решение о выплате принимает генеральный директор на основании <a href="https://portal.irkutskoil.ru/upload/iblock/074/kv5090g19eudmeees19dvngsivflzapx/Sluzhebnaya-zapiska-o-premirovanii-k-yubileyu-stazha.docx"><u>служебной записки</u></a>/ходатайства руководителя премируемого работника . Служебную записку необходимо направить в подразделение по управлению персоналом не позднее, чем за 10 рабочих дней, до наступления даты юбилея стажа работника.
</p>
<p>
	 При наличии у работника неснятых дисциплинарных взысканий (замечание, выговор) выплата не производится.
</p>
<p>
	 Размер выплат определяется <a href="https://portal.irkutskoil.ru/upload/iblock/97a/r0nts3e8ptrfw3i03xg5jl50oc2yohzu/Polozhenie-o-garantiyakh-i-kompensatsiyakh-sotrudnikam-OOO-INK.pdf" target="_blank"><u>Положения о гарантиях и компенсациях</u></a>.
</p>
<p>
	 &nbsp;
</p>
<p>
 <b>К кому обратиться:&nbsp;</b>
</p>
<p>
	 Марина Константинова, ведущий специалист отдела социальных программ <br>
	 тел. 9060, <a href="mailto:konstantinova_me@irkutskoil.ru">konstantinova_me@irkutskoil.ru</a><br>
                '''),
          ),
        ],
      )),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
