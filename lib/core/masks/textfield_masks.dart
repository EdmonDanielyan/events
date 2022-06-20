import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldMasks {
  MaskTextInputFormatter phone({String? initialText}) => MaskTextInputFormatter(
        mask: '+# (###) ###-##-##',
        filter: {
          "#": RegExp(r'[0-9]'),
        },
        initialText: initialText,
      );

  MaskTextInputFormatter date = new MaskTextInputFormatter(
      mask: '##.##.####', filter: {"#": RegExp(r'[0-9]')});
}
