import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/announcements_list/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/announcements_list/announcements_list_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/screens/announcements_list/components/announcements_list_element.dart';

class Body extends StatefulWidget {
  final AnnouncementsListCubit cubit;

  const Body({Key? key, required this.cubit}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    AppMetrica.reportEvent('вход пользователя в раздел «Объявления»');
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        widget.cubit.refresh();
      },
      color: Colors.green,
      displacement: 20,
      child: BlocBuilder<AnnouncementsListCubit, AnnouncementsListState>(
        bloc: widget.cubit,
        builder: (context, state) {
          switch (state.type) {
            case AnnouncementsListStateType.LOADED:
              {
                List<AnnouncementsListElement> items =
                    _getAnnouncementsWidgetList(state.data!);
                return Container(
                  color: Color(0xfff9f9f9),
                  child: SingleChildScrollView(
                    controller: _controller,
                    child: Column(
                      children: [
                        Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 24, bottom: 20),
                            child: Row(
                              children: [
                                Text(
                                  localizationInstance.announcements,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig(context, 20)
                                        .getProportionateScreenHeight,
                                  ),
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
                      ],
                    ),
                  ),
                );
              }

            case AnnouncementsListStateType.LOADING:
              {
                widget.cubit.fetch();
                return InkPageLoader();
              }

            case AnnouncementsListStateType.ERROR:
              {
                return ErrorRefreshButton(
                  onTap: widget.cubit.refresh,
                  text: state.errorMessage!,
                );
              }
          }
        },
      ),
    );
  }

  Future<void> _onScroll() async {
    await widget.cubit.onScroll(_controller);
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
