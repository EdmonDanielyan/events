import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldMasks {
  static MaskTextInputFormatter phone = new MaskTextInputFormatter(
      mask: '+# (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

  static MaskTextInputFormatter date = new MaskTextInputFormatter(
      mask: '##.##.####', filter: {"#": RegExp(r'[0-9]')});
}
