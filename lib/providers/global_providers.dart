import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/setup.dart';

class GlobalProvider {
  static List<dynamic> getProviders(BuildContext context) {
    return [
      BlocProvider(create: (context) => sl<ChatDatabaseCubit>()),
      BlocProvider(create: (context) => sl<NewBottomNavBarCubit>()),
    ];
  }
}
