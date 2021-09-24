import 'package:ink_mobile/cubit/events_detail/sources/invite/dependency.dart';
import 'package:ink_mobile/cubit/events_detail/sources/invite/network.dart';

class EventsInviteRepository {
  final int eventId;
  EventsInviteRepository({required this.eventId});

  EventInviteRequestDependency getDependency() {
    return EventInviteNetworkRequest(eventId: eventId);
  }
}
