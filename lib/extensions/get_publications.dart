import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/learning_materials_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:openapi/openapi.dart';

extension GetPublicationsExt on Response<GetPublications> {
  Pagination<LearningMaterialsData> mapResponse(
      Pagination<LearningMaterialsData> pagination) {
    // Map? publicationListData = this.data?.data.asMap;
    //migration
    Map? publicationListData = data?.data?.asMap;

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
