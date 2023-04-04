import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/html.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/events_detail/events_detail_cubit.dart';
import 'package:ink_mobile/cubit/events_detail/events_detail_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/event_data.dart';

import '../../messenger/functions/size_config.dart';
import '../../messenger/utils/date_functions.dart';

class EventDetailScreen extends StatelessWidget {
  static const String DEFAULT_PREVIEW_PICTURE_LINK =
      'assets/images/default_event.jpg';

  final EventDetailCubit eventDetailCubit;

  const EventDetailScreen({Key? key, required this.eventDetailCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EventDetailCubit, EventsDetailState>(
        bloc: eventDetailCubit,
        builder: (context, state) {
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
                    onTap: eventDetailCubit.refresh, text: state.errorMessage!);
              }
          }
        },
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }

  Widget _getLoadedStateWidget(BuildContext context, EventsDetailState state) {
    EventData event = state.data!;
    Size size = MediaQuery.of(context).size;
    final _strings = localizationInstance;

    return SingleChildScrollView(
      child: Container(
        color: Color(0xFFFFFFFF),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: SizeConfig(context, 220).getProportionateScreenHeight,
                  child: event.pictureLink == null
                      ? Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                          fit: BoxFit.fitWidth)
                      : Image.network(
                          event.pictureLink!,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                                fit: BoxFit.fitWidth);
                          },
                        ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          IconLinks.CLOSE_BUTTON_SVG_LINK,
                          width: SizeConfig(context, 37)
                              .getProportionateScreenHeight,
                          height: SizeConfig(context, 37)
                              .getProportionateScreenHeight,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    child: SvgPicture.asset(
                      IconLinks.VIEW_COUNT_SVG_LINK,
                      semanticsLabel: 'View Count',
                      width: SizeConfig(context, 24.0)
                          .getProportionateScreenHeight,
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
                          color: Colors.grey,
                          fontSize: SizeConfig(context, 13.0)
                              .getProportionateScreenHeight,
                        ),
                      ),
                      margin: EdgeInsets.only(right: 16.0)),
                  Text(
                      event.beginDate != null && event.endDate != null
                          ? "${DateFunctions(passedDate: event.beginDate!).dayMonthYearNumbers()} ${DateFunctions(passedDate: event.beginDate!).hourMinute()} - ${DateFunctions(passedDate: event.endDate!).dayMonthYearNumbers()} ${DateFunctions(passedDate: event.endDate!).hourMinute()}"
                          : "",
                      style: TextStyle(
                        fontFamily: "Helvetica",
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w200,
                        fontSize: SizeConfig(context, 12.0)
                            .getProportionateScreenHeight,
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
                  style: TextStyle(
                    fontSize:
                        SizeConfig(context, 20.0).getProportionateScreenHeight,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Divider(
              color: Color(0xFFE5E5E5),
              thickness: 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomHtml(data: event.detailText),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30, top: 20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: (event.isActual! && event.placesAvailable!)?
              event.isMember!
                  ? Text(
                      _strings.nowParticipatingInTheEvent,
                      style: TextStyle(
                        fontSize: SizeConfig(context, 12.0)
                            .getProportionateScreenHeight,
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFE5E5E5), width: 2),
                          borderRadius: BorderRadius.circular(50)),
                      child: TextButton(
                        onPressed: () {
                          eventDetailCubit.invite(event.id!);
                        },
                        child: Text(
                          _strings.iWillParticipate,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig(context, 17.0)
                                .getProportionateScreenHeight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFFFFFFF)),
                          minimumSize:
                              MaterialStateProperty.all<Size>(Size(335, 50)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                    ):SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
