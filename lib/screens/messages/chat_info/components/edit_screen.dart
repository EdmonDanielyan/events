import 'package:flutter/material.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/components/changable_avatar.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/edit_entities.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatInfoEditScreen extends StatefulWidget {
  final ChatDatabaseCubit chatDatabaseCubit;
  const ChatInfoEditScreen({Key? key, required this.chatDatabaseCubit})
      : super(key: key);

  @override
  _ChatInfoEditScreenState createState() => _ChatInfoEditScreenState();
}

class _ChatInfoEditScreenState extends State<ChatInfoEditScreen> {
  ChatTable get _chat => widget.chatDatabaseCubit.selectedChat!;
  bool get isGroup => ChatListView.isGroup(_chat);

  double _horizontalPadding = 20.0;
  late ChatInfoEditEntities entities;
  final _formKey = GlobalKey<FormState>();
  late AppLocalizations _strings;

  void onSave() {
    if (_formKey.currentState!.validate()) {
      ChatTable chat = ChatInfoEditEntitiesFunctions.copyChat(entities, _chat);
      ChatFunctions(widget.chatDatabaseCubit).updateChat(chat);
      UseMessageProvider.messageProvider.sendNewChatInfo(chat);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;

    entities = ChatInfoEditEntities(
      avatarUrl: _chat.avatar,
      name: _chat.name,
      description: _chat.description,
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
              textfieldWidget(
                initalValue: _chat.avatar,
                hint: _strings.avatarUrl,
                onChanged: (val) => entities.avatarUrl = val,
                validator: (val) => !Uri.parse(entities.avatarUrl).isAbsolute
                    ? _strings.fillTheFieldCorrectly
                    : null,
              ),
              //avatarWidget(),
              const SizedBox(height: 5.0),
              divider(),
              textfieldWidget(
                initalValue: _chat.name,
                hint: _strings.groupName,
                fontWeight: FontWeight.bold,
                onChanged: (val) => entities.name = val,
                validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
              ),
              const SizedBox(height: 5.0),
              divider(),
              if (isGroup) ...[
                textfieldWidget(
                  initalValue: _chat.description,
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
  }

  Widget avatarWidget() {
    return ChangableAvatar(url: _chat.avatar);
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
      height: 3.0,
      color: Colors.grey,
    );
  }
}
