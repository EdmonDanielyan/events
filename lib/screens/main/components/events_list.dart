import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/list_element_divider.dart';
import 'package:ink_mobile/cubit/main_page/events_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_list_state.dart';
import 'package:ink_mobile/cubit/main_page/main_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/screens/main/components/events_list_element.dart';
import 'package:ink_mobile/screens/main/components/events_list_element_placeholder.dart';

class EventsList extends StatelessWidget {
  const EventsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return BlocProvider<EventsListCubit>(
        create: (BuildContext context) =>
            EventsListCubit(languageStrings: _strings),
        child: BlocBuilder<EventsListCubit, EventsListState>(
            builder: (context, state) {
          final EventsListCubit eventsCubit =
              BlocProvider.of<EventsListCubit>(context);

          switch (state.type) {
            case EventsListStateType.LOADED:
              {
                return Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(children: getEventsWidgetList(state.data!)));
              }

            case EventsListStateType.LOADING:
              {
                eventsCubit.fetchEvents();
                return Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(children: [
                      EventsListElementPlaceholder(),
                      ListElementDivider(),
                      EventsListElementPlaceholder(),
                      ListElementDivider(),
                      EventsListElementPlaceholder(),
                      ListElementDivider(),
                      EventsListElementPlaceholder(),
                      ListElementDivider(),
                      EventsListElementPlaceholder()
                    ]));
              }

            case EventsListStateType.ERROR:
              {
                final MainPageCubit mainPageCubit =
                    BlocProvider.of<MainPageCubit>(context);
                mainPageCubit.emitErrorState();

                return Container();
              }
          }
        }));
  }

  List<Widget> getEventsWidgetList(List<EventData> events) {
    List<Widget> eventsWidgetList = [];

    events.forEach((element) {
      eventsWidgetList
          .addAll([EventsListElement(event: element), ListElementDivider()]);
    });

    eventsWidgetList.removeLast();

    return eventsWidgetList;
  }
}
