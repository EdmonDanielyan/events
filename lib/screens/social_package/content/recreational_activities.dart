import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:html/dom.dart' as dom;
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class RecreationalActivities extends StatelessWidget {
  const RecreationalActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      appBar: InkAppBarWithText(title: _strings.recreationalActivities),
      body: SingleChildScrollView(
        child: Container(
          child: Html(
              onLinkTap: (String? url, RenderContext context,
                  Map<String, String> attributes, dom.Element? element) {
                launchUrl(url!);
              },
              data: '''
                  <p>
                     Тренажерный зал Oil Gym
                  </p>
                  <p>
                     Тренажерный зал Oil Gym находится в цокольном этаже башни А офиса Компании в&nbsp; г. Иркутске.
                  </p>
                  <p>
                     Режим работы: по будням с 7:00 до 21:00, в субботу с 10:00 до 17:00.
                  </p>
                  <p>
                     Стоимость месячного абонемента составляет 1&nbsp;500 рублей.
                  </p>
                  <p>
                     Стоимость индивидуальной тренировки 1 час - 200 рублей.
                  </p>
                  <p>
                     По вопросам обращаться к руководителю тренажерного зала Батурину Андрею Григорьевичу вн. тел. 2191.
                  </p>
                  <h3>Компенсация занятий спортом для сотрудников, работающих вахтовым методом и в офисе г. Усть-Кут.</h3>
                  <p>
                     Сотрудникам офиса г. Усть-Кут, а также работающим вахтовым методом и проживающим за пределами г. Иркутска, Общество возмещает расходы в размере 1&nbsp;000 рублей в месяц.
                  </p>
                  <p>
                     Для получения компенсации необходимо подать следующие документы:
                  </p>
                  <p>
                     - заявление <b>(</b><a style="color: #2b5e4a;" title="об оплате спорта..docx" href="https://portal.irkutskoil.ru/upload/medialibrary/f89/f89469e76448a5182f1ecb0043a7ad74.docx"><b>форма заявления .doc</b></a><b>)</b>;
                  </p>
                  <p>
                  </p>
                  <p>
                     - документы, подтверждающие расходы (договор, абонемент, чек об оплате).&nbsp;
                  </p>
                  <p>
                     Группа здоровья
                  </p>
                  <p>
                     Футбол/волейбол/баскетбол
                  </p>
                  <p>
                  </p>
                  <p>
                     По вопросам обращаться к Пучнину Павлу Леонидовичу тел. 2589, Кравцову Андрею Анатольевичу тел. 2019, Дорошенко Александру Николаевичу тел. 2104.
                  </p>
                '''),
        ),
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
