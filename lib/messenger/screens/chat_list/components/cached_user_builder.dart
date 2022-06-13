import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_state.dart';
import 'package:collection/collection.dart';
import 'package:ink_mobile/messenger/model/user.dart';

class CachedUserBuilder extends StatelessWidget {
  final CachedUsersCubit cachedUsersCubit;
  final int userId;
  final Widget Function(BuildContext, CachedUsersState, User?) builder;
  const CachedUserBuilder({
    Key? key,
    required this.cachedUsersCubit,
    required this.userId,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CachedUsersCubit, CachedUsersState>(
      bloc: cachedUsersCubit,
      builder: (context, state) {
        final user =
            state.users.firstWhereOrNull((element) => element.id == userId);

        return builder(context, state, user);
      },
    );
  }
}
