import 'package:ink_mobile/models/chat/chat_app_bar_enums.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/chat/texting.dart';
import 'package:ink_mobile/models/items_search.dart';

class ChatCubitState {
  ChatAppBarEnums appBarEnum;
  String? selectedMessageId;
  MessageWithUser? editMessage;
  ItemsSearch<MessageTable> messagesSearch;
  bool scrollBtn;
  CustomTexting? texting;

  ChatCubitState({
    this.appBarEnum = ChatAppBarEnums.INITIAL,
    this.selectedMessageId,
    required this.messagesSearch,
    this.editMessage,
    this.scrollBtn = false,
    this.texting,
  });

  ChatCubitState copyWith({
    ChatAppBarEnums? appBarEnum,
    String? selectedMessageId,
    ItemsSearch<MessageTable>? messagesSearch,
    MessageWithUser? editMessage,
    bool? scrollBtn,
    CustomTexting? texting,
  }) {
    return ChatCubitState(
      appBarEnum: appBarEnum ?? this.appBarEnum,
      selectedMessageId: selectedMessageId,
      messagesSearch: messagesSearch ?? this.messagesSearch,
      editMessage: editMessage,
      scrollBtn: scrollBtn ?? this.scrollBtn,
      texting: texting ?? this.texting,
    );
  }

  @override
  String toString() {
    return 'ChatCubitState(chat: appBarEnum: $appBarEnum, selectedMessageId: $selectedMessageId, messagesSearch: $messagesSearch, editMessage: $editMessage, scrollBtn: $scrollBtn, texting: $texting)';
  }
}
