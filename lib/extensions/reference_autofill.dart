import 'package:dio/dio.dart';
import 'package:ink_mobile/models/autofill.dart';
import 'package:openapi/openapi.dart';

extension ReferenceAutoFillExt on Response<ReferenceAutoFill> {
  Autofill mapResponse() {
    return Autofill(
      fio: data?.data?.fio ?? '',
      position: data?.data?.position ?? '',
      department: data?.data?.department ?? '',
      email: data?.data?.email ?? '',
      birthday: data?.data?.birthday ?? "",
      phone: data?.data?.personalPhone ?? "",
    );
  }
}
