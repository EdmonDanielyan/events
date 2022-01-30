import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/models/person_list_params.dart';

import 'components/body.dart';

class PersonListScreen extends StatefulWidget {
  static PersonListScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<PersonListScreenState>()!;

  final PersonListParams params;
  final ChatDatabaseCubit chatDatabaseCubit;
  const PersonListScreen(
      {Key? key, required this.params, required this.chatDatabaseCubit})
      : super(key: key);

  @override
  PersonListScreenState createState() => PersonListScreenState();
}

class PersonListScreenState extends State<PersonListScreen> {
  PersonListParams get params => widget.params;
  ChatDatabaseCubit get chatDatabaseCubit => widget.chatDatabaseCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(title: params.title),
      body: PersonListBody(),
    );
  }
}
