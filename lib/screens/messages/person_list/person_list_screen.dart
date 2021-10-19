import 'package:flutter/material.dart';
import 'package:ink_mobile/models/chat/person_list_params.dart';
import 'package:ink_mobile/screens/messages/person_list/components/app_bar.dart';

import 'components/body.dart';

class PersonListScreen extends StatefulWidget {
  static PersonListScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<PersonListScreenState>()!;

  final PersonListParams params;
  const PersonListScreen({Key? key, required this.params}) : super(key: key);

  @override
  PersonListScreenState createState() => PersonListScreenState();
}

class PersonListScreenState extends State<PersonListScreen> {
  PersonListParams get params => widget.params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PersonListAppBar(title: params.title),
      body: PersonListBody(),
    );
  }
}
