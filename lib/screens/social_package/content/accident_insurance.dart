import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:html/dom.dart' as dom;
import 'package:ink_mobile/components/html.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/get_page/get_page_cubit.dart';
import 'package:ink_mobile/cubit/get_page/get_page_state.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class AccidentInsurance extends StatefulWidget {
  const AccidentInsurance({Key? key}) : super(key: key);

  @override
  State<AccidentInsurance> createState() => _AccidentInsuranceState();
}

class _AccidentInsuranceState extends State<AccidentInsurance> {

  final getPageCubit = GetPageCubit();
  String code = "";

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      appBar: InkAppBarWithText(context, title: _strings.accidentInsurance),
      body: SingleChildScrollView(
        child: BlocBuilder<GetPageCubit, GetPageCubitState>(
          bloc: getPageCubit,
          builder: (context, state) {
            final args = ModalRoute.of(context)!.settings.arguments as Map?;
            if (args != null && args.isNotEmpty) {
              code = args["code"];
            }
            switch (state.type) {
              case GetPageCubitStateEnums.LOADING:
                getPageCubit.fetch(code);
                return Center(
                  child: InkPageLoader(),
                );
              case GetPageCubitStateEnums.SUCCESS:
                return CustomHtml(data: state.data?.detail,);
              case GetPageCubitStateEnums.ERROR:
                return _oldTextWidget();
            }
          }
        ),
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }

  Container _oldTextWidget() {
    return Container(
      child: Html(
          style: {
            "h2": Style(
              fontSize: FontSize(
                  SizeConfig(context, 14.0).getProportionateScreenHeight),
            ),
            "p": Style(
              fontSize: FontSize(
                  SizeConfig(context, 14.0).getProportionateScreenHeight),
            )
          },
          onLinkTap: (String? url, RenderContext context,
              Map<String, String> attributes, dom.Element? element) {
            launchUrl(url!);
          },
          data: '''
              <h2> <b><span style="color: #005951;">Страхование от несчастных случаев</span></b> </h2>
              <p>
                Все сотрудники компании застрахованы от несчастных случаев в АО «Группа Ренессанс Страхование».<br>
              </p>
              <p>
                Договор страхования действуют с 01 мая 2021г. по 31 декабря 2022г.<br>
              </p>
              <p>
                Страховая сумма на 1 застрахованное лицо – 600 000 руб.
              </p>
              <p>
                Территория страхования – весь мир.
              </p>
              <p>
                Период страхового покрытия – 24 часа в сутки (круглосуточно).
              </p>
              <p>
                По условиям договора, каждый работник, может назначить Выгодоприобретателя по договору страхования по страховому риску «Смерть в результате несчастного случая», для этого необходимо заполнить заявление о назначении выгодоприобретателя, и направить скан-копию и оригинал менеджеру в ПАО «Группа Ренессанс Страхование». В случае отсутствия заполненного заявления выгодоприобретателями признаются наследники по закону.
              </p>
              <p>
                Документы:
              </p>
              <p>
              <a href="https://portal.irkutskoil.ru/upload/medialibrary/afe/lkp6025b3cly2kfo0k0jl3d76y75tv9t/Dogovor.pdf" title="Договор.pdf">Договор</a><br>
              <a title="Памятка к договору страхования от несчастных случае1.docx" href="https://portal.irkutskoil.ru/upload/medialibrary/8eb/r1qnkwscw2zym5sherm0t1zrr8bkli32/Pamyatka-k-dogovoru-strakhovaniya-ot-neschastnykh-sluchae1.docx">Памятка к договору страхования от несчастных случаев</a>
              </p>
              <p>
              <a href="https://portal.irkutskoil.ru/upload/medialibrary/3bf/0868nsmquk8ldyp063363yr0icvgydrs/Prilozhenie-1-Pravila-strakhovaya-ot-neschastnykh-sluchaev.doc" title="Приложение 1 Правила страховая от несчастных случаев.doc">Приложение 1 Правила страховая от несчастных случаев</a>
              </p>
              <p>
              <a href="https://portal.irkutskoil.ru/upload/medialibrary/636/cleg7873arn3uk0uv5gh54q3wswbfasx/Prilozhenie-3-Soglasie-na-obrabotku-personalnykh-dannykh.docx" title="Приложение 3 Согласие на обработку персональных данных.docx">Приложение 3 Согласие на обработку персональных данных</a>
              </p>
              <p>
              <a href="https://portal.irkutskoil.ru/upload/medialibrary/b7a/5txg059l6twbulci8hxzyy9uvgt9kn63/Prilozhenie-4-Zayavlenie-na-strakhovuyu-vyplatu.doc" title="Приложение 4 Заявление на страховую выплату.doc">Приложение 4 Заявление на страховую выплату</a>
              </p>
              <p>
              </p>
              <p>
              <a href="https://portal.irkutskoil.ru/upload/medialibrary/312/q44l516kmdkgwjz2yxhef9hvp9yoh777/Prilozhenie-6-Tablitsa-vyplat.xlsx" title="Приложение 6 Таблица выплат.xlsx">Приложение 6 Таблица выплат</a>
              </p>
              <a title="Форма заявления на страховую выплату.doc" href="https://portal.irkutskoil.ru/upload/medialibrary/2cd/2cdf468ce2e738964dd227df2c54aa67.doc">
    
            '''),
    );
  }
}
