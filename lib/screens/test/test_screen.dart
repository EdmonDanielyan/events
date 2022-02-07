import 'package:flutter/material.dart';
import 'package:ink_mobile/components/fields/number_select_form_field.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 100, left: 30),
          child: NumberSelectFormField(
            controller: _controller,
            buttonsColor: ButtonsColor(left: Colors.red, right: Colors.green),
            changeValueBy: 2.3,
            mode: NumberSelectFieldMode.double,
            onlyPositive: true,
            validator: (value) {
              return null;
            },
            style: TextStyle(fontSize: 30, height: 1),
            textAlignVertical: TextAlignVertical.center,
            flex: NumberSelectFieldFlex(
              buttons: 4,
              textField: 5,
            ),
            height: 50,
            width: 200,
          )),
    );
  }
}
