import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validator;
  final void Function(DateTime)? onChanged;
  const DateInputField(
      {Key? key,
      required this.controller,
      required this.title,
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
            decoration: InputDecoration(
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
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
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
