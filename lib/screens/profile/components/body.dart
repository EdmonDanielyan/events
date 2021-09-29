import 'package:flutter/material.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/background.dart';
import 'package:ink_mobile/screens/profile/components/header.dart';
import 'package:ink_mobile/screens/profile/components/awards.dart';
import 'package:ink_mobile/screens/profile/components/contacts.dart';
import 'package:ink_mobile/screens/profile/components/basic_information.dart';
import 'package:ink_mobile/cubit/profile/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/profile/profile_state.dart';
import 'package:ink_mobile/screens/profile/components/other_user_page_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileCubit userCubit = BlocProvider.of<ProfileCubit>(context);

    return RefreshIndicator(
        onRefresh: () async {
          userCubit.refresh();
        },
        color: Colors.green,
        displacement: 20,
        child:
            BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
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
                Map arg = ModalRoute.of(context)!.settings.arguments as Map;
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
        }));
  }

  Widget getLoadedStateWidget(context, ProfileState state) {
    UserProfileData user = state.data!;

    return Container(
        child: Background(
            child: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(children: [
        PersonalPageHeader(user: user),
        Awards(awards: user.awards),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Contacts(contacts: user.contacts),
              BasicInformation(info: user.basicInformation),
            ],
          ),
        )
      ]),
    )));
  }

  Widget getOtherUserLoadedWidget(context, state) {
    UserProfileData user = state.data;

    return Container(
        child: Background(
            child: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(children: [
        OtherUserPageHeader(user: user),
        Awards(awards: user.awards),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Contacts(contacts: user.contacts),
              BasicInformation(info: user.basicInformation),
            ],
          ),
        )
      ]),
    )));
  }

  Widget getLoadingStateWidget(BuildContext context, ProfileState state) {
    return InkPageLoader();
  }

  Widget _getErrorStateWidget(BuildContext context, ProfileState state) {
    final ProfileCubit cubit = BlocProvider.of<ProfileCubit>(context);

    return ErrorRefreshButton(
      onTap: cubit.refresh,
      text: state.errorMessage!,
    );
  }
}
