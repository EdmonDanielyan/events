import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/chat_app_bar_modes.dart';
import 'package:ink_mobile/messenger/models/texting.dart';
import 'package:ink_mobile/models/items_search.dart';

class ChatCubitState {
  ChatAppBarMode appBarMode;
  String? selectedMessageId;
  MessageWithUser? editMessage;
  ItemsSearch<MessageTable> messagesSearch;
  bool scrollBtn;
  CustomTexting? texting;

  ChatCubitState({
    this.appBarMode = ChatAppBarMode.INITIAL,
    this.selectedMessageId,
    required this.messagesSearch,
    this.editMessage,
    this.scrollBtn = false,
    this.texting,
  });

  ChatCubitState copyWith({
    ChatAppBarMode? appBarEnum,
    String? selectedMessageId,
    ItemsSearch<MessageTable>? messagesSearch,
    MessageWithUser? editMessage,
    bool? scrollBtn,
    CustomTexting? texting,
  }) {
    return ChatCubitState(
      appBarMode: appBarEnum ?? this.appBarMode,
      selectedMessageId: this.selectedMessageId,
      messagesSearch: messagesSearch ?? this.messagesSearch,
      editMessage: this.editMessage,
      scrollBtn: scrollBtn ?? this.scrollBtn,
      texting: texting ?? this.texting,
    );
  }

  ChatCubitState copyNull({
    ChatAppBarMode? appBarEnum,
    String? selectedMessageId,
    ItemsSearch<MessageTable>? messagesSearch,
    MessageWithUser? editMessage,
    bool? scrollBtn,
    CustomTexting? texting,
  }) {
    return ChatCubitState(
      appBarMode: appBarEnum ?? this.appBarMode,
      selectedMessageId: selectedMessageId,
      messagesSearch: messagesSearch ?? this.messagesSearch,
      editMessage: editMessage,
      scrollBtn: scrollBtn ?? this.scrollBtn,
      texting: texting ?? this.texting,
    );
  }

  @override
  String toString() {
    return 'ChatCubitState(chat: appBarEnum: $appBarMode, selectedMessageId: $selectedMessageId, messagesSearch: $messagesSearch, editMessage: $editMessage, scrollBtn: $scrollBtn, texting: $texting)';
  }
}