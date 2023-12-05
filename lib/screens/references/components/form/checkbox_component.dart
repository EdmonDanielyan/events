import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

class CheckBoxComponent extends StatelessWidget {
  final bool? isChecked;
  final String text;
  final Function(bool?) onChanged;
  const CheckBoxComponent(
      {super.key,
      required this.text,
      required this.isChecked,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: isChecked,
              onChanged: onChanged),
          Expanded(
              child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '*',
                  style: FontStyles.rubikP1Medium(color: Colors.red),
                ),
                TextSpan(
                  text: text,
                  style: FontStyles.rubikP2(color: Palette.textBlack),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class ConfirmCheckboxesPostMail extends StatefulWidget {
  final ValueChanged<bool> onChange;

  const ConfirmCheckboxesPostMail({super.key, required this.onChange});

  @override
  State<ConfirmCheckboxesPostMail> createState() =>
      _ConfirmCheckboxesPostMailState();
}

class _ConfirmCheckboxesPostMailState extends State<ConfirmCheckboxesPostMail> {
  bool? isCheckedOne = false;
  bool? isCheckedTwo = false;
  bool? isCheckedThree = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CheckBoxComponent(
          isChecked: isCheckedOne,
          text:
              'Я согласен на удержание из заработной платы стоимости отправки письма в случае его неполучения мной на почте России',
          onChanged: (bool? value) {
            setState(() {
              isCheckedOne = value;
              if (isCheckedOne == true &&
                  isCheckedTwo == true &&
                  isCheckedThree == true) {
                widget.onChange(true);
              } else {
                widget.onChange(false);
              }
            });
          },
        ),
        CheckBoxComponent(
          isChecked: isCheckedTwo,
          text:
              'Я подтверждаю, что предоставляемая мной в заявке информация является достоверной, а размещенные персональные данные принадлежат мне.',
          onChanged: (bool? value) {
            setState(() {
              isCheckedTwo = value;
              if (isCheckedOne == true &&
                  isCheckedTwo == true &&
                  isCheckedThree == true) {
                widget.onChange(true);
              } else {
                widget.onChange(false);
              }
            });
          },
        ),
        CheckBoxComponent(
          isChecked: isCheckedThree,
          text:
              'Я понимаю, что в случае предоставления заведомо ложных или (и) недостоверных сведений с целью получения справки по заработной плате я буду нести ответственность в соответствии с законодательством РФ.',
          onChanged: (bool? value) {
            setState(() {
              isCheckedThree = value;
              if (isCheckedOne == true &&
                  isCheckedTwo == true &&
                  isCheckedThree == true) {
                widget.onChange(true);
              } else {
                widget.onChange(false);
              }
            });
          },
        ),
        Text(
          'Уважаемые коллеги, обращаем ваше внимание, что срок хранения писем на Почте России составляет не более 1 месяца. При заказе документов просьба учитывать Ваш график работы, период нахождения на вахте и возможность личного получения отправляемой документации на Почте России в указанный срок.',
          style: FontStyles.rubikP2(color: Colors.red),
        )
      ],
    );
  }
}

class ConfirmCheckboxesEmail extends StatefulWidget {
  final ValueChanged<bool> onChange;

  const ConfirmCheckboxesEmail({super.key, required this.onChange});

  @override
  State<ConfirmCheckboxesEmail> createState() => _ConfirmCheckboxesEmailState();
}

class _ConfirmCheckboxesEmailState extends State<ConfirmCheckboxesEmail> {
  bool? isCheckedOne = false;
  bool? isCheckedTwo = false;
  bool? isCheckedThree = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CheckBoxComponent(
          isChecked: isCheckedOne,
          text:
              'Я подтверждаю, что предоставляемый мной электронный адрес почты в заявке является достоверным, принадлежит мне и только я имею доступ к электронному ящику.',
          onChanged: (bool? value) {
            setState(() {
              isCheckedOne = value;
              if (isCheckedOne == true &&
                  isCheckedTwo == true &&
                  isCheckedThree == true) {
                widget.onChange(true);
              } else {
                widget.onChange(false);
              }
            });
          },
        ),
        CheckBoxComponent(
          isChecked: isCheckedTwo,
          text:
              'Я подтверждаю, что ООО «ИНК» не может нести какой-либо предусмотренной законом ответственности за разглашение моих персональных данных в результате доступа, в том числе несанкционированного, третьих лиц к указанному адресу электронной почты.',
          onChanged: (bool? value) {
            setState(() {
              isCheckedTwo = value;
              if (isCheckedOne == true &&
                  isCheckedTwo == true &&
                  isCheckedThree == true) {
                widget.onChange(true);
              } else {
                widget.onChange(false);
              }
            });
          },
        ),
        CheckBoxComponent(
          isChecked: isCheckedThree,
          text:
              'Я понимаю, что в случае предоставления заведомо ложных или (и) недостоверных сведений, передачи полученной информации (справок по заработной плате) посредством электронного пути сообщения третьим лицам, я буду нести ответственность в соответствии с законодательством РФ.',
          onChanged: (bool? value) {
            setState(() {
              isCheckedThree = value;
              if (isCheckedOne == true &&
                  isCheckedTwo == true &&
                  isCheckedThree == true) {
                widget.onChange(true);
              } else {
                widget.onChange(false);
              }
            });
          },
        )
      ],
    );
  }
}
