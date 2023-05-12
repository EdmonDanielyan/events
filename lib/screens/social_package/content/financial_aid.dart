import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/social_package/content/error_widget.dart';
import 'package:ink_mobile/screens/social_package/content/social_package_widget.dart';

class FinancialAid extends StatefulWidget {
  const FinancialAid({Key? key}) : super(key: key);

  @override
  State<FinancialAid> createState() => _FinancialAidState();
}

class _FinancialAidState extends State<FinancialAid> {

  @override
  Widget build(BuildContext context) {
    return SocialPackageWidget(
      errorWidget: SocialPackageErrorWidget(
        data: defaultText,
      ),
    );
  }

  String get defaultText => '''
                <div>
         <b>Материальная помощь </b>- разовая выплата, предоставляемая сотруднику по решению руководства Компании. Размер материальной помощи определен Положением о гарантиях и компенсациях сотрудникам ООО «ИНК» и составляет <b>25 000 (Двадцать пять тысяч) рублей</b>.
        </div>
        <h3><span style="color: #00736a;">Формы заявлений на предоставление материальной помощи (в формате .doc):</span> </h3>
        <p>
         <i><u><span style="color: #0070c0;"><a href="https://portal.irkutskoil.ru/upload/medialibrary/8c5/5pynd2qqafn7v7xmyfggwhc8726ciilh/s-rozhdeniem-rebenka.doc">в связи с рождением ребенка</a><a title="Рождение ребенка.doc" href="https://portal.irkutskoil.ru/upload/medialibrary/380/380b53e9e119823d8b3231f34bff8075.doc"></a></span></u></i>
        </p>
        <p>
         <i><u><span style="color: #0070c0;"><a href="https://portal.irkutskoil.ru/upload/medialibrary/8d6/yi0v6ebk7byrhc8g6921ga3n2zwzk7qc/s-registratsiey-braka.doc">в связи с регистрацией брака</a></span></u></i>
        </p>
        <p>
         <i><u><span style="color: #0070c0;"><a title="со смертью родственника.doc" href="https://portal.irkutskoil.ru/upload/medialibrary/69a/mah5r661ns21p6yuso3660juuq9fldca/so-smertyu-rodstvennika.doc">в связи со смертью близкого родственника</a></span></u></i>
        </p>
        <p>
         <i><u><a title="с поступлением в 1 класс.doc" href="https://portal.irkutskoil.ru/upload/medialibrary/7f6/v7tp676qcbtuemutor05ttp2hs7iszul/s-postupleniem-v-1-klass.doc">в связи с поступлением ребенка в 1 класс</a></u></i>
        </p>
        <p>
         <i><u><a title="Жизнеугрожающая болезнь или ЧС.docx" href="https://portal.irkutskoil.ru/upload/medialibrary/27c/a91qob40vos49r6odmdx8m98756zjdwx/ZHizneugrozhayushchaya-bolezn-ili-CHS.docx">в связи&nbsp;с жизнеугрожающей болезнью&nbsp;работника или его близких родственников</a></u></i>
        </p>
        <p>
         <i><u><a title="Жизнеугрожающая болезнь или ЧС.docx" href="https://portal.irkutskoil.ru/upload/medialibrary/366/di2846g2fm9hcuuu06o00u4x8ctbc8bu/ZHizneugrozhayushchaya-bolezn-ili-CHS.docx">в связи&nbsp;со стихийными бедствиями и другими чрезвычайными обстоятельствами</a></u><br>
         </i>
        </p>
        <p>
         <i><br>
         </i>
        </p>
        <p>
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
        	 Для получения материальной помощи в связи <b>с жизнеугрожающей болезнью</b> работника или его близких родственников необходимо подать следующие документы:<br>
        </p>
        <p>
        	 - заявление;
        </p>
        <p>
        	 -&nbsp;заключение врача, платёжные документы, иные подтверждающие документы;
        </p>
        <p>
        	 - копии документов, подтверждающих родство.
        </p>
        <p>
        	 Для получения материальной помощи в связи <b>со стихийными бедствиями и другими чрезвычайными обстоятельствами</b>, произошедшими с участием работника или его имущества (пожар, наводнение и т.п.) необходимо подать следующие документы:<br>
        </p>
        <p>
        	 - заявление;<br>
        </p>
        <p>
        	 - справка от МЧС, иные документы, подтверждающие ущерб.<br>
        </p>
         <b>К кому обратиться:&nbsp;</b>
        <p>
        	 &nbsp;Ведущий специалист отдела социальных программ – Марина Константинова, тел. 9060, <a href="mailto:konstantinova_me@irkutskoil.ru">konstantinova_me@irkutskoil.ru</a>
        </p>
              ''';
}
