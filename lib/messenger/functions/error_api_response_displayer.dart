import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/api/rest_client/error/error_response.dart';
import 'package:ink_mobile/messenger/components/dialogs/info_dialog2.dart';
import 'package:ink_mobile/messenger/components/snackbar/custom_snackbar.dart';

class ErrorDisplayer {
  final BuildContext context;
  final bool showOnlyConnectionError;
  const ErrorDisplayer(this.context, {this.showOnlyConnectionError = false});

  void snackbarCallback(ErrorApiResponse? response) {
    HideSnackBar(context);

    String errorTxt = getErrorMessage(response);

    if (showOnlyConnectionError && response?.title != null) {
      return;
    }

    ErrorCustomSnackbar(
      context: context,
      txt: errorTxt,
    );
  }

  void alertCallback(ErrorApiResponse? response, {String? closeBtnTxt}) {
    String errorTxt = getErrorMessage(response);

    if (showOnlyConnectionError && response?.title != null) {
      return;
    }

    InfoDialog2(
      context: context,
      title: errorTxt,
      close: closeBtnTxt,
    )();
  }

  String getErrorMessage(ErrorApiResponse? response) {
    return response?.title ?? "Ошибка соединения";
  }
}
