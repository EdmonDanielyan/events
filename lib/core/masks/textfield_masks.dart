import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldMasks {
  MaskTextInputFormatter phone = new MaskTextInputFormatter(
      mask: '+# (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

  MaskTextInputFormatter date = new MaskTextInputFormatter(
      mask: '##.##.####', filter: {"#": RegExp(r'[0-9]')});
}
