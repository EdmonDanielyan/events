import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/components/changable_avatar.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/edit_entities.dart';

class ChatInfoEditScreen extends StatefulWidget {
  const ChatInfoEditScreen({Key? key}) : super(key: key);

  @override
  _ChatInfoEditScreenState createState() => _ChatInfoEditScreenState();
}

class _ChatInfoEditScreenState extends State<ChatInfoEditScreen> {
  late ChatListCubit _chatListCubit;
  late ChatCubit _chatCubit;
  late Chat _chat;
  bool get isGroup => _chat.group != null;
  double _horizontalPadding = 20.0;
  late ChatInfoEditEntities entities;
  final _formKey = GlobalKey<FormState>();
  late LanguageStrings _strings;

  void onSave() {
    if (_formKey.currentState!.validate()) {
      Chat chat = ChatInfoEditEntitiesFunctions.copyChat(entities, _chat);

      _chatListCubit.updateChat(chat);
      _chatCubit.emitChat(chat);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    _chatListCubit = BlocProvider.of<ChatListCubit>(context);
    _chatCubit = BlocProvider.of<ChatCubit>(context);
    return BlocBuilder<ChatCubit, ChatCubitState>(
      builder: (BuildContext context, state) {
        _chat = state.chat;

        entities = ChatInfoEditEntities(
          name: _chat.chatName,
          description: isGroup ? _chat.group!.description : "",
        );
        return SafeArea(
          child: CustomBottomSheetChild(
            title: _strings.edit,
            onSubmit: onSave,
            cancelBtnTxt: _strings.cancel,
            submitBtnTxt: _strings.ready,
            horizontalPadding: _horizontalPadding,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  avatarWidget(),
                  SizedBox(height: 20.0),
                  divider(),
                  textfieldWidget(
                    initalValue: _chat.chatName,
                    hint: _strings.groupName,
                    fontWeight: FontWeight.bold,
                    onChanged: (val) => entities.name = val,
                    validator: (val) =>
                        val!.isEmpty ? _strings.fillTheField : null,
                  ),
                  divider(),
                  if (isGroup) ...[
                    textfieldWidget(
                      initalValue: _chat.group!.description,
                      hint: _strings.description,
                      onChanged: (val) => entities.description = val,
                    ),
                    divider(),
                  ],
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget avatarWidget() {
    return ChangableAvatar(url: _chat.avatarUrl);
  }

  Widget textfieldWidget({
    required String initalValue,
    String hint = "",
    FontWeight fontWeight = FontWeight.normal,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: TextFormField(
        onChanged: onChanged,
        initialValue: initalValue,
        validator: validator,
        autovalidateMode: AutovalidateMode.disabled,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: fontWeight,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(
      height: 2.0,
      color: Colors.grey,
    );
  }
}
