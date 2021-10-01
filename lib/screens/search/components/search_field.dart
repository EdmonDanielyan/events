import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/models/search/search_query.dart';
import 'package:ink_mobile/cubit/search/search_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    final SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35, vertical: 40),
      padding: EdgeInsets.only(top: 15),
      child: TextField(
          onChanged: (query) {
            if (query.length >= 3) {
              SearchQuery.query = query;
              searchCubit.search(query);
            } else {
              searchCubit.refresh();
            }
          },
          decoration: InputDecoration(
              filled: true,
              suffixIcon: Icon(Icons.search),
              fillColor: Colors.white,
              hintText: _strings.searchHint,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))))),
    );
  }
}
