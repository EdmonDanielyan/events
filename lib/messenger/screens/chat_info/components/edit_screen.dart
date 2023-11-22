import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/bottom_sheet/bottom_sheet.dart';
import 'package:ink_mobile/messenger/functions/parse_url.dart';
import 'package:ink_mobile/messenger/handler/senders/update_chat_sender_handler.dart';
import 'package:ink_mobile/messenger/model/chat.dart';

import 'divider.dart';
import 'edit_textfield.dart';

class ChatEditScreen extends StatefulWidget {
  final Chat chat;
  final int myId;
  const ChatEditScreen({Key? key, required this.chat, required this.myId})
      : super(key: key);

  @override
  State<ChatEditScreen> createState() => _ChatEditScreenState();
}

class _ChatEditScreenState extends State<ChatEditScreen> {
  final formKey = GlobalKey<FormState>();
  final avatarController = TextEditingController();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    avatarController.text = widget.chat.avatarUrl;
    nameController.text = widget.chat.name;
    descriptionController.text = widget.chat.description;
  }

  Future<void> _onSubmit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final newChat = widget.chat.copyWith(
        name: nameController.text,
        description: descriptionController.text,
        avatarUrl: avatarController.text,
      );

      await UpdateChatSenderHandler(newChat, widget.myId).call();

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomBottomSheetChild(
        title: "Редактировать",
        onSubmit: _onSubmit,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  ChatEditTextField(
                    hintText: "Ссылка на аватар",
                    controller: avatarController,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return null;
                      }
                      return !ParseUrl(str).isStrPicture()
                          ? "Неправильная ссылка"
                          : null;
                    },
                  ),
                  const ChatInfoDivider(),
                  ChatEditTextField(
                    hintText: "Название",
                    controller: nameController,
                    validator: (val) => val!.isEmpty ? "Заполните поле" : null,
                  ),
                  const ChatInfoDivider(),
                  ChatEditTextField(
                    hintText: "Описание",
                    controller: descriptionController,
                  ),
                  const ChatInfoDivider(),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
