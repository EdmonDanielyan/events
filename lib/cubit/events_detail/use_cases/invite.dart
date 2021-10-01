import 'package:ink_mobile/cubit/events_detail/sources/invite/dependency.dart';

class EventInvite {
  final EventInviteRequestDependency dependency;

  EventInvite({required this.dependency});

  Future<void> invite() async => await dependency.makeRequest();
}
