import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:html/dom.dart' as dom;
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/functions/launch_url.dart';

class CompensationTravel extends StatelessWidget {
  const CompensationTravel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(context,
          title: "Компенсация проезда к месту отдыха"),
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
<p>
	 Работники ООО «ИНК», работающие в районах Крайнего Севера и/или в приравненных к ним местностях, имеют право на компенсацию один раз в два года за счет средств ООО «ИНК» расходов по оплате стоимости проезда этих работников и провоза их багажа или также стоимости проезда членов семьи и провоза их багажа в пределах территории Российской Федерации от места жительства (пребывания) к месту использования ежегодного оплачиваемого отпуска этих работников и обратно (<i>далее по тексту также «компенсация расходов»</i>).
</p>
<p>
	 Право на компенсацию расходов за первый и второй годы непрерывной работы в ООО «ИНК» возникает у работника одновременно с правом на получение ежегодного оплачиваемого отпуска за первый год работы в ООО «ИНК» либо ранее, если непрерывный стаж его работы в ООО «ИНК» и Обществах равен или превышает шесть месяцев. В дальнейшем работник имеет право на компенсацию расходов за третий и четвертый годы непрерывной работы в ООО «ИНК» – начиная с третьего года работы, за пятый и шестой годы – начиная с пятого года работы и т.д.
</p>
<p>
 <i>Подробные условия, порядок оформления и размер компенсации определён в разделе 2.10 <u><a href="https://portal.irkutskoil.ru/documents/download.php?id=186125">Положения о гарантиях и компенсациях</a></u>.</i>
                '''),
          ),
        ],
      )),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}