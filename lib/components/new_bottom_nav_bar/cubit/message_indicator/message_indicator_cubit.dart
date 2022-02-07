import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/message_list_view.dart';

class MessageIndicatorCubit extends Cubit<int> {
  final Stream<List<MessageTable>>? newStream;

  ChatDatabaseCubit chatDatabaseCubit;
  MessageIndicatorCubit(this.newStream, this.chatDatabaseCubit) : super(0) {
    if (newStream != null) {
      newStream!.listen((event) {
        _handleStream(event);
      });
    }
  }

  Future<void> _handleStream(List<MessageTable> event) async {
    if (event.isNotEmpty) {
      final newMessages = await _filter(event);
      int unreadMessages =
          MessageListView.unreadMessagesByMessages(newMessages);

      if (!chatDatabaseCubit.state.loadingChats) {
        emitCounter(unreadMessages);
      } else {
        await Future.delayed(const Duration(seconds: 2));
        _handleStream(event);
      }
    } else {
      emitCounter(0);
    }
  }

  Future<List<MessageTable>> _filter(List<MessageTable> messages) async {
    final chats = await chatDatabaseCubit.db.getAllChats();
    Set<String> disabledChats = {};

    if (chats.isNotEmpty) {
      for (final chat in chats)
        if (!(chat.unreadCounterOn ?? true)) disabledChats.add(chat.id);
    }
    messages.removeWhere((element) => disabledChats.contains(element.chatId));
    return messages;
  }

  emitCounter(int count) {
    emit(count);
  }
}
