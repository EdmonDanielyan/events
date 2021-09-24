import 'package:ink_mobile/cubit/announcements_list/sources/dependency.dart';
import 'package:ink_mobile/cubit/announcements_list/sources/network.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/pagination.dart';

class AnnouncementListRepository {
  final Pagination<AnnouncementData> pagination;
  AnnouncementListRepository({required this.pagination});

  AnnouncementsListRequestDependency getDependency() {
    return AnnouncementsListNetworkRequest(pagination: pagination);
  }
}
