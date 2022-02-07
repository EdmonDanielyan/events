import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_state.dart';
import 'package:ink_mobile/messenger/blocs/chat_list/search_chat_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/new_chat_btn.dart';

import 'components/body.dart';
import 'components/loading.dart';

class ChatListScreen extends StatefulWidget {
  static ChatListScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<ChatListScreenState>()!;

  final ChatDatabaseCubit chatDatabaseCubit;
  final SearchChatCubit searchChatCubit;
  final SelectableCubit<UserTable> selectableCubit;
  final ChatPersonListCubit chatPersonListCubit;
  const ChatListScreen({
    Key? key,
    required this.searchChatCubit,
    required this.chatDatabaseCubit,
    required this.selectableCubit,
    required this.chatPersonListCubit,
  }) : super(key: key);

  @override
  ChatListScreenState createState() => ChatListScreenState();
}

class ChatListScreenState extends State<ChatListScreen>
    with AutomaticKeepAliveClientMixin {
  ChatDatabaseCubit get chatDatabaseCubit => widget.chatDatabaseCubit;
  SelectableCubit<UserTable> get selectableCubit => widget.selectableCubit;
  SearchChatCubit get chatListCubit => widget.searchChatCubit;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: InkAppBarWithText(
        leading: const SizedBox(),
        title: localizationInstance.messages,
        actions: [const NewChatBtn()],
      ),
      body: BlocBuilder<ChatDatabaseCubit, ChatDatabaseCubitState>(
        bloc: chatDatabaseCubit,
        buildWhen: (previous, current) =>
            previous.loadingChats != current.loadingChats,
        builder: (context, state) {
          if (state.loadingChats) {
            return ChatListLoadingComponent(
              chatDatabaseCubit: chatDatabaseCubit,
              length: chatDatabaseCubit.currentLoadingChatsCounter,
            );
          }
          return const Body();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
