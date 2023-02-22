import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/social_package/content/social_package_widget.dart';

class RecreationalActivities extends StatefulWidget {
  const RecreationalActivities({Key? key}) : super(key: key);

  @override
  State<RecreationalActivities> createState() => _RecreationalActivitiesState();
}

class _RecreationalActivitiesState extends State<RecreationalActivities> {

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
                      "h3": Style(fontSize: FontSize(26.0),)
                    }
                  : {},
              onLinkTap: (String? url, RenderContext context,
                  Map<String, String> attributes, dom.Element? element) {
                launchUrl(url!);
              },
              data: '''
                 <h3>&nbsp;<b><span style="color: #00736a;">Тренажерный зал Oil Gym</span></b> </h3>
        <p>
        	 Тренажерный зал Oil Gym находится в цокольном этаже башни "А" офиса компании в&nbsp; г. Иркутске (БЦ "Астра").
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
         <span style="color: #00736a;"><b>
        <h3>Компенсация занятий спортом для сотрудников, работающих вахтовым методом и в офисе г. Усть-Кут</h3>
         </b></span>
        <p>
        	 Сотрудникам офиса г. Усть-Кут, а также работающим вахтовым методом и проживающим за пределами г. Иркутска, Общество возмещает расходы в размере 50% расходов до вычета НДФЛ.
        </p>
        <p>
        	 Для получения компенсации необходимо подать следующие документы:
        </p>
        <p>
        	 - заявление<u><b> (</b></u><u><b><a href="https://portal.irkutskoil.ru/upload/medialibrary/d8b/wqdq01scz4sflxefryzmk6ctkbzlj1wy/F_12.P.11.15-_red.-11_sport.docx">форма заявления .doc</a></b></u><u><b>)</b></u> ;
        </p>
        <p>
        </p>
        <p>
        	 - документы, подтверждающие расходы (договор, абонемент, чек об оплате).&nbsp;
        </p>
        <p>
        </p>
        <h3>
        <p>
         <span style="color: #00736a;"><b>Группы здоровья</b></span>
        </p>
         </h3>
        <p>
        	 Для сотрудников, проживающих&nbsp;в&nbsp;Иркутске, предоставляется возможность войти в состав корпоративных спортивных команд&nbsp;либо посещать группы здоровья по следующим видам спорта:
        </p>
        <p>
        	 - волейбол;
        </p>
        <p>
        	 - баскетбол;
        </p>
        <p>
        	 - футбол;
        </p>
        <p>
        	 - настольный теннис;
        </p>
        <p>
        	 - спортивные танцы (чирлидинг);
        </p>
        <p>
        	 - гиревой спорт;
        </p>
        <p>
        	 - хоккей с шайбой
        </p>
        <p>
        	 - бег;
        </p>
        <p>
        	 - шахматы;
        </p>
        <p>
        	 Подробнее о группах здоровья (в том числе расписание) -&nbsp; в разделе "<a href="https://portal.irkutskoil.ru/sport/"><b><u>Спорт</u></b></a>".&nbsp;
                '''),
        );
      }
    );
  }
}
