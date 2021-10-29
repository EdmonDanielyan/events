import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/setup.dart';

class GlobalProvider {
  static ChatDatabaseCubit get chatDatabaseCubit => sl.get<ChatDatabaseCubit>();

  static List<dynamic> getProviders(BuildContext context) {
    return [
      BlocProvider(create: (context) => sl.get<ChatDatabaseCubit>()),
      BlocProvider(create: (context) => sl.get<NewBottomNavBarCubit>()),
      BlocProvider(create: (context) => sl.get<ChatCubit>()),
      BlocProvider(create: (context) => sl.get<ChatPersonListCubit>()),
      BlocProvider(create: (context) => ChatDatabaseCubit())
    ];
  }
}
