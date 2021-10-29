import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/components/loader/error_loading_widget.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_state.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_user_select.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/new_chat_person_container.dart';
import 'package:ink_mobile/screens/search/components/search_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewChatScreen extends StatefulWidget {
  final ChatDatabaseCubit chatDatabaseCubit;
  const NewChatScreen({Key? key, required this.chatDatabaseCubit})
      : super(key: key);

  @override
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  double _avatarSize = 35.0;
  double _titleGap = 15.0;
  double _horizontalPadding = 20.0;
  late AppLocalizations _strings;
  late ChatPersonListCubit _personListCubit;

  List<UserTable> get selectedItems => ChatUserSelectViewModel.getSelectedItems(
      _personListCubit.state.searchUsers);

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _personListCubit.init();
    });
  }

  Future<void> _createChat(UserTable user) async {
    ChatTable newChat =
        await ChatCreation(widget.chatDatabaseCubit).createSingleChat(user);
    Navigator.of(context).pop();
    OpenChat(widget.chatDatabaseCubit, newChat).call(context);
  }

  void _onCreate() {
    List<UserTable> items = selectedItems;
    if (items.length == 1)
      _createChat(items.first);
    else if (items.length > 1) Navigator.of(context).pushNamed("/new_group");
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    _personListCubit = BlocProvider.of<ChatPersonListCubit>(context);

    return BlocBuilder<ChatPersonListCubit, ChatPersonListCubitState>(
      builder: (BuildContext context, state) {
        return CustomBottomSheetChild(
          constraints: BoxConstraints(
            minHeight: 250.0,
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
          title: _strings.writeHint,
          cancelBtnTxt: _strings.cancel,
          submitBtnTxt: submitBtnText(state.searchUsers),
          onSubmit: _onCreate,
          horizontalPadding: _horizontalPadding,
          child: Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: getChildWidget(state),
            ),
          ),
        );
      },
    );
  }

  Widget getChildWidget(ChatPersonListCubitState state) {
    if (state.type == ChatPersonListEnums.LOADING) {
      return CustomCircularProgressIndicator();
    } else if (state.type == ChatPersonListEnums.LOADED) {
      List<ChatUserSelect> searchUsers = state.searchUsers;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          SearchField(
            hint: _strings.searchHint,
            onChanged: (val) => _personListCubit.setSearchValue(val),
          ),
          SizedBox(height: 20),
          hintText(),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: searchUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NewChatPersonContainer(
                      user: searchUsers[index],
                      enabled: searchUsers[index].selected,
                      titleGap: _titleGap,
                      avatarSize: _avatarSize,
                      highlightTxt: state.searchValue,
                      onChanged: (bool val) =>
                          _personListCubit.switchItemStatus(val, index),
                    ),
                    divider(),
                  ],
                );
              },
            ),
          ),
        ],
      );
    } else {
      return Center(child: ErrorLoadingWidget(errorMsg: state.errorMsg));
    }
  }

  Widget hintText() {
    return Text(
      _strings.newChatHint,
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget divider() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          SizedBox(width: _avatarSize + _titleGap),
          Expanded(child: Divider(color: Colors.grey, height: 1.0)),
        ],
      ),
    );
  }

  String submitBtnText(List<ChatUserSelect> items) {
    int count = selectedItems.length;

    if (count == 1) return _strings.writeHint;
    if (count > 1)
      return "${_strings.create} ${_strings.chat.toLowerCase()} ($count)";

    return "";
  }
}
