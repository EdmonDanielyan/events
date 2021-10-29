import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
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

    sendMessageFromAdminToIbra();
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
      _hideSystemMsgs(message, () {
        print(channel);
        print(message);
        print(natsProvider.publicChannels);
        print(natsProvider.userChannels);
      });
    };
  }

  void _hideSystemMsgs(NatsMessage msg, void Function() callback) {
    if (msg.type != MessageType.system) {
      callback();
    }
  }

  void sendTxtMessage(String channel, String txt) {
    natsProvider.sendTextMessageToChannel(channel, txt);
  }

  void sendSystemMsg(
      String channel, SystemMessageType type, Map<String, String> fields) {
    natsProvider.sendSystemMessageToChannel(channel, type, fields);
  }

  /* 
  TODO DEBUGGING 
  */
  void sendMessageFromAdminToIbra() async {
    if (JwtPayload.myId == 1) {
      sendSystemMsg(
        "ink.messaging.public.RequestToJoinChat.22790",
        SystemMessageType.RequestToJoinChat,
        {
          "avatar": "avatar_link",
          "name": "My name",
        },
      );
      //sendTxtMessage(USER_MAIN_CHANNEL + "22790", "Сообщение от админа");
    } else {
      sendTxtMessage(USER_MAIN_CHANNEL + "1", "Сообщение от Ибрагима");
    }
  }
}
