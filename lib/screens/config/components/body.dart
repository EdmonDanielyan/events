import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/screens/initial/cubit/initial_cubit.dart';
import 'package:ink_mobile/screens/welcome/components/background.dart';
import 'package:ink_mobile/setup.dart';

import '../../../messenger/functions/size_config.dart';
import 'text.dart';

class Body extends StatefulWidget {
  final PackageInfoProvider packageInfo;

  final String env;

  const Body({Key? key, required this.packageInfo, required this.env})
      : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String environment;

  @override
  void initState() {
    super.initState();
    environment = widget.env;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: size.height * 0.17,
              child: Center(
                child: Text(
                  "Выберите окружение",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:
                        SizeConfig(context, 21.0).getProportionateScreenHeight,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )),
          RadioListTile<String>(
              title: const ConfigText("Для разработчиков"),
              subtitle: const ConfigText(
                  "Используйте данный тип окружения для разработки"),
              value: Environment.dev,
              groupValue: environment,
              onChanged: _onChanged),
          RadioListTile<String>(
              title: const ConfigText("Тестирование"),
              subtitle: const ConfigText(
                  "Используйте данный тип окружения перед выходом в релиз и проведения тестирования"),
              value: Environment.test,
              groupValue: environment,
              onChanged: _onChanged),
          RadioListTile<String>(
              title: const ConfigText("Продакшен окружение"),
              subtitle: const ConfigText(
                  "Внимание!!! Есть риски изменения данных на серверах заказчика. Не использовать при тестировании и разработки"),
              value: Environment.prod,
              groupValue: environment,
              onChanged: _onChanged),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: size.height * 0.01),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Center(
                        child: Text(
                          widget.packageInfo.version,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: SizeConfig(context, 11.0)
                                .getProportionateScreenHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onChanged(String? value) async {
    if (value != null) {
      setState(() {
        environment = value;
      });
      //TODO понять что с этим делать, нашел при миграции
      try {
        //await getIt<Messenger>().chatDatabaseCubit.db.deleteDatabaseFiles();
      } catch (e) {}
      writeEnv(value);
      await getIt<InitialCubit>().init();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Вы сменили окружение на $value")));
    }
  }
}
