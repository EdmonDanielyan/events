import 'package:injectable/injectable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/chat/sender/chat_saver.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/message_status.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

@injectable
class UserReactionSender {
  final NatsProvider natsProvider;

  final ChatFunctions chatFunctions;

  final ChatSaver chatSaver;

  UserReactionSender(this.natsProvider, this.chatFunctions, this.chatSaver);

  Future<bool> sendReadMessageStatus(String channel, List<MessageTable> messages,
      {int? userId}) async {
    return await natsProvider.sendSystemMessageToChannel(
      channel,
      MessageType.UserReacted,
      ChatMessageStatusFields(
        senderId: userId ?? JwtPayload.myId,
        messages: messages,
      ).toMap(),
    );
  }

  Future<bool> setMessagesToReadNats(List<MessageTable> messages) async {
    String chatId = messages.last.chatId;
    final channel =
    natsProvider.getGroupReactedChannelById(chatId);
    bool send = await sendReadMessageStatus(channel, messages);
    await chatFunctions.messagesToRead(
        messages);
    chatSaver.saveChats(newChat: null);
    return send;
  }
}