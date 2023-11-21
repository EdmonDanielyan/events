// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/models/learning_materials_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:openapi/openapi.dart';

abstract class LearningMaterialListRequestDependency {
  abstract Pagination<LearningMaterialsData>? pagination;
  Future<Response<GetPublications>> call();
}
