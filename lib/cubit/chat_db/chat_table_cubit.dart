import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_state.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';

class ChatDatabaseCubit extends Cubit<ChatDatabaseCubitState> {
  ChatDatabaseCubit() : super(ChatDatabaseCubitState(db: ChatDatabase()));

  void updateSearch(String value) {
    emit(state.copyWith(searchValue: value));
  }

  ChatDatabase get db => state.db;
  String get searchVal => state.searchValue;
}
