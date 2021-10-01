import 'package:ink_mobile/cubit/birthdays/sources/dependency.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/models/birthday_response.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/birthdays_success.dart';

class BirthdaysFetch {
  final BirthdaysRequestDependency dependency;

  BirthdaysFetch({required this.dependency});

  Future<BirthDayResponse> call() async {
    Response<BirthdaysSuccess> response = await dependency.makeRequest();
    return mapResponse(response);
  }

  BirthDayResponse mapResponse(Response<BirthdaysSuccess> response) {
    final data = response.data?.data;

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
