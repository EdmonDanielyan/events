import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/social_package/content/error_widget.dart';
import 'package:ink_mobile/screens/social_package/content/social_package_widget.dart';

class ChristmasGifts extends StatefulWidget {
  const ChristmasGifts({Key? key}) : super(key: key);

  @override
  State<ChristmasGifts> createState() => _ChristmasGiftsState();
}

class _ChristmasGiftsState extends State<ChristmasGifts> {

  @override
  Widget build(BuildContext context) {
    return SocialPackageWidget(
      errorWidget: SocialPackageErrorWidget(
        data: defaultText,
      ),
    );
  }

  String get defaultText => '''
                 <p>
        	 Ежегодно за счет средств Общества детям сотрудников в возрасте в возрасте не старше 15 лет на дату окончания года приобретаются подарки к Новому году.
        </p>
        <p>
        	 Выдача подарков для сотрудников, работающих вахтовым методом, осуществляется техником цеха/менеджером, отвечающим за координацию процессов в подразделении, для сотрудников офиса г. Иркутск - отделом&nbsp;социальных программ.&nbsp;<br>
        </p>
        <p>
        	 Компания не гарантирует выдачу детского новогоднего подарка работникам, принятым на работу позднее первого декабря текущего года.<br>
                ''';
}
