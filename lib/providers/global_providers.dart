import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/rus.dart';
import 'package:ink_mobile/screens/messages/cubit/chat_list_cubit.dart';

class GlobalProvider {
  static List<dynamic> getProviders(BuildContext context) {
    return [
      BlocProvider(
        create: (BuildContext context) =>
            LocalizationCubit(initialState: RussianStrings()),
      ),
      BlocProvider(create: (context) => NewBottomNavBarCubit()),
      BlocProvider(create: (context) => ChatListCubit()),
    ];
  }
}
