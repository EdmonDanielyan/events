import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/cubits/custom/search_select_cubit/search_select_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/search_select_cubit/search_select_state.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class SearchBuilder extends StatelessWidget {
  final SearchSelectCubit<Message> cubit;
  final Widget Function(BuildContext, SearchSelectState<Message>) builder;
  const SearchBuilder(this.cubit, {Key? key, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchSelectCubit<Message>, SearchSelectState<Message>>(
      bloc: cubit,
      builder: builder,
    );
  }
}
