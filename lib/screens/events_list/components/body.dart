import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart';
import 'package:ink_mobile/cubit/events_list/events_list_state.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/screens/events_list/components/events_list_element.dart';

class Body extends StatelessWidget {
  static late EventsListCubit cubit;
  static late Size size;
  static late LanguageStrings strings;

  final ScrollController _controller = ScrollController();
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    size = MediaQuery.of(context).size;
    _controller.addListener(_onScroll);

    return RefreshIndicator(
        onRefresh: () async {
          cubit.refresh();
        },
        color: Colors.green,
        displacement: 20,
        child: BlocBuilder<EventsListCubit, EventsListState>(
            builder: (context, state) {
          cubit = BlocProvider.of<EventsListCubit>(context);

          if (state.type == EventsListStateType.LOADING) {
            cubit.fetch();
            return InkPageLoader();
          } else if (state.type == EventsListStateType.LOADED) {
            return _getLoadedStateWidget(context, state);
          } else {
            return ErrorRefreshButton(
                onTap: cubit.refresh, text: state.errorMessage!);
          }
        }));
  }

  Widget _getLoadedStateWidget(BuildContext context, EventsListState state) {
    List<EventsListElement> items = _getEventsWidgetList(state.data!);
    return Container(
        color: Color(0xfff9f9f9),
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(children: [
            Container(
                color: Colors.white,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      strings.events,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                )),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                controller: ScrollController(keepScrollOffset: false),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) => items[index],
              ),
            )
          ]),
        ));
  }

  void _onScroll() async {
    cubit.onScroll(_controller);
  }

  List<EventsListElement> _getEventsWidgetList(List<EventData> eventsList) {
    List<EventsListElement> _eventsWidgetList = [];

    eventsList.forEach((value) {
      _eventsWidgetList.add(EventsListElement(event: value));
    });

    return _eventsWidgetList;
  }
}
