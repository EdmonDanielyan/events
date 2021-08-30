import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/main_page/events_and_announcements_block_state.dart';

class EventsAndAnnouncementsBlockCubit extends Cubit<EventsAndAnnouncementsBlockState> {
  EventsAndAnnouncementsBlockCubit() : super(EventsAndAnnouncementsBlockState(EventsAndAnnouncementsBlockStateType.EVENTS));

  void setEventsState() {
    setState((EventsAndAnnouncementsBlockStateType.EVENTS));
  }

  void setAnnouncementsState() {
    setState((EventsAndAnnouncementsBlockStateType.ANNOUNCEMENTS));
  }

  void setState(EventsAndAnnouncementsBlockStateType type) {
    emit(EventsAndAnnouncementsBlockState(type));
  }
}