import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class MessagesCubit extends Cubit<List<Message>> {
  MessagesCubit() : super([]);

  List<Message> get messages => state;

  void set(List<Message> items) {
    emit(items);
  }

  void removeItem(Message item) {
    emit(List.from(messages)..removeWhere((element) => element.id == item.id));
  }
}
