import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validator;
  final void Function(DateTime)? onChanged;
  final DateTime? firstDate ;
  final DateTime? lastDate ;
  const DateInputField(
      {Key? key,
      required this.controller,
      required this.title,
      this.firstDate,
      this.lastDate,
      this.onChanged,
      this.validator})
      : super(key: key);

  @override
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _selectDate(context),
        child: AbsorbPointer(
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.datetime,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: SizeConfig(context, 14).getProportionateScreenHeight),
              errorStyle: TextStyle(fontSize: SizeConfig(context, 14).getProportionateScreenHeight),
              labelStyle: TextStyle(fontSize: SizeConfig(context, 14).getProportionateScreenHeight),
              helperStyle: TextStyle(fontSize: SizeConfig(context, 14).getProportionateScreenHeight),
              
              labelText: widget.title,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ));
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        locale: Locale('ru', 'RU'),
        initialDate: _selectedDate,
        firstDate: widget.firstDate ?? DateTime(1946),
        lastDate: widget.lastDate ?? DateTime(2100));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.value =
            TextEditingValue(text: DateFormat('dd.MM.yyyy').format(picked));
      });

      if (widget.onChanged != null) {
        widget.onChanged!(picked);
      }
    }
  }
}
