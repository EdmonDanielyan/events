import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/loader/error_loading_widget.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_state.dart';
import 'package:ink_mobile/messenger/blocs/chat_list/search_chat_cubit.dart';
import 'package:ink_mobile/messenger/extensions/chat_table.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/screens/chat_list/chat_list_screen.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/build_items.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/search_bar.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/jwt_payload.dart';

import '../../../../setup.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _contentPadding = EdgeInsets.symmetric(horizontal: 10);
  late ChatDatabaseCubit _chatDatabaseCubit;
  late SearchChatCubit _chatListCubit;
  final TextEditingController _searchController = TextEditingController();
  final Messenger messenger = sl<Messenger>();
  int _chatsLoaded = 0;

  Future<bool> _deleteChat(ChatTable chat, BuildContext context) async {
    bool removed = false;
    if (messenger.isConnected) {
      if (chat.isGroup()) {
        messenger.chatFunctions.deleteAllChatMessages(chat.id);
        messenger.chatFunctions.deleteChat(chat.id);
        messenger.chatEventsSender.sendLeftMessage(
          chat,
          initiatorId: JwtPayload.myId,
        );
      } else {
        messenger.chatFunctions.clearSingleChat(chat);
      }

      removed = true;
    }

    return removed;
  }

  Debouncer _streamDebouncer = Debouncer(milliseconds: 300);

  void _handleStream(List<ChatTable> data, EventSink<List<ChatTable>> sink) {
    _chatsLoaded++;
    if (_chatsLoaded < 2) {
      sink.add(data);
    } else {
      _streamDebouncer.run(() {
        sink.add(data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _chatDatabaseCubit = ChatListScreen.of(context).chatDatabaseCubit;
    _chatListCubit = ChatListScreen.of(context).chatListCubit;

    return Column(
      children: [
        const SizedBox(height: 5.0),
        SearchBar(
          controller: _searchController,
          contentPadding: _contentPadding,
          onChanged: (val) => _chatListCubit.setSearchValue(val,
              chatDatabaseCubit: _chatDatabaseCubit),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12.0),
                BlocBuilder<ChatDatabaseCubit, ChatDatabaseCubitState>(
                  bloc: _chatDatabaseCubit,
                  builder: (_context, state) {
                    return StreamBuilder(
                      stream: state.db.watchAllChats(handleData: _handleStream),
                      builder:
                          (context, AsyncSnapshot<List<ChatTable>> snapshot) {
                        if (snapshot.hasData) {
                          final items = snapshot.data ?? [];
                          if (items.isNotEmpty) {
                            _chatListCubit.emitChats(items,
                                messenger: messenger);

                            return BuildChatItems(
                              chatDatabaseCubit: _chatDatabaseCubit,
                              searchChatCubit: _chatListCubit,
                              contentPadding: _contentPadding,
                              deleteChat: _deleteChat,
                              searchController: _searchController,
                            );
                          } else {
                            return Center(
                              child: ErrorLoadingWidget(
                                  errorMsg: localizationInstance.noMessages),
                            );
                          }
                        }

                        return const SizedBox();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
