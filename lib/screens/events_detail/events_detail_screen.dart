import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/html.dart';
import 'package:ink_mobile/components/ink_drop_down.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/constants/aseets.dart';
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

                return const InkPageLoader();
              }

            case EventsDetailStateType.LOADED:
              {
                return GetLoadedStateWidget(state: state);
                // return _getLoadedStateWidget(context, state);
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
}

class GetLoadedStateWidget extends StatefulWidget {
  final EventsDetailState state;

  const GetLoadedStateWidget({super.key, required this.state});

  @override
  State<GetLoadedStateWidget> createState() => _GetLoadedStateWidgetState();
}

class _GetLoadedStateWidgetState extends State<GetLoadedStateWidget> {
  // late final EventData event;
  // EventData? event = widget.state.data;
  // Size size = MediaQuery.of(context).size;
  // final _strings = localizationInstance;
  // bool isMember = event.isMember ?? false;
  @override
  void initState() {
    // EventData event = widget.state.data!;
    // final _strings = localizationInstance;
    // bool isMember = event.isMember ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EventData event = widget.state.data!;
    final _strings = localizationInstance;
    bool isMember = event.isMember ?? false;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
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
                right: 20.0, left: 20.0, top: 32.0, bottom: 16.0),
            child: Row(
              children: [
                Text(
                  event.beginDate != null && event.endDate != null
                      ? "${DateFunctions(passedDate: event.beginDate!).dayMonthYearNumbers()} ${DateFunctions(passedDate: event.beginDate!).hourMinute()} - ${DateFunctions(passedDate: event.endDate!).dayMonthYearNumbers()} ${DateFunctions(passedDate: event.endDate!).hourMinute()}"
                      : "",
                  style: FontStyles.rubikP2(color: Palette.textBlack50),
                ),
                const Spacer(),
                SvgPicture.asset(IconLinks.OPENED_EYE_ICON_LINK,
                    semanticsLabel: 'View Count',
                    height: 16.0,
                    width: 16.0,
                    colorFilter:
                        ColorFilter.mode(Palette.textBlack50, BlendMode.srcIn)),
                const SizedBox(width: 4.0),
                Text(
                  event.viewCount != null
                      ? widget.state.data!.viewCount.toString()
                      : '0',
                  style: FontStyles.rubikP2(color: Palette.textBlack50),
                ),
              ],
            ),
          ),
          Padding(
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
          // Padding(
          //   padding: const EdgeInsets.all(20),
          //   child: ((event.isActual ?? true) && (event.placesAvailable ?? true))
          //       ? DefaultButton(
          //           title: isMember
          //               ? _strings.cancelParticipating
          //               : _strings.iWillParticipate,
          //           borderColor: isMember ? Palette.redF1C : Palette.greenE4A,
          //           textColor: isMember ? Palette.redF1C : Palette.white,
          //           buttonColor: isMember ? Palette.white : Palette.greenE4A,
          //           onTap: () {
          //             return eventDetailCubit
          //                 .changeParticipationStatus(event.id!);
          //           })
          //       : const SizedBox.shrink(),
          // ),
          DefaultButton(
            title: 'Записаться',
            onTap: () {},
            buttonColor: Palette.transparent,
            borderColor: Palette.greenE4A,
            textColor: Palette.greenE4A,
            suffixIcon: SvgPicture.asset(IconLinks.PLUS_ICON,
                height: 20.0,
                width: 20.0,
                colorFilter:
                    ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Запись на событие',
                  style: FontStyles.rubikH2(color: Palette.textBlack),
                ),
                SizedBox(height: 24),
                Text('Участники',
                    style: FontStyles.rubikP1Medium(color: Palette.textBlack)),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                      horizontalTitleGap: 12,
                      contentPadding: EdgeInsets.all(0),
                      leading: CircleAvatar(
                          radius: 22, backgroundColor: Colors.grey),
                      // ClipRRect(
                      //     borderRadius: BorderRadius.all(Radius.circular(41.r)),
                      //     child: Image.asset(
                      //       'assets/images/${item.imageName}',
                      //       width: 42.r,
                      //       height: 42.r,
                      //       fit: BoxFit.cover,1
                      //     )),
                      title: Text('Алексеев Вадим Андреевич (вы)',
                          style: FontStyles.rubikP2Medium(
                              color: Palette.textBlack)),
                      subtitle: Text(
                        'Водитель фронтального погрузчика \nг. Иркутск',
                        maxLines: 2,
                        style: FontStyles.rubikP3(color: Palette.textBlack50),
                      ),
                      trailing: SvgPicture.asset(
                        IconLinks.EDIT_ICON,
                        height: 24, width: 24,
                        // color: AppColors.subTitleColor,
                      ),
                      isThreeLine: true),
                ),
                Text(
                  'Условия для вас',
                  style: FontStyles.rubikP3(color: Palette.textBlack50),
                ),
                SizedBox(height: 8),
                ExpansionTileControllerApp(),
                SizedBox(
                  height: 32,
                ),
                Container(height: 44, color: Colors.grey),
                SizedBox(height: 32),
                Text('Родственники и другие лица',
                    style: FontStyles.rubikP1Medium(color: Palette.textBlack)),
                SizedBox(height: 16),
                Container(height: 44, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Условия для добавленых лиц',
                  style: FontStyles.rubikP3(color: Palette.textBlack50),
                ),
                SizedBox(height: 8),
                Container(height: 44, color: Colors.grey),
                SizedBox(height: 32),
                Text('Родственники и другие лица',
                    style: FontStyles.rubikP1Medium(color: Palette.textBlack)),
                SizedBox(
                  height: 16,
                ),
                Text('Первый участник'),
                SizedBox(height: 8),
                Container(height: 44, color: Colors.grey),
                SizedBox(height: 8),
                Container(height: 44, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Заголовок условия',
                  style: FontStyles.rubikP3(color: Palette.textBlack50),
                ),
                SizedBox(height: 8),
                Container(height: 44, color: Colors.grey),
                SizedBox(height: 16),
                DefaultButton(
                  title: 'Добавить участника',
                  onTap: () {
                    // Share.share('https://portal.irkutskoil.ru/events/${event.id}/');
                  },
                  buttonColor: Palette.transparent,
                  borderColor: Palette.greenE4A,
                  textColor: Palette.greenE4A,
                  suffixIcon: SvgPicture.asset(IconLinks.PLUS_ICON,
                      height: 20.0,
                      width: 20.0,
                      colorFilter:
                          ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
                ),
                SizedBox(height: 32),
                Text('Заголовок опции',
                    style: FontStyles.rubikP1Medium(color: Palette.textBlack)),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child:
                          Container(width: 56, height: 56, color: Colors.grey),
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Название опции',
                              style: FontStyles.rubikP2Medium(
                                  color: Palette.textBlack)),
                          Text('Здесь могло быть ваше короткое описание')
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 44,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Text('Осталось: 400')
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 32),
                RadioListTileExample(),
                SizedBox(height: 32),
                Text('Желаемая дата посещения'),
                SizedBox(height: 8),
                Container(height: 44, color: Colors.grey),
                SizedBox(height: 32),
                const SizedBox(height: 10),
                LabeledCheckboxExample()
                // DropdownMenuExample(),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: DefaultButton(
          //     title: 'Поделиться',
          //     onTap: () {
          //       Share.share('https://portal.irkutskoil.ru/events/${event.id}/');
          //     },
          //     buttonColor: Palette.transparent,
          //     borderColor: Palette.greenE4A,
          //     textColor: Palette.greenE4A,
          //   ),
          // ),
        ],
      ),
    );
  }
}

Widget _getLoadedStateWidget(BuildContext context, EventsDetailState state) {
  EventData event = state.data!;
  Size size = MediaQuery.of(context).size;
  final _strings = localizationInstance;
  bool isMember = event.isMember ?? false;
  return SingleChildScrollView(
    child: Column(
      children: [
        // SizedBox(
        //   width: size.width,
        //   height: SizeConfig(context, 220).getProportionateScreenHeight,
        //   child: event.pictureLink == null
        //       ? Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
        //           fit: BoxFit.fitWidth)
        //       : Image.network(
        //           event.pictureLink!,
        //           fit: BoxFit.fitWidth,
        //           errorBuilder: (context, error, stackTrace) {
        //             return Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
        //                 fit: BoxFit.fitWidth);
        //           },
        //         ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(
        //       right: 20.0, left: 20.0, top: 32.0, bottom: 16.0),
        //   child: Row(
        //     children: [
        //       Text(
        //         event.beginDate != null && event.endDate != null
        //             ? "${DateFunctions(passedDate: event.beginDate!).dayMonthYearNumbers()} ${DateFunctions(passedDate: event.beginDate!).hourMinute()} - ${DateFunctions(passedDate: event.endDate!).dayMonthYearNumbers()} ${DateFunctions(passedDate: event.endDate!).hourMinute()}"
        //             : "",
        //         style: FontStyles.rubikP2(color: Palette.textBlack50),
        //       ),
        //       const Spacer(),
        //       SvgPicture.asset(IconLinks.OPENED_EYE_ICON_LINK,
        //           semanticsLabel: 'View Count',
        //           height: 16.0,
        //           width: 16.0,
        //           colorFilter:
        //               ColorFilter.mode(Palette.textBlack50, BlendMode.srcIn)),
        //       const SizedBox(width: 4.0),
        //       Text(
        //         event.viewCount != null
        //             ? state.data!.viewCount.toString()
        //             : '0',
        //         style: FontStyles.rubikP2(color: Palette.textBlack50),
        //       ),
        //     ],
        //   ),
        // ),
        // Padding(
        //     padding: const EdgeInsets.only(left: 20, right: 50, bottom: 10),
        //     child: Text(
        //       event.title ?? '',
        //       style: TextStyle(
        //         fontSize:
        //             SizeConfig(context, 20.0).getProportionateScreenHeight,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     )),
        // const Divider(color: Color(0xFFE5E5E5), thickness: 2),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: CustomHtml(data: event.detailText),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(20),
        //   child: ((event.isActual ?? true) && (event.placesAvailable ?? true))
        //       ? DefaultButton(
        //           title: isMember
        //               ? _strings.cancelParticipating
        //               : _strings.iWillParticipate,
        //           borderColor: isMember ? Palette.redF1C : Palette.greenE4A,
        //           textColor: isMember ? Palette.redF1C : Palette.white,
        //           buttonColor: isMember ? Palette.white : Palette.greenE4A,
        //           onTap: () {
        //             return eventDetailCubit
        //                 .changeParticipationStatus(event.id!);
        //           })
        //       : const SizedBox.shrink(),
        // ),
        DefaultButton(
          title: 'Записаться',
          onTap: () {},
          buttonColor: Palette.transparent,
          borderColor: Palette.greenE4A,
          textColor: Palette.greenE4A,
          suffixIcon: SvgPicture.asset(IconLinks.PLUS_ICON,
              height: 20.0,
              width: 20.0,
              colorFilter: ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Запись на событие',
                style: FontStyles.rubikH2(color: Palette.textBlack),
              ),
              SizedBox(height: 24),
              Text('Участники',
                  style: FontStyles.rubikP1Medium(color: Palette.textBlack)),
              InkWell(
                onTap: () {},
                child: ListTile(
                    horizontalTitleGap: 12,
                    contentPadding: EdgeInsets.all(0),
                    leading:
                        CircleAvatar(radius: 22, backgroundColor: Colors.grey),
                    // ClipRRect(
                    //     borderRadius: BorderRadius.all(Radius.circular(41.r)),
                    //     child: Image.asset(
                    //       'assets/images/${item.imageName}',
                    //       width: 42.r,
                    //       height: 42.r,
                    //       fit: BoxFit.cover,1
                    //     )),
                    title: Text('Алексеев Вадим Андреевич (вы)',
                        style:
                            FontStyles.rubikP2Medium(color: Palette.textBlack)),
                    subtitle: Text(
                      'Водитель фронтального погрузчика \nг. Иркутск',
                      maxLines: 2,
                      style: FontStyles.rubikP3(color: Palette.textBlack50),
                    ),
                    trailing: SvgPicture.asset(
                      IconLinks.EDIT_ICON,
                      height: 24, width: 24,
                      // color: AppColors.subTitleColor,
                    ),
                    isThreeLine: true),
              ),
              Text(
                'Условия для вас',
                style: FontStyles.rubikP3(color: Palette.textBlack50),
              ),
              SizedBox(height: 8),
              ExpansionTileControllerApp(),
              SizedBox(
                height: 32,
              ),
              Container(height: 44, color: Colors.grey),
              SizedBox(height: 32),
              Text('Родственники и другие лица',
                  style: FontStyles.rubikP1Medium(color: Palette.textBlack)),
              SizedBox(height: 16),
              Container(height: 44, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'Условия для добавленых лиц',
                style: FontStyles.rubikP3(color: Palette.textBlack50),
              ),
              SizedBox(height: 8),
              Container(height: 44, color: Colors.grey),
              SizedBox(height: 32),
              Text('Родственники и другие лица',
                  style: FontStyles.rubikP1Medium(color: Palette.textBlack)),
              SizedBox(
                height: 16,
              ),
              Text('Первый участник'),
              SizedBox(height: 8),
              Container(height: 44, color: Colors.grey),
              SizedBox(height: 8),
              Container(height: 44, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'Заголовок условия',
                style: FontStyles.rubikP3(color: Palette.textBlack50),
              ),
              SizedBox(height: 8),
              Container(height: 44, color: Colors.grey),
              SizedBox(height: 16),
              DefaultButton(
                title: 'Добавить участника',
                onTap: () {
                  // Share.share('https://portal.irkutskoil.ru/events/${event.id}/');
                },
                buttonColor: Palette.transparent,
                borderColor: Palette.greenE4A,
                textColor: Palette.greenE4A,
                suffixIcon: SvgPicture.asset(IconLinks.PLUS_ICON,
                    height: 20.0,
                    width: 20.0,
                    colorFilter:
                        ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
              ),
              SizedBox(height: 32),
              Text('Заголовок опции',
                  style: FontStyles.rubikP1Medium(color: Palette.textBlack)),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(width: 56, height: 56, color: Colors.grey),
                  ),
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Название опции',
                            style: FontStyles.rubikP2Medium(
                                color: Palette.textBlack)),
                        Text('Здесь могло быть ваше короткое описание')
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 44,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 8),
                        Text('Осталось: 400')
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 32),
              RadioListTileExample(),
              SizedBox(height: 32),
              Text('Желаемая дата посещения'),
              SizedBox(height: 8),
              Container(height: 44, color: Colors.grey),
              SizedBox(height: 32),
              const SizedBox(height: 10),
              LabeledCheckboxExample()
              // DropdownMenuExample(),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: DefaultButton(
        //     title: 'Поделиться',
        //     onTap: () {
        //       Share.share('https://portal.irkutskoil.ru/events/${event.id}/');
        //     },
        //     buttonColor: Palette.transparent,
        //     borderColor: Palette.greenE4A,
        //     textColor: Palette.greenE4A,
        //   ),
        // ),
      ],
    ),
  );
}

class ExpansionTileControllerApp extends StatefulWidget {
  const ExpansionTileControllerApp({super.key});

  @override
  State<ExpansionTileControllerApp> createState() =>
      _ExpansionTileControllerAppState();
}

class _ExpansionTileControllerAppState
    extends State<ExpansionTileControllerApp> {
  bool value = false;
  final ExpansionTileController controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Palette.text20Grey,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          child: ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            // clipBehavior: Clip.hardEdge,
            // collapsedShape: ContinuousRectangleBorder(
            //     side: BorderSide(color: Palette.text20Grey),
            //     borderRadius: BorderRadius.all(Radius.circular(8))),
            // shape: ContinuousRectangleBorder(
            //     side: BorderSide(color: Palette.text20Grey),
            //     borderRadius: BorderRadius.all(Radius.circular(8))),
            controller: controller,
            title: const Text('Выберите условия для вас'),
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    value = !value;
                  });
                  // onChanged(!value);
                },
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: value,
                      onChanged: (bool? value) {
                        setState(() {
                          value != value;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'Сергей Николаевич Евчик, сын, 20.07.1998',
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              // LabeledCheckboxExample(),
              // LabeledCheckboxExample(),
              // LabeledCheckboxExample(),
              // LabeledCheckboxExample(),
              Divider(
                endIndent: 16,
                indent: 16,
                height: 1,
                thickness: 1,
                color: Palette.text20Grey,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultButton(
                  title: 'Добавить участника',
                  onTap: () {
                    // Share.share('https://portal.irkutskoil.ru/events/${event.id}/');
                  },
                  buttonColor: Palette.transparent,
                  borderColor: Palette.greenE4A,
                  textColor: Palette.greenE4A,
                  suffixIcon: SvgPicture.asset(IconLinks.PLUS_ICON,
                      height: 20.0,
                      width: 20.0,
                      colorFilter:
                          ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
            top: 57,
            child: Align(
                alignment: Alignment.topCenter,
                child: Divider(
                  endIndent: 1,
                  indent: 1,
                  height: 1,
                  thickness: 1,
                  color: Palette.text20Grey,
                ))),
      ],
    );
    // Positioned.fill(
    //     top: 54,
    //     child: Align(
    //       alignment: Alignment.topCenter,
    //       child: Divider(
    //         // height: 50,
    //         // thickness: 10,
    //         color: Palette.text20Grey,
    //       ),
    //     ))
    // const SizedBox(height: 8),
    // ElevatedButton(
    //   child: const Text('Expand/Collapse the Tile Above'),
    //   onPressed: () {
    //     if (controller.isExpanded) {
    //       controller.collapse();
    //     } else {
    //       controller.expand();
    //     }
    //   },
    // ),
    // const SizedBox(height: 48),
    // A controller has not been provided to the ExpansionTile because
    // the automatically created one can be retrieved via the tile's BuildContext.
    // ExpansionTile(
    //   title: const Text('ExpansionTile with implicit controller.'),
    //   children: <Widget>[
    //     Builder(
    //       builder: (BuildContext context) {
    //         return Container(
    //           padding: const EdgeInsets.all(24),
    //           alignment: Alignment.center,
    //           child: ElevatedButton(
    //             child: const Text('Collapse This Tile'),
    //             onPressed: () {
    //               return ExpansionTileController.of(context).collapse();
    //             },
    //           ),
    //         );
    //       },
    //     ),
    //   ],
    // ),
  }
}
//border
// border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide(color: Palette.text20Grey),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Palette.greenE4A),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide(color: Palette.text20Grey),
//               ),
//             ),

enum Groceries { pickles, tomato, lettuce }

class RadioListTileExample extends StatefulWidget {
  const RadioListTileExample({super.key});

  @override
  State<RadioListTileExample> createState() => _RadioListTileExampleState();
}

class _RadioListTileExampleState extends State<RadioListTileExample> {
  Groceries? _groceryItem = Groceries.pickles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<Groceries>(
          value: Groceries.pickles,
          groupValue: _groceryItem,
          onChanged: (Groceries? value) {
            setState(() {
              _groceryItem = value;
            });
          },
          title: Text('Название опции',
              style: FontStyles.rubikP2Medium(color: Palette.textBlack)),
          subtitle: const Text('Здесь могло быть ваше короткое описание'),
        ),
        RadioListTile<Groceries>(
          value: Groceries.tomato,
          groupValue: _groceryItem,
          onChanged: (Groceries? value) {
            setState(() {
              _groceryItem = value;
            });
          },
          title: Text('Название опции',
              style: FontStyles.rubikP2Medium(color: Palette.textBlack)),
          subtitle: const Text('Здесь могло быть ваше короткое описание'),
        ),
      ],
    );
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: <Widget>[
          Checkbox(
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue!);
            },
          ),
          Expanded(child: Text(label)),
        ],
      ),
    );
  }
}

class LabeledCheckboxExample extends StatefulWidget {
  const LabeledCheckboxExample({super.key});

  @override
  State<LabeledCheckboxExample> createState() => _LabeledCheckboxExampleState();
}

class _LabeledCheckboxExampleState extends State<LabeledCheckboxExample> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return LabeledCheckbox(
      label: 'Запланировать в календаре',
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
    );
  }
}
