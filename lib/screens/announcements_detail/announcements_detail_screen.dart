import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/announcements_detail/components/body.dart';
import 'package:ink_mobile/cubit/announcements_detail/announcements_detail_cubit.dart';
import 'package:ink_mobile/cubit/announcements_detail/announcements_detail_state.dart';

import '../../cubit/announcements_list/announcements_list_cubit.dart';

class AnnouncementsDetailScreen extends StatelessWidget {
  final AnnouncementCubit announcementCubit;
  final MainAnnouncementsListCubit mainAnnouncementsListCubit;
  final AnnouncementsListCubit announcementsListCubit;
  const AnnouncementsDetailScreen(
      {Key? key,
      required this.mainAnnouncementsListCubit,
      required this.announcementsListCubit,
      required this.announcementCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      appBar: InkAppBar(
        context,
        showPersonalPageLink: true,
        title: _strings.announcements,
      ),
      backgroundColor: Palette.white,
      body: BlocBuilder<AnnouncementCubit, AnnouncementsDetailState>(
        bloc: announcementCubit,
        builder: (context, state) {
          switch (state.type) {
            case AnnouncementsDetailStateType.LOADING:
              {
                Map arg = ModalRoute.of(context)?.settings.arguments as Map;
                int announcementId = 0;

                if (arg.isNotEmpty) {
                  announcementId = arg['id'];
                }

                announcementCubit.fetch(announcementId);

                return const InkPageLoader();
              }

            case AnnouncementsDetailStateType.LOADED:
              {
                return SingleChildScrollView(
                  child: Body(
                    announcement: state.data!,
                    mainAnnouncementsListCubit: mainAnnouncementsListCubit,
                    announcementsListCubit: announcementsListCubit,
                  ),
                );
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
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.popAndPushNamed(context, '/404');
                });

                return Container();
              }
          }
        },
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
