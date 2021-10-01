import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/learning_materials_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/publications_api.dart';
import 'package:main_api_client/model/get_publications.dart';

import 'dependency.dart';

class LearningMaterialListNetworkRequest
    extends LearningMaterialListRequestDependency {
  Pagination<LearningMaterialsData> pagination;

  LearningMaterialListNetworkRequest({required this.pagination});

  @override
  Future<Response<GetPublications>> makeRequest() async {
    PublicationsApi learningMaterialsApi = MainApiClient().getPublicationsApi();

    return await learningMaterialsApi.publicationsGet(
        countOnPage: pagination.countOnPage, pageNumber: pagination.pageNumber);
  }
}
