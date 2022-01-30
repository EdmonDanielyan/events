import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/message_list_view.dart';
import 'package:ink_mobile/models/debouncer.dart';

class MessageIndicatorCubit extends Cubit<int> {
  final Stream<List<MessageTable>>? newStream;

  ChatDatabaseCubit chatDatabaseCubit;
  Debouncer _debouncer = Debouncer(milliseconds: 300);
  MessageIndicatorCubit(this.newStream, this.chatDatabaseCubit) : super(0) {
    if (newStream != null) {
      _streamListener();
    }
  }

  Future<List<MessageTable>> _filter(List<MessageTable> messages) async {
    final chats = await chatDatabaseCubit.db.getAllChats();
    Set<String> chatIds = {};

    if (chats.isNotEmpty) {
      for (final chat in chats) chatIds.add(chat.id);
    }
    messages.removeWhere((element) => !chatIds.contains(element.chatId));
    return messages;
  }

  void _streamListener() {
    newStream!.listen((event) {
      _handleStream(event);
    });
  }

  void _handleStream(List<MessageTable> event) {
    _debouncer.run(() async {
      if (chatDatabaseCubit.state.loadingChats) {
        await Future.delayed(const Duration(seconds: 10));
        _handleStream(event);
        return;
      }

      if (event.isNotEmpty) {
        final newMessages = await _filter(event);
        int unreadMessages =
            MessageListView.unreadMessagesByMessages(newMessages);

        emitCounter(unreadMessages);
      } else {
        emitCounter(0);
      }
    });
  }

  emitCounter(int count) {
    emit(count);
  }
}
