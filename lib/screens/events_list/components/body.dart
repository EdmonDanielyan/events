import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart';
import 'package:ink_mobile/cubit/events_list/events_list_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/screens/events_list/components/events_list_element.dart';
import 'package:ink_mobile/screens/events_list/components/events_list_empty_state.dart';

class Body extends StatelessWidget {
  final EventsListCubit cubit;

  final ScrollController _controller = ScrollController();
  Body({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.addListener(_onScroll);

    return RefreshIndicator(
      onRefresh: () async {
        cubit.refresh();
      },
      color: Colors.green,
      displacement: 20,
      child: BlocBuilder<EventsListCubit, EventsListState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.type == EventsListStateType.LOADING) {
            cubit.fetch();
            return const InkPageLoader();
          } else if (state.type == EventsListStateType.LOADED) {
            return _getLoadedStateWidget(context, state);
          } else {
            return ErrorRefreshButton(
                onTap: cubit.refresh, text: state.errorMessage!);
          }
        },
      ),
    );
  }

  Widget _getLoadedStateWidget(BuildContext context, EventsListState state) {
    List<EventsListElement> items = [];
    if (state.data?.isNotEmpty == true) {
      items = _getEventsWidgetList(state.data!);
      return ColoredBox(
        color: Palette.white,
        child: SingleChildScrollView(
          controller: _controller,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColoredBox(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Text(
                      localizationInstance.events,
                      style: FontStyles.rubikH2(color: Palette.textBlack),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(keepScrollOffset: false),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) =>
                      items[index],
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return const EventsListEmptyState();
    }
  }

  Future<void> _onScroll() async {
    cubit.onScroll(_controller);
  }

  List<EventsListElement> _getEventsWidgetList(List<EventData> eventsList) {
    List<EventsListElement> _eventsWidgetList = [];

    for (var value in eventsList) {
      _eventsWidgetList.add(EventsListElement(event: value));
    }

    return _eventsWidgetList;
  }
}
