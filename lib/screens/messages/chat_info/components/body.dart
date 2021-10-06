import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/header.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/users.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ChatInfoHeader(),
          //Файлы и ссылки
          //Уведомления
          ChatInfoUsers(),
          //Очистить чат
          //Покинуть чат
        ],
      ),
    );
  }
}
