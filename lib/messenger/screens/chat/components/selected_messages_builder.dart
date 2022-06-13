import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/custom/messages_cubit.dart';
import '../../../model/message.dart';

class SelectedMessagesBuilder extends StatelessWidget {
  final MessagesCubit messagesCubit;
  final Widget Function(BuildContext, List<Message>) builder;
  const SelectedMessagesBuilder(
    this.messagesCubit, {
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesCubit, List<Message>>(
      bloc: messagesCubit,
      builder: builder,
    );
  }
}
