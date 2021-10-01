import 'package:ink_mobile/cubit/events_list/sources/dependency.dart';
import 'package:ink_mobile/cubit/events_list/sources/network.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/pagination.dart';

class EventListRepository {
  final Pagination<EventData> pagination;
  EventListRepository({required this.pagination});

  EventListRequestDependency getDependency() {
    return EventsListNetworkRequest(pagination: pagination);
  }
}
