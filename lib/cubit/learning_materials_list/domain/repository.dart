import 'package:ink_mobile/cubit/learning_materials_list/sources/dependency.dart';
import 'package:ink_mobile/cubit/learning_materials_list/sources/network.dart';
import 'package:ink_mobile/models/learning_materials_data.dart';
import 'package:ink_mobile/models/pagination.dart';

class LearningMaterialsRepository {
  final Pagination<LearningMaterialsData> pagination;
  LearningMaterialsRepository({required this.pagination});

  LearningMaterialListRequestDependency getDependency() {
    return LearningMaterialListNetworkRequest(pagination: pagination);
  }
}
