import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/html.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/events_detail/events_detail_cubit.dart';
import 'package:ink_mobile/cubit/events_detail/events_detail_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:share_plus/share_plus.dart';

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
      appBar: InkAppBar(
        context,
        showPersonalPageLink: true,
        title: localizationInstance.events,
      ),
      backgroundColor: Palette.white,
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
    bool isMember = event.isMember ?? false;
    return SingleChildScrollView(
      child: Column(
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
          Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
              left: 20.0,
              top: 32.0,
              bottom: 16.0,
            ),
            child: Row(
              children: [
                Text(
                  event.beginDate != null && event.endDate != null
                      ? "${DateFunctions(passedDate: event.beginDate!).dayMonthYearNumbers()} ${DateFunctions(passedDate: event.beginDate!).hourMinute()} - ${DateFunctions(passedDate: event.endDate!).dayMonthYearNumbers()} ${DateFunctions(passedDate: event.endDate!).hourMinute()}"
                      : "",
                  style: FontStyles.rubikP2(color: Palette.textBlack50),
                ),
                const Spacer(),
                SvgPicture.asset(
                  IconLinks.OPENED_EYE_ICON_LINK,
                  semanticsLabel: 'View Count',
                  height: 16.0,
                  width: 16.0,
                  color: Palette.textBlack50,
                ),
                const SizedBox(width: 4.0),
                Text(
                  event.viewCount != null
                      ? state.data!.viewCount.toString()
                      : '0',
                  style: FontStyles.rubikP2(color: Palette.textBlack50),
                ),
              ],
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, right: 50, bottom: 10),
              child: Text(
                event.title ?? '',
                style: TextStyle(
                  fontSize:
                      SizeConfig(context, 20.0).getProportionateScreenHeight,
                  fontWeight: FontWeight.bold,
                ),
              )),
          const Divider(color: Color(0xFFE5E5E5), thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomHtml(data: event.detailText),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 30, top: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ((event.isActual ?? true) && (event.placesAvailable ?? true))
                ? DefaultButton(
                    title: isMember
                        ? _strings.cancelParticipating
                        : _strings.iWillParticipate,
                    borderColor: isMember ? Palette.redF1C : Palette.greenE4A,
                    textColor: isMember ? Palette.redF1C : Palette.white,
                    buttonColor: isMember ? Palette.white : Palette.greenE4A,
                    onTap: () =>
                        eventDetailCubit.changeParticipationStatus(event.id!),
                  )
                : const SizedBox.shrink(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DefaultButton(
              title: 'Поделиться',
              onTap: () {
                Share.share('https://portal.irkutskoil.ru/events/${event.id}/');
              },
              buttonColor: Palette.transparent,
              borderColor: Palette.greenE4A,
              textColor: Palette.greenE4A,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
