import 'package:ink_mobile/models/chat/chat_app_bar_enums.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/items_search.dart';

class ChatCubitState {
  ChatAppBarEnums appBarEnum;
  int? selectedMessageId;
  ItemsSearch<MessageTable> messagesSearch;

  ChatCubitState({
    this.appBarEnum = ChatAppBarEnums.INITIAL,
    this.selectedMessageId,
    required this.messagesSearch,
  });

  ChatCubitState copyWith({
    ChatAppBarEnums? appBarEnum,
    int? selectedMessageId,
    ItemsSearch<MessageTable>? messagesSearch,
  }) {
    return ChatCubitState(
      appBarEnum: appBarEnum ?? this.appBarEnum,
      selectedMessageId: selectedMessageId ?? this.selectedMessageId,
      messagesSearch: messagesSearch ?? this.messagesSearch,
    );
  }

  @override
  String toString() {
    return 'ChatCubitState(chat: appBarEnum: $appBarEnum, selectedMessageId: $selectedMessageId, messagesSearch: $messagesSearch)';
  }
}
