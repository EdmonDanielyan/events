import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_enums.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/items_search.dart';

class ChatCubitState {
  Chat chat;
  ChatAppBarEnums appBarEnum;
  int? selectedMessageId;
  ItemsSearch<Message> messagesSearch;

  ChatCubitState({
    required this.chat,
    this.appBarEnum = ChatAppBarEnums.INITIAL,
    required this.messagesSearch,
    this.selectedMessageId,
  });

  ChatCubitState copyWith({
    Chat? chat,
    ChatAppBarEnums? appBarEnum,
    int? selectedMessageId,
    ItemsSearch<Message>? messagesSearch,
  }) {
    return ChatCubitState(
      chat: chat ?? this.chat,
      appBarEnum: appBarEnum ?? this.appBarEnum,
      selectedMessageId: selectedMessageId,
      messagesSearch: messagesSearch ?? this.messagesSearch,
    );
  }
}
