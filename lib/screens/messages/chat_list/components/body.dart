import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/loader/error_loading_widget.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_state.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/providers/messenger.dart';
import 'package:ink_mobile/screens/messages/chat_list/chat_list_screen.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/build_items.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/search_bar.dart';

import '../../../../setup.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _contentPadding = EdgeInsets.symmetric(horizontal: 10);
  late ChatDatabaseCubit _chatDatabaseCubit;
  late ChatListCubit _chatListCubit;
  final TextEditingController _searchController = TextEditingController();
  final Messenger messenger = sl<Messenger>();
  final Debouncer _debouncer = Debouncer(milliseconds: 3000);

  Future<bool> _deleteChat(ChatTable chat, BuildContext context) async {
    bool removed = false;
    if (messenger.isConnected) {
      messenger.chatFunctions.deleteAllChatMessages(chat.id);
      messenger.chatFunctions.deleteChat(chat.id);
      messenger.chatEventsSender.sendLeftMessage(chat);

      removed = true;
    }

    return removed;
  }

  Widget? _buildChats;

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
          onChanged: (val) => _chatListCubit.setSearchValue(val),
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
                      stream: state.db.watchAllChats(),
                      builder:
                          (context, AsyncSnapshot<List<ChatTable>> snapshot) {
                        if (snapshot.hasData) {
                          final items = snapshot.data ?? [];
                          if (items.isNotEmpty) {
                            _chatListCubit.emitChats(items);

                            _debouncer.run(() {
                              _buildChats = _chatsBuilder();
                            });

                            if (_buildChats == null) {
                              _buildChats = _chatsBuilder();
                            }

                            return _buildChats!;
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

  Widget _chatsBuilder() {
    return BuildChatItems(
      chatDatabaseCubit: _chatDatabaseCubit,
      chatListCubit: _chatListCubit,
      contentPadding: _contentPadding,
      deleteChat: _deleteChat,
      searchController: _searchController,
    );
  }
}
