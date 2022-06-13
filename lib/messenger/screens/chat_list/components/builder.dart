import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_state.dart';

class ChatsBuilder extends StatelessWidget {
  final CachedChatsCubit cachedChatsCubit;
  final Widget Function(BuildContext, CachedChatsState) builder;
  final void Function(BuildContext, CachedChatsState)? listener;
  const ChatsBuilder({
    Key? key,
    required this.cachedChatsCubit,
    required this.builder,
    this.listener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CachedChatsCubit, CachedChatsState>(
      bloc: cachedChatsCubit,
      listener: (context, state) {
        if (listener != null) {
          listener!(context, state);
        }
      },
      builder: builder,
    );
  }
}
