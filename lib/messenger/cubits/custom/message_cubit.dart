import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class MessageCubit extends Cubit<Message?> {
  MessageCubit() : super(null);

  Message? get message => state;

  void set(Message? item) {
    emit(item);
  }
}
