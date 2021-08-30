import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart';
import 'package:ink_mobile/cubit/events_list/events_list_state.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/screens/events_list/components/events_list_element.dart';

class OpenUniversityEventsList extends StatelessWidget {
  static late EventsListCubit cubit;
  static late Size size;

  late ScrollController controller;

  OpenUniversityEventsList({
    Key? key,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    controller.addListener(_onScroll);

    return BlocBuilder<EventsListCubit, EventsListState>(
        builder: (context, state) {
          cubit = BlocProvider.of<EventsListCubit>(context);

          switch (state.type) {
            case EventsListStateType.LOADING: {
              cubit.fetch();
              return Container();
            }

            case EventsListStateType.LOADED: {return Container(
              color: Color(0xfff9f9f9),
              child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 24,
                            bottom: 20
                        ),
                        child: Row(
                          children: [
                            Text(
                              'События',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24
                              ),
                            )
                          ],
                        )
                    ),
                    Container(
                        child: Column(
                            children: _getEventsWidgetList(state.data!)
                        )
                    )
                  ]
              ),
            );
            }

            case EventsListStateType.ERROR: {
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
                          )
                      ),
                    ]
                )
              );
            }
          }
        }
    );
  }

  void _onScroll() async {
    cubit.onScroll(controller);
  }

  List<EventsListElement> _getEventsWidgetList(List<EventData> eventsList) {
    List<EventsListElement> _eventsWidgetList = [];

    eventsList.forEach((value) {
      _eventsWidgetList.add(
          EventsListElement(event: value)
      );
    });

    return _eventsWidgetList;
  }
}
