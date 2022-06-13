import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_state.dart';
import 'package:ink_mobile/messenger/model/chat.dart';

class ChatBuilder extends StatelessWidget {
  final CachedChatsCubit cachedChatsCubit;
  final Widget Function(BuildContext, CachedChatsState, Chat?) builder;
  final bool Function(CachedChatsState, CachedChatsState)? buildWhen;
  final bool Function(CachedChatsState, CachedChatsState)? listenWhen;
  final void Function(BuildContext, CachedChatsState, Chat?)? listener;
  const ChatBuilder({
    Key? key,
    required this.cachedChatsCubit,
    required this.builder,
    this.buildWhen,
    this.listenWhen,
    this.listener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CachedChatsCubit, CachedChatsState>(
      buildWhen:
          buildWhen ?? (prev, curr) => prev.selectedChats != curr.selectedChats,
      listenWhen: listenWhen ??
          (prev, curr) => prev.selectedChats != curr.selectedChats,
      bloc: cachedChatsCubit,
      listener: (context, state) => listener != null
          ? listener!(context, state,
              state.selectedChats.isNotEmpty ? state.selectedChats.last : null)
          : null,
      builder: (context, state) => builder(context, state,
          state.selectedChats.isNotEmpty ? state.selectedChats.last : null),
    );
  }
}
