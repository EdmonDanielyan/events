import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/models/references/reference_list.dart';
import 'package:ink_mobile/screens/references/components/form/entities.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReferencesFormValidator {
  final AppLocalizations strings;
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
    if (files.isEmpty && referencesItem.fields.files) {
      return "${strings.choose} ${strings.files.toLowerCase()}";
    }
    return null;
  }

  String? validateQuantity(int quantity) {
    if (quantity < 1 && referencesItem.fields.quantity) {
      return "${strings.choose} ${strings.countInstances.toLowerCase()}";
    }
    return null;
  }

  bool validateForm(BuildContext context, ReferencesFormEntities entities) {
    final _validateFiles = validateFiles(entities.files);
    final _validateDeliveryMethod =
        validateDeliveryMethod(entities.deliveryType);
    final _validateQuantity = validateQuantity(entities.quantity);

    if (_validateFiles != null) {
      SimpleCustomSnackbar(context: context, txt: _validateFiles);
      return false;
    }

    if (_validateDeliveryMethod != null) {
      SimpleCustomSnackbar(context: context, txt: _validateDeliveryMethod);
      return false;
    }

    if (_validateQuantity != null) {
      SimpleCustomSnackbar(context: context, txt: _validateQuantity);
      return false;
    }

    return formKey.currentState!.validate();
  }
}
