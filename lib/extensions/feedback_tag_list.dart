import 'package:dio/dio.dart';
import 'package:ink_mobile/models/selectfield.dart';

import 'package:openapi/openapi.dart';

extension FeedbackTagsListExt on Response<FeedbackTagsList> {
  List<Selectfield> mapResponse() {
    List<Selectfield> items = [];

    data?.data?.forEach((item) {
      items.add(
        Selectfield(id: item.id ?? '', title: item.title ?? ''),
      );
    });

    return items;
  }
}
//TODO migration
// extension FeedbackTagsListExt on Response<FeedbackTagsList> {
//   List<Selectfield> mapResponse() {
//     List<Selectfield> items = [];

//     this.data?.data.forEach((item) {
//       items.add(
//         Selectfield(id: item.id, title: item.title),
//       );
//     });

//     return items;
//   }
// }
