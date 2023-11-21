// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/models/birthday_response.dart';
import 'package:openapi/openapi.dart';

extension BirthdaysSuccessExt on Response<BirthdaysSuccess> {
  BirthDayResponse mapResponse() {
    final data = this.data?.data;

    if (data != null) {
      BirthDayResponse birthDayResponse = BirthDayResponse();
      List<BirthdayData> birthdaysToday = [];
      List<BirthdayData> birthdaysOther = [];

      data.today.forEach((birthday) {
        birthdaysToday.add(BirthdayData.fromResponse(birthday));
      });

      data.others.forEach((birthday) {
        birthdaysOther.add(BirthdayData.fromResponse(birthday));
      });

      birthDayResponse = birthDayResponse.copyWith(
          birthdaysToday: birthdaysToday, birthdaysOther: birthdaysOther);

      return birthDayResponse;
    } else {
      throw UnknownErrorException();
    }
  }
}
