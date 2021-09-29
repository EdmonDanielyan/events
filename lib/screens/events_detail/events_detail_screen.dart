import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/events_detail/events_detail_cubit.dart';
import 'package:ink_mobile/cubit/events_detail/events_detail_state.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:intl/intl.dart';

class EventDetailScreen extends StatelessWidget {
  static const String DEFAULT_PREVIEW_PICTURE_LINK =
      'https://sobitie.com.ua/sites/default/files/sobitie_logo.png';

  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return BlocProvider<EventDetailCubit>(
        create: (BuildContext context) =>
            EventDetailCubit(languageStrings: _strings),
        child: Scaffold(
          body: BlocBuilder<EventDetailCubit, EventsDetailState>(
              builder: (context, state) {
            final EventDetailCubit eventDetailCubit =
                BlocProvider.of<EventDetailCubit>(context);
            Map arg = ModalRoute.of(context)!.settings.arguments as Map;
            int eventId = 0;

            if (arg.isNotEmpty) {
              eventId = arg['id'];
            }

            switch (state.type) {
              case EventsDetailStateType.LOADING:
                {
                  eventDetailCubit.load(eventId);

                  return InkPageLoader();
                }

              case EventsDetailStateType.LOADED:
                {
                  return _getLoadedStateWidget(context, state);
                }

              case EventsDetailStateType.ERROR:
                {
                  return ErrorRefreshButton(
                      onTap: eventDetailCubit.refresh,
                      text: state.errorMessage!);
                }
            }
          }),
        ));
  }

  Widget _getLoadedStateWidget(BuildContext context, EventsDetailState state) {
    EventData event = state.data!;
    Size size = MediaQuery.of(context).size;
    final EventDetailCubit eventDetailCubit =
        BlocProvider.of<EventDetailCubit>(context);

    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return SingleChildScrollView(
        child: Container(
            color: Color(0xFFFFFFFF),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                        width: size.width,
                        height: 300,
                        child: Image.network(
                            event.pictureLink ?? DEFAULT_PREVIEW_PICTURE_LINK,
                            fit: BoxFit.fitWidth,
                            errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            DEFAULT_PREVIEW_PICTURE_LINK,
                            fit: BoxFit.fitWidth,
                          );
                        })),
                    Positioned.fill(
                        child: Align(
                            alignment: AlignmentDirectional(-1.1, -0.7),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                IconLinks.CLOSE_BUTTON_SVG_LINK,
                                width: 40,
                                height: 40,
                              ),
                            ))),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          IconLinks.VIEW_COUNT_SVG_LINK,
                          semanticsLabel: 'View Count',
                        ),
                        margin: EdgeInsets.only(right: 6.0),
                      ),
                      Container(
                          child: Text(
                              event.viewCount != null
                                  ? state.data!.viewCount.toString()
                                  : '0',
                              style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                          margin: EdgeInsets.only(right: 16.0)),
                      Text(
                          event.dateCreate != null
                              ? DateFormat('dd.MM.yyyy')
                                  .format(event.dateCreate!)
                              : '',
                          style: TextStyle(
                            fontFamily: "Helvetica",
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w200,
                          )),
                    ],
                  ),
                  margin: EdgeInsets.only(left: 20.0, top: 17.0, bottom: 10.0),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20, right: 50, bottom: 10),
                    child: Text(
                      event.title ?? '',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                Divider(
                  color: Color(0xFFE5E5E5),
                  thickness: 2,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Html(
                    data: event.detailText ?? '',
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 30, top: 20),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: event.isMember!
                        ? Text(_strings.nowParticipatingInTheEvent)
                        : Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFFE5E5E5), width: 2),
                                borderRadius: BorderRadius.circular(50)),
                            child: TextButton(
                                onPressed: () {
                                  eventDetailCubit.invite(event.id!);
                                },
                                child: Text(
                                  _strings.iWillParticipate,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xFFFFFFFF)),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            Size(335, 50)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ))))))
              ],
            )));
  }
}
