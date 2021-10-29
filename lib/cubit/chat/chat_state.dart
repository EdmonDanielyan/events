import 'package:ink_mobile/models/chat/chat_app_bar_enums.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/items_search.dart';

class ChatCubitState {
  int? chatId;
  ChatAppBarEnums appBarEnum;
  int? selectedMessageId;
  ItemsSearch<Message> messagesSearch;

  ChatCubitState({
    this.chatId,
    this.appBarEnum = ChatAppBarEnums.INITIAL,
    this.selectedMessageId,
    required this.messagesSearch,
  });

  ChatCubitState copyWith({
    int? chatId,
    ChatAppBarEnums? appBarEnum,
    int? selectedMessageId,
    ItemsSearch<Message>? messagesSearch,
  }) {
    return ChatCubitState(
      chatId: chatId ?? this.chatId,
      appBarEnum: appBarEnum ?? this.appBarEnum,
      selectedMessageId: selectedMessageId ?? this.selectedMessageId,
      messagesSearch: messagesSearch ?? this.messagesSearch,
    );
  }

  @override
  String toString() {
    return 'ChatCubitState(chat: $chatId, appBarEnum: $appBarEnum, selectedMessageId: $selectedMessageId, messagesSearch: $messagesSearch)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatCubitState &&
        other.chatId == chatId &&
        other.appBarEnum == appBarEnum &&
        other.selectedMessageId == selectedMessageId &&
        other.messagesSearch == messagesSearch;
  }

  @override
  int get hashCode {
    return chatId.hashCode ^
        appBarEnum.hashCode ^
        selectedMessageId.hashCode ^
        messagesSearch.hashCode;
  }
}
