import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/announcements_list/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/announcements_list/announcements_list_state.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/screens/announcements_list/components/announcements_list_element.dart';

class Body extends StatelessWidget {
  static late AnnouncementsListCubit cubit;
  static late Size size;

  final ScrollController _controller = ScrollController();

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    size = MediaQuery.of(context).size;
    _controller.addListener(_onScroll);

    return RefreshIndicator(
        onRefresh: () async {
          cubit.refresh();
        },
        color: Colors.green,
        displacement: 20,
        child: BlocBuilder<AnnouncementsListCubit, AnnouncementsListState>(
            builder: (context, state) {
          cubit = BlocProvider.of<AnnouncementsListCubit>(context);

          switch (state.type) {
            case AnnouncementsListStateType.LOADED:
              {
                List<AnnouncementsListElement> items =
                    _getAnnouncementsWidgetList(state.data!);
                return Container(
                    color: Color(0xfff9f9f9),
                    child: SingleChildScrollView(
                      controller: _controller,
                      child: Column(children: [
                        Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 24, bottom: 20),
                            child: Row(
                              children: [
                                Text(
                                  _strings.announcements,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                )
                              ],
                            )),
                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            controller:
                                ScrollController(keepScrollOffset: false),
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) =>
                                items[index],
                          ),
                        )
                      ]),
                    ));
              }

            case AnnouncementsListStateType.LOADING:
              {
                cubit.fetch();
                return InkPageLoader();
              }

            case AnnouncementsListStateType.ERROR:
              {
                return ErrorRefreshButton(
                  onTap: cubit.refresh,
                  text: state.errorMessage!,
                );
              }
          }
        }));
  }

  void _onScroll() async {
    await cubit.onScroll(_controller);
  }

  List<AnnouncementsListElement> _getAnnouncementsWidgetList(
      List<AnnouncementData> announcementsList) {
    List<AnnouncementsListElement> _announcementsWidgetList = [];

    announcementsList.forEach((value) {
      _announcementsWidgetList
          .add(AnnouncementsListElement(announcement: value));
    });

    return _announcementsWidgetList;
  }
}
