import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/feedback/management_answer.dart';

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
        _customListTile(_strings.topic, item.responsible),
        _customListTile(_strings.question, item.question),
        _customListTile(_strings.answer, item.answer),
        Divider(),
      ],
    );
  }

  Widget _customListTile(String title, String subtitle) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Text(subtitle),
        ],
      ),
    );
  }
}
