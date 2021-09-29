import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/references/reference_list.dart';
import 'package:ink_mobile/screens/references/components/form/entities.dart';

class ReferencesFormValidator {
  final LanguageStrings strings;
  final ReferencesItem referencesItem;
  final GlobalKey<FormState> formKey;
  ReferencesFormValidator(
      {required this.strings,
      required this.formKey,
      required this.referencesItem});

  String? validateDeliveryMethod(int? deliveryType) {
    if (deliveryType == null) {
      return "${strings.choose} ${strings.deliveryMethod.toLowerCase()}";
    }
    return null;
  }

  String? validateFiles(List<File> files) {
    if (files.length < 1 && referencesItem.fields.files) {
      return "${strings.choose} ${strings.files.toLowerCase()}";
    }
    return null;
  }

  bool validateForm(BuildContext context, ReferencesFormEntities entities) {
    final _validateFiles = validateFiles(entities.files);
    final _validateDeliveryMethod =
        validateDeliveryMethod(entities.deliveryType);

    if (_validateFiles != null) {
      SimpleCustomSnackbar(context: context, txt: _validateFiles);
      return false;
    }

    if (_validateDeliveryMethod != null) {
      SimpleCustomSnackbar(context: context, txt: _validateDeliveryMethod);
      return false;
    }

    return formKey.currentState!.validate();
  }
}
