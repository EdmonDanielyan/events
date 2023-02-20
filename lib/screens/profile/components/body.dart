import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/cubit/profile/profile_cubit.dart';
import 'package:ink_mobile/cubit/profile/profile_state.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/about_my_field.dart';
import 'package:ink_mobile/screens/profile/components/awards.dart';
import 'package:ink_mobile/screens/profile/components/background.dart';
import 'package:ink_mobile/screens/profile/components/basic_information.dart';
import 'package:ink_mobile/screens/profile/components/contacts.dart';
import 'package:ink_mobile/screens/profile/components/header.dart';
import 'package:ink_mobile/screens/profile/components/other_user_page_header.dart';
import 'package:ink_mobile/screens/profile/components/security.dart';
import 'package:ink_mobile/setup.dart';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import '../profile_screen.dart';
import 'diagnostics.dart';

class Body extends StatelessWidget {
  final ProfileCubit userCubit;

  const Body({Key? key, required this.userCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CustomRefreshIndicator(
      onRefresh: () async {
        userCubit.refresh();
      },
      leadingScrollIndicatorVisible: false,
      trailingScrollIndicatorVisible: false,
      triggerMode: IndicatorTriggerMode.anywhere,
      trigger: IndicatorTrigger.bothEdges,
      builder: MaterialIndicatorDelegate(
        builder:  (BuildContext context, IndicatorController controller) {
          return Icon(
            Icons.update,
            color: Colors.green[900],
            size: 30,
          );
        },
      ),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.data != null) {
            final user = User(
                id: state.data!.id,
                name: "${state.data!.lastName ?? ""} ${state.data!.name ?? ""}",
                avatarUrl: state.data!.pathToAvatar ?? "");
            getIt<CachedUsersCubit>().removeAndAddUser(user, user.id);
          }
        },
        bloc: userCubit,
        builder: (context, state) {
          switch (state.type) {
            case ProfileStateType.LOADED:
              {
                return getLoadedStateWidget(context, state);
              }

            case ProfileStateType.OTHER_USER_LOADED:
              {
                return getOtherUserLoadedWidget(context, state);
              }

            case ProfileStateType.LOADING:
              {
                Map? arg = ModalRoute.of(context)!.settings.arguments as Map?;
                int? userId;

                if (arg != null && arg.isNotEmpty) {
                  userId = arg['id'];
                }

                userCubit.fetchUser(userId);

                return getLoadingStateWidget(context, state);
              }

            case ProfileStateType.ERROR:
              {
                return _getErrorStateWidget(context, state);
              }
          }
        },
      ),
    );
  }

  Widget getLoadedStateWidget(context, ProfileState state) {
    final ScrollController _scrollController = ScrollController();
    UserProfileData user = state.data!;
    final logFile = ProfileScreen.of(context).widget.logFile;
    return Container(
        child: Background(
            child: SingleChildScrollView(
              controller: _scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(children: [
        PersonalPageHeader(user: user),
        Awards(awards: user.awards),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Contacts(contacts: user.contacts),
            BasicInformation(info: user.basicInformation),
            Diagnostics(logFile: logFile),
            ProfileSecuritySection(),
            AboutMyField(user: user, scrollController: _scrollController,)

          ],
        )
      ]),
    )));
  }

  Widget getOtherUserLoadedWidget(context, ProfileState state) {
    final user = state.data;
    if (user == null) return SizedBox();

    return Container(
        child: Background(
            child: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(children: [
        OtherUserPageHeader(user: user),
        Awards(awards: user.awards),
        CustomLayoutBuilder(builder: (context, constraints, isTablet) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Contacts(
                contacts: user.contacts,
              ),
              BasicInformation(
                info: user.basicInformation,
              ),
              //будет поле о пользователе без возможности редактировать
            ],
          );
        })
      ]),
    )));
  }

  Widget getLoadingStateWidget(BuildContext context, ProfileState state) {
    return InkPageLoader();
  }

  Widget _getErrorStateWidget(BuildContext context, ProfileState state) {
    final cubit = ProfileScreen.of(context).profileCubit;

    return ErrorRefreshButton(
      onTap: cubit.refresh,
      text: state.errorMessage!,
    );
  }
}
