import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/references/sources/get_autofill_data/network.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/autofill.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/extensions/reference_autofill.dart';
import 'package:dio/dio.dart';

import '../../setup.dart';

class GetAutofill {
  Autofill autofill = const Autofill();

  Future<void> load() async {
    try {
      await Token.setNewTokensIfExpired();
      final response = await getIt<GetAutofillNetworkRequest>()();
      autofill = response.mapResponse();
    } on DioException catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();
      throw error.exception;
    } on Exception catch (_) {
      throw FormatException(localizationInstance.unknownError);
    }
  }
}
