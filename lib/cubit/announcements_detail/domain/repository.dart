import 'package:ink_mobile/cubit/announcements_detail/sources/dependency.dart';
import 'package:ink_mobile/cubit/announcements_detail/sources/network.dart';

class AnnouncementsDetailRepository {
  final int id;
  AnnouncementsDetailRepository({required this.id});

  AnnouncementsDetailRequestDependency getDependency() {
    return AnnouncementsDetailNetworkRequest(announcementId: id);
  }
}
