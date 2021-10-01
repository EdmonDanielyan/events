import 'package:dio/dio.dart';
import 'package:ink_mobile/models/learning_materials_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:main_api_client/model/get_publications.dart';

abstract class LearningMaterialListRequestDependency {
  abstract Pagination<LearningMaterialsData> pagination;
  Future<Response<GetPublications>> makeRequest();
}
