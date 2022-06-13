import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_chats/hidden_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_chats/hidden_chats_state.dart';

class HiddenChatsBuilder extends StatelessWidget {
  final HiddenChatsCubit cubit;
  final Widget Function(BuildContext, HiddenChatsState) builder;
  const HiddenChatsBuilder({
    Key? key,
    required this.cubit,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HiddenChatsCubit, HiddenChatsState>(
      bloc: cubit,
      builder: builder,
    );
  }
}
