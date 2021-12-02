import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/debouncer.dart';

class MessageIndicatorCubit extends Cubit<int> {
  final Stream<List<MessageTable>>? newStream;

  Debouncer _debouncer = Debouncer(milliseconds: 300);
  MessageIndicatorCubit(this.newStream) : super(0) {
    if (newStream != null) {
      _streamListener();
    }
  }

  void _streamListener() {
    newStream!.listen((event) {
      _debouncer.run(() {
        if (event.isNotEmpty) {
          int unreadMessages = MessageListView.unreadMessagesByMessages(event);
          emitCounter(unreadMessages);
        } else {
          emitCounter(0);
        }
      });
    });
  }

  emitCounter(int count) {
    emit(count);
  }
}
