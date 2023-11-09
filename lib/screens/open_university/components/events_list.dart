import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart';
import 'package:ink_mobile/cubit/events_list/events_list_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/screens/events_list/components/events_list_element.dart';

class OpenUniversityEventsList extends StatelessWidget {
  final EventsListCubit cubit;

  final ScrollController controller;

  OpenUniversityEventsList({
    Key? key,
    required this.controller,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    final size = MediaQuery.of(context).size;

    controller.addListener(() {
      cubit.onScroll(controller);
    });

    return BlocBuilder<EventsListCubit, EventsListState>(
      bloc: cubit,
      builder: (context, state) {
        switch (state.type) {
          case EventsListStateType.LOADING:
            {
              cubit.fetch();
              return Container();
            }

          case EventsListStateType.LOADED:
            {
              List<EventsListElement> items = _getEventsWidgetList(state.data!);
              return Container(
                color: Color(0xfff9f9f9),
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 24, bottom: 20),
                      child: Row(
                        children: [
                          Text(
                            _strings.events,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          )
                        ],
                      )),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(keepScrollOffset: false),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) =>
                          items[index],
                    ),
                  )
                ]),
              );
            }

          case EventsListStateType.ERROR:
            {
              return Container(
                height: size.height * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: ErrorRefreshButton(
                          onTap: cubit.refresh,
                          text: state.errorMessage!,
                        )),
                  ],
                ),
              );
            }
        }
      },
    );
  }

  List<EventsListElement> _getEventsWidgetList(List<EventData> eventsList) {
    List<EventsListElement> _eventsWidgetList = [];

    eventsList.forEach((value) {
      _eventsWidgetList.add(EventsListElement(event: value));
    });

    return _eventsWidgetList;
  }
}
