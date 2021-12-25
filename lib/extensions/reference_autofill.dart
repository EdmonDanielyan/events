// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/models/autofill.dart';
import 'package:main_api_client/model/reference_auto_fill.dart';

extension ReferenceAutoFillExt on Response<ReferenceAutoFill> {
  Autofill mapResponse() {
    return Autofill(
      fio: this.data?.data.fio ?? '',
      position: this.data?.data.position ?? '',
      department: this.data?.data.department ?? '',
      email: this.data?.data.email ?? '',
    );
  }
}
