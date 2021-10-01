import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/screens/announcements_detail/components/body.dart';
import 'package:ink_mobile/cubit/announcements_detail/announcements_detail_cubit.dart';
import 'package:ink_mobile/cubit/announcements_detail/announcements_detail_state.dart';

class AnnouncementsDetailScreen extends StatelessWidget {
  const AnnouncementsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return BlocProvider<AnnouncementCubit>(
        create: (BuildContext context) =>
            AnnouncementCubit(languageStrings: _strings),
        child: Scaffold(
          appBar: InkAppBarWithText(title: _strings.announcements),
          body: BlocBuilder<AnnouncementCubit, AnnouncementsDetailState>(
              builder: (context, state) {
            final AnnouncementCubit announcementCubit =
                BlocProvider.of<AnnouncementCubit>(context);

            switch (state.type) {
              case AnnouncementsDetailStateType.LOADING:
                {
                  Map arg = ModalRoute.of(context)?.settings.arguments as Map;
                  int announcementId = 0;

                  if (arg.isNotEmpty) {
                    announcementId = arg['id'];
                  }

                  announcementCubit.fetch(announcementId);

                  return InkPageLoader();
                }

              case AnnouncementsDetailStateType.LOADED:
                {
                  return SingleChildScrollView(
                      child: Body(announcement: state.data!));
                }

              case AnnouncementsDetailStateType.ERROR:
                {
                  return ErrorRefreshButton(
                    onTap: announcementCubit.refresh,
                    text: state.errorMessage!,
                  );
                }

              case AnnouncementsDetailStateType.NOT_FOUND:
                {
                  SchedulerBinding.instance?.addPostFrameCallback((_) {
                    Navigator.popAndPushNamed(context, '/404');
                  });

                  return Container();
                }
            }
          }),
        ));
  }
}
