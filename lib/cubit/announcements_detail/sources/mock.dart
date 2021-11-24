import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/announcements_detail/sources/dependency.dart';
import 'package:mockito/mockito.dart';

class MockAnnouncementsDetailNetworkRequest extends Mock
    implements AnnouncementsDetailRequestDependency {
  int? announcementId;
  MockAnnouncementsDetailNetworkRequest(
      {@factoryParam required this.announcementId})
      : assert(announcementId != null);
}
