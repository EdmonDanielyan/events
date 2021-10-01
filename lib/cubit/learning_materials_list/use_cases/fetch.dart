import 'package:ink_mobile/cubit/learning_materials_list/sources/dependency.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/learning_materials_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_publications.dart';

class LearningMaterialListFetch {
  final LearningMaterialListRequestDependency dependency;
  Pagination<LearningMaterialsData> pagination;

  LearningMaterialListFetch(
      {required this.dependency, required this.pagination});

  Future<Pagination<LearningMaterialsData>> call() async {
    Response<GetPublications> response = await dependency.makeRequest();

    return mapResponse(response);
  }

  Pagination<LearningMaterialsData> mapResponse(
      Response<GetPublications> response) {
    Map? publicationListData = response.data?.data.asMap;

    if (publicationListData != null) {
      final _newList = List<LearningMaterialsData>.from(pagination.items)
        ..addAll(LearningMaterialsData.getListFromMap(
            publicationListData['publications']));

      pagination = pagination.copyWith(items: _newList);

      if (publicationListData['next'] == null) {
        pagination.next = false;
      }

      pagination.pageNumber++;

      return pagination;
    } else {
      throw UnknownErrorException();
    }
  }
}
