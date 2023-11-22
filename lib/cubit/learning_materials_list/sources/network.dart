// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/models/learning_materials_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class LearningMaterialListNetworkRequest
    extends LearningMaterialListRequestDependency {
  @override
  Pagination<LearningMaterialsData>? pagination;

  LearningMaterialListNetworkRequest({@factoryParam required this.pagination})
      : assert(pagination != null);

  @override
  Future<Response<GetPublications>> call() async {
    PublicationsApi learningMaterialsApi =
        getIt<MainApiProvider>().getPublicationsApi();

    return await learningMaterialsApi.publicationsGet(
        countOnPage: pagination!.countOnPage,
        pageNumber: pagination!.pageNumber);
  }
}
