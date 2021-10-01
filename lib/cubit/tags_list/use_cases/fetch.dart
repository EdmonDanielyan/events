import 'package:dio/dio.dart';
import 'package:ink_mobile/cubit/tags_list/sources/dependency.dart';
import 'package:ink_mobile/models/selectfield.dart';
import 'package:main_api_client/model/feedback_tags_list.dart';

class TagsListFetch {
  final TagsListRequestDependency dependency;
  TagsListFetch({required this.dependency});

  Future<List<Selectfield>> call() async {
    Response<FeedbackTagsList> response = await dependency.makeRequest();
    return mapResponse(response);
  }

  List<Selectfield> mapResponse(Response<FeedbackTagsList> response) {
    List<Selectfield> items = [];

    response.data?.data.forEach((item) {
      items.add(
        Selectfield(id: item.id, title: item.title),
      );
    });

    return items;
  }
}
