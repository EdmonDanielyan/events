import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/components/loader/error_loading_widget.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/new_chat_person_container.dart';
import 'package:ink_mobile/screens/messages/chat_list/entities/new_chat_screen_params.dart';
import 'package:ink_mobile/screens/search/components/search_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewChatScreen extends StatefulWidget {
  final NewChatScreenParams newChatScreenParams;
  final SelectableCubit<UserTable> selectableCubit;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatPersonListCubit chatPersonListCubit;
  const NewChatScreen({
    Key? key,
    required this.newChatScreenParams,
    required this.chatDatabaseCubit,
    required this.selectableCubit,
    required this.chatPersonListCubit,
  }) : super(key: key);

  @override
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  double _avatarSize = 35.0;
  double _titleGap = 15.0;
  double _horizontalPadding = 20.0;
  late AppLocalizations _strings;
  ChatPersonListCubit get chatPersonListCubit => widget.chatPersonListCubit;
  SelectableCubit<UserTable> get selectableCubit => widget.selectableCubit;
  NewChatScreenParams get newChatScreenParams => widget.newChatScreenParams;

  @override
  void dispose() {
    chatPersonListCubit.hideIds = [];
    selectableCubit.clearAll();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    chatPersonListCubit.hideIds = newChatScreenParams.hideIds;

    chatPersonListCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return BlocBuilder<ChatPersonListCubit, ChatPersonListCubitState>(
      bloc: chatPersonListCubit,
      builder: (BuildContext context, personCubitState) {
        return BlocBuilder(
          bloc: selectableCubit,
          builder: (context, selectableState) {
            return CustomBottomSheetChild(
              constraints: BoxConstraints(
                minHeight: 250.0,
                maxHeight: MediaQuery.of(context).size.height * 0.9,
              ),
              title: newChatScreenParams.title,
              cancelBtnTxt: _strings.cancel,
              submitBtnTxt: submitBtnText(personCubitState.searchUsers),
              onSubmit: () {
                if (newChatScreenParams.onSubmit != null) {
                  newChatScreenParams.onSubmit!(context);
                }
              },
              horizontalPadding: _horizontalPadding,
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      SearchField(
                        hint: _strings.searchHint,
                        onChanged: (val) {
                          if (val.length >= 3) {
                            chatPersonListCubit.setSearchValue(val);
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      Expanded(child: getChildWidget(personCubitState)),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget getChildWidget(ChatPersonListCubitState state) {
    if (state.type == ChatPersonListEnums.LOADING) {
      return CustomCircularProgressIndicator();
    } else if (state.type == ChatPersonListEnums.LOADED) {
      List<UserTable> searchUsers = state.searchUsers;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      enabled: selectableCubit.isItemExists(searchUsers[index]),
                      titleGap: _titleGap,
                      avatarSize: _avatarSize,
                      highlightTxt: state.searchValue,
                      onChanged: (bool val) =>
                          selectableCubit.addOrRemove(searchUsers[index]),
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
    if (newChatScreenParams.description.isNotEmpty) {
      return Text(
        newChatScreenParams.description,
        style: TextStyle(color: Colors.grey),
      );
    }

    return SizedBox();
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

  String submitBtnText(List<UserTable> items) {
    int count = selectableCubit.getItems.length;

    if (count == 1) return newChatScreenParams.chosenOneText;
    if (count > 1) return "${newChatScreenParams.chosenMultipleText} ($count)";

    return "";
  }
}
