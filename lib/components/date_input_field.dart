import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validator;
  final void Function(DateTime)? onChanged;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? descriptionText;
  final String? hintText;
  const DateInputField({
    Key? key,
    required this.controller,
    required this.title,
    this.firstDate,
    this.lastDate,
    this.onChanged,
    this.validator,
    this.descriptionText,
    this.hintText,
  }) : super(key: key);

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.descriptionText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                widget.descriptionText!,
                style: FontStyles.rubikP1Medium(color: Palette.textBlack),
              ),
            ),
          AbsorbPointer(
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.datetime,
              textCapitalization: TextCapitalization.sentences,
              style: FontStyles.rubikP2(color: Palette.textBlack),
              decoration: InputDecoration(
                hintText: widget.hintText ?? "Выберите дату",
                hintStyle: TextStyle(
                    fontSize:
                        SizeConfig(context, 14).getProportionateScreenHeight),
                errorStyle: TextStyle(
                    fontSize:
                        SizeConfig(context, 14).getProportionateScreenHeight),
                labelStyle: TextStyle(
                    fontSize:
                        SizeConfig(context, 14).getProportionateScreenHeight),
                helperStyle: TextStyle(
                    fontSize:
                        SizeConfig(context, 14).getProportionateScreenHeight),
                //labelText: widget.title,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Palette.text20Grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Palette.text20Grey),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, bottom: 12.0, right: 16.0),
                  child: SvgPicture.asset(
                    IconLinks.CALENDAR_ICON_LINK,
                    height: 20.0,
                    width: 20.0,
                    colorFilter:
                        ColorFilter.mode(Palette.textBlack, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        locale: const Locale('ru', 'RU'),
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
