import 'package:ink_mobile/cubit/events_detail/sources/fetch/dependency.dart';
import 'package:ink_mobile/cubit/events_detail/sources/fetch/network.dart';

class EventsDetailRepository {
  final int eventId;
  EventsDetailRepository({required this.eventId});

  EventsDetailRequestDependency getDependency() {
    return EventsDetailNetworkRequest(eventId: eventId);
  }
}
