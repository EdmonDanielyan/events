import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/list_element_divider.dart';
import 'package:ink_mobile/cubit/main_page/events_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_list_state.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/screens/main/components/events_list_element.dart';
import 'package:ink_mobile/screens/main/components/events_list_element_placeholder.dart';

import '../main_screen.dart';

class EventsList extends StatelessWidget {
  const EventsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventsCubit = MainScreen.of(context).mainEventsListCubit;
    return BlocBuilder<MainEventsListCubit, EventsListState>(
      bloc: eventsCubit,
      builder: (context, state) {
        switch (state.type) {
          case EventsListStateType.LOADED:
            {
              List<Widget> items = getEventsWidgetList(state.data!);
              return Container(
                margin: EdgeInsets.only(top: 30),
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(keepScrollOffset: false),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) =>
                      items[index],
                ),
              );
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
              MainScreen.of(context).mainPageCubit.emitErrorState();

              return Container();
            }
        }
      },
    );
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
