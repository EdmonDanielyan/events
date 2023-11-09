import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/feedback/management_answer.dart';

import '../../../../messenger/functions/size_config.dart';

class AnswerWidget extends StatelessWidget {
  final int index;
  final ManagementAnswer item;
  const AnswerWidget({Key? key, required this.index, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _customListTile(context, _strings.topic, item.responsible),
        _customListTile(context, _strings.question, item.question),
        _customListTile(context, _strings.answer, item.answer),
        const Divider(),
      ],
    );
  }

  Widget _customListTile(BuildContext context, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig(context, 13.0).getProportionateScreenHeight,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: SizeConfig(context, 12.0).getProportionateScreenHeight,
            ),
          ),
        ],
      ),
    );
  }
}
