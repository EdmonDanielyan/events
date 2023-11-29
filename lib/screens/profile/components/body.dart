import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/profile/profile_cubit.dart';
import 'package:ink_mobile/cubit/profile/profile_state.dart';
import 'package:ink_mobile/messenger/components/cached_avatar/cached_avatar.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/awards.dart';
import 'package:ink_mobile/screens/profile/components/basic_information.dart';
import 'package:ink_mobile/screens/profile/components/basic_information_row.dart';
import 'package:ink_mobile/screens/profile/components/contacts.dart';
import 'package:ink_mobile/screens/profile/components/header.dart';
import 'package:ink_mobile/screens/profile/components/other_user_page_header.dart';
import 'package:ink_mobile/screens/profile/components/security.dart';
import 'package:ink_mobile/screens/profile/components/thanks_button.dart';
import 'package:ink_mobile/screens/profile/components/user_main_info.dart';
import 'package:ink_mobile/screens/profile/components/votes_bar.dart';
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
      trigger: IndicatorTrigger.leadingEdge,
      builder: MaterialIndicatorDelegate(
        builder: (BuildContext context, IndicatorController controller) {
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
              avatarUrl: state.data!.pathToAvatar ?? "",
              absence: state.data!.absence,
            );
            getIt<CachedUsersCubit>().removeAndAddUser(user, user.id);
          }
        },
        bloc: userCubit,
        builder: (context, state) {
          switch (state.type) {
            case ProfileStateType.LOADED:
            case ProfileStateType.OTHER_USER_LOADED:
              {
                return getLoadedStateWidget(context, state);
              }

            case ProfileStateType.LOADING:
              {
                userCubit.fetchUser(context);

                return const InkPageLoader();
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

  Widget getLoadedStateWidget(BuildContext context, ProfileState state) {
    final ScrollController _scrollController = ScrollController();
    UserProfileData user = state.data!;
    final logFile = ProfileScreen.of(context).widget.logFile;
    return CustomScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        if (state.type == ProfileStateType.LOADED)
          PersonalPageHeader(user: user),

        if (state.type == ProfileStateType.LOADED) UserMainInfo(user: user),
        if (state.type == ProfileStateType.LOADED) VotesBar(votes: user.votes),
        if (state.type == ProfileStateType.OTHER_USER_LOADED)
          OtherUserPageHeader(user: user),
        if (state.type == ProfileStateType.OTHER_USER_LOADED)
          UserAdditionalHeader(user: user),
        if (state.type == ProfileStateType.OTHER_USER_LOADED)
          VotesBar(votes: user.votes),
        if (state.type == ProfileStateType.OTHER_USER_LOADED)
          user.canBeThanked
              ? SliverPadding(
                  padding: const EdgeInsets.only(
                      top: 24, left: 20, right: 20, bottom: 12),
                  sliver:
                      SliverToBoxAdapter(child: ThanksButton(userId: user.id)))
              : const SliverToBoxAdapter(child: SizedBox.shrink()),

        Awards(awards: user.badges),
        Contacts(contacts: user.contacts),
        BasicInformation(info: user.basicInformation),
        if (user.absence != null)
          SliverPadding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: BasicInfoRow(
                  title: 'Статус', value: user.absence!.reason ?? ""),
            ),
          ),
        if (user.shiftMan != null)
          SliverToBoxAdapter(
            child: InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                "/personal",
                arguments: {
                  "id": user.shiftMan!.id,
                },
              ),
              child: BasicInfoRow(
                title: 'Сменщик',
                value: user.shiftMan!.fullName,
              ),
            ),
          ),

        Diagnostics(logFile: logFile),
        if (state.type == ProfileStateType.LOADED)
          const ProfileSecuritySection(),
        if (state.type == ProfileStateType.LOADED)
          SliverToBoxAdapter(
              child: Container(
            height: 400,
            color: Colors.red,
          )),

        /// todo AboutMyField
        // AboutMyField(user: user, scrollController: _scrollController,)
      ],
    );
  }

// List<Widget> buildSliverList(BuildContext context, ProfileState state){
//   final user = state.data!;
//   switch (state.type) {
//     case ProfileStateType.LOADED:
//     [
//     PersonalPageHeader(user: user),VotesBar(votes: user.votes),];

//       break;
//     default:
//   }
//   return [];
}

Widget _getErrorStateWidget(BuildContext context, ProfileState state) {
  final cubit = ProfileScreen.of(context).profileCubit;

  return ErrorRefreshButton(
    onTap: cubit.refresh,
    text: state.errorMessage!,
  );
}
