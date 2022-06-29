import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/open_university/components/about_project_contact_container.dart';

class AboutProject extends StatelessWidget {
  AboutProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Container(
        margin: EdgeInsets.only(bottom: 24),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Text(
                    " ${_strings.aboutProject}", // Пробел для того, чтобы заголовок был с тем же отступом, что и HTML
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
            Html(
              data: '''<p align="right" style="text-align: left;">
 <b><span style="">Идёшь вперёд ты - идёт вперёд компания. </span></b>
 <b><span style=""></span></b>
 <b><span style="">Так проявляется ЛИДЕРСТВО</span></b>
</p>
<p align="right" style="text-align: left;">
 <b>«Открытый университет»</b> – это образовательный проект по управлению знаниями, доступный для каждого сотрудника группы компаний ИНК.
</p>
<br>
<br>
<p>
 <b>Цели проекта:</b>
</p>
<p>
	 <span style="color: #2b5e4a; font-weight: bold;">1.</span> Создание среды для обмена знаниями.
</p>
<p>
	 <span style="color: #2b5e4a; font-weight: bold;">2.</span> Развитие внутренней экспертизы.
</p>
<p>
	 <span style="color: #2b5e4a; font-weight: bold;">3.</span> Выявление и поддержка талантливых сотрудников.
</p>
<br>
<br>
<p>
 <b>Принципы</b>
</p>
<p>
	 <span style="color: #2b5e4a; font-weight: bold;">1.</span> Открытость и доступность знаний.
</p>
<p>
	 <span style="color: #2b5e4a; font-weight: bold;">2.</span> Масштабность (большой охват разных целевых аудиторий).
</p>
<p>
	 <span style="color: #2b5e4a; font-weight: bold;">3.</span> Самоорганизация (легкое, доступное расписание, с возможностью записаться на любой курс, мастер-класс).
</p>
<p>
	 <span style="color: #2b5e4a; font-weight: bold;">4.</span> Вовлеченность (любой сотрудник может выступить в качестве и спикера и слушателя).
</p>
<p>
	 <span style="color: #2b5e4a; font-weight: bold;">5.</span> Быстрота и легкость получения знаний (краткие мастер-классы, лекции, workshop, вебинары, разговорные клубы, TED-форматы, бизнес-завтраки).
</p>
<p>
	 <span style="color: #2b5e4a; font-weight: bold;">6.</span> Диджитализация (открытая запись на любое мероприятие через портал ИНК, трансляция всех мероприятий через официальный You Tube канал компании, сохранение всех материалов «Открытого университета» на портале ИНК).
</p>
<br>
<br>
<p>
 <b>Участники</b>
</p>
<p>
	 В рамках проекта «Открытый университет» каждый сотрудник может посетить любое мероприятие по самым разным темам: от профессиональных и технических до развивающих и управленческих программ.
</p>
<p>
	 Сейчас «Открытый университет» работает в онлайн формате. Каждую неделю проходят вебинары внутренних тренеров и открытые внешние мероприятия, которые мы анонсируем в еженедельном дайджесте «Открытого университета».
</p>
<p>
	 Чтобы принять участие в каком-либо мероприятии достаточно просто зарегистрировать на него на странице «Открытого университета» на ИНК-Портале.
</p>
<p>
	 Все мероприятия проходят на доступных платформах: teams, skype или zoom, для входа нужен только интернет.
</p>
<p style="width: 850px; text-align: justify;">
</p>
<p>
	Обучающие материалы «Открытого университета» мы сохраняем на портале в разделе "ИНК-Знание", блок "Обучающие материалы". Если по расписанию вы не смогли присоединится к какому-то мероприятию, у вас всегда есть возможность к ним вернутся и изучить их дополнительно.
</p>
<p>
	 Приглашаем всех желающих присоединиться к команде внутренних тренеров и поделится с коллегами своим опытом и экспертизой.
</p>
<p>
	 По вопросам можно обращаться к Татьяне Ефименко вн. тел: <span style="color: #2b5e4a">2028</span>
</p>
 <br>
<p>
</p>''',
              onLinkTap: (
                String? url,
                RenderContext context,
                Map<String, String> attributes,
                _,
              ) {
                launchUrl(url!);
              },
              style: {
                "a": Style(
                    color: Colors.blue, textDecoration: TextDecoration.none),
                "b": Style(fontWeight: FontWeight.normal)
              },
            ),
            Column(
              children: _getContactInfoWidgetList(),
            )
          ],
        ));
  }

  List<AboutProjectItem> _getContactInfoItemList() {
    return [
      AboutProjectItem(
          text: 'efimenko_tn@irkutskoil.ru',
          title: 'Email',
          type: AboutProjectType.URL,
          data: 'mailto:efimenko_tn@irkutskoil.ru'),
      AboutProjectItem(
          text: '+7 (914) 001 71 22',
          title: 'Телефон',
          type: AboutProjectType.URL,
          data: 'tel:+79140017122'),
      AboutProjectItem(
          text: '2028',
          title: 'Внутренний телефон',
          type: AboutProjectType.CLIPBOARD,
          data: '2028'),
    ];
  }

  List<Widget> _getContactInfoWidgetList() {
    List<AboutProjectItem> _items = _getContactInfoItemList();
    List<Widget> _widgetList = [];

    for (int i = 0; i < _items.length; i++) {
      _widgetList.add(Container(
        margin: EdgeInsets.only(bottom: 10),
        child: AboutProjectContact(
          title: _items[i].title,
          text: _items[i].text,
          type: _items[i].type,
          data: _items[i].data,
        ),
      ));
    }

    return _widgetList;
  }
}

enum AboutProjectType { CLIPBOARD, URL }

class AboutProjectItem {
  final String? title;
  final String text;
  final AboutProjectType type;
  final String data;

  AboutProjectItem(
      {required this.text, this.title, required this.type, required this.data});
}
