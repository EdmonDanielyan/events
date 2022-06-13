import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_messages/hidden_messages_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_messages/hidden_messages_state.dart';

class HiddenMessagesBuilder extends StatelessWidget {
  final HiddenMessagesCubit cubit;
  final Widget Function(BuildContext, HiddenMessagesState) builder;
  const HiddenMessagesBuilder(
    this.cubit, {
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HiddenMessagesCubit, HiddenMessagesState>(
      bloc: cubit,
      builder: builder,
    );
  }
}
