import 'package:ink_mobile/models/chat/chat_app_bar_modes.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/texting.dart';
import 'package:ink_mobile/models/items_search.dart';

class ChatCubitState {
  ChatAppBarMode appBarMode;
  String? selectedMessageId;
  ItemsSearch<MessageTable> messagesSearch;
  bool scrollBtn;
  CustomTexting? texting;

  ChatCubitState({
    this.appBarMode = ChatAppBarMode.INITIAL,
    this.selectedMessageId,
    required this.messagesSearch,
    this.scrollBtn = false,
    this.texting,
  });

  ChatCubitState copyWith({
    ChatAppBarMode? appBarEnum,
    String? selectedMessageId,
    ItemsSearch<MessageTable>? messagesSearch,
    bool? scrollBtn,
    CustomTexting? texting,
  }) {
    return ChatCubitState(
      appBarMode: appBarEnum ?? this.appBarMode,
      selectedMessageId: selectedMessageId,
      messagesSearch: messagesSearch ?? this.messagesSearch,
      scrollBtn: scrollBtn ?? this.scrollBtn,
      texting: texting ?? this.texting,
    );
  }

  @override
  String toString() {
    return 'ChatCubitState(chat: appBarEnum: $appBarMode, selectedMessageId: $selectedMessageId, messagesSearch: $messagesSearch, scrollBtn: $scrollBtn, texting: $texting)';
  }
}
