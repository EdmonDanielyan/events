import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_state.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:collection/collection.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

class OnlineBuilder extends StatefulWidget {
  final OnlineCubit onlineCubit;
  final Widget Function(BuildContext, OnlineState, User?) builder;
  final int userId;
  final CachedChatsCubit cachedChatsCubit;
  const OnlineBuilder(
    this.onlineCubit, {
    Key? key,
    required this.builder,
    required this.userId,
    required this.cachedChatsCubit,
  }) : super(key: key);

  @override
  State<OnlineBuilder> createState() => _OnlineBuilderState();
}

class _OnlineBuilderState extends State<OnlineBuilder> {
  @override
  void initState() {
    super.initState();

    getIt<MessengerProvider>().subscribeOnline(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnlineCubit, OnlineState>(
      bloc: widget.onlineCubit,
      builder: (context, state) {
        final user = state.users
            .firstWhereOrNull((element) => element.id == widget.userId);

        if (widget.cachedChatsCubit.myId == widget.userId) {
          return widget.builder(context, state, widget.cachedChatsCubit.me);
        }

        return widget.builder(context, state, user);
      },
    );
  }
}
