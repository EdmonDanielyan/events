import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

class MessageProvider {
  final ChatDatabaseCubit chatDatabaseCubit;
  final NatsProvider natsProvider;

  MessageProvider(this.natsProvider, this.chatDatabaseCubit);

  late ChatFunctions chatFunctions;
  late ChatCreation chatCreation;

  void init() async {
    _initChatClasses();
    _addMeToDatabase();

    _onMessage();

    //sendMessageFromAdminToIbra();
  }

  void _initChatClasses() {
    chatCreation = ChatCreation(chatDatabaseCubit);
    chatFunctions = ChatFunctions(chatDatabaseCubit);
  }

  void _addMeToDatabase() {
    chatCreation.addUser(JwtPayload.myId, "Ibra", "Chekaev");
  }

  void _onMessage() async {
    natsProvider.onMessage = (channel, message) async {
      print(channel);
      print(message);
    };
  }

  void sendTxtMessage(String channel, String txt) {
    natsProvider.sendTextMessageToChannel(channel, txt);
  }

  /* 
  TODO DEBUGGING 
  */
  void sendMessageFromAdminToIbra() async {
    if (JwtPayload.myId == 1) {
      sendTxtMessage(PUBLIC_CHATS + "22790", "Сообщение от админа");
    } else {
      sendTxtMessage(PUBLIC_CHATS + "1", "Сообщение от Ибрагима");
    }
  }
}
