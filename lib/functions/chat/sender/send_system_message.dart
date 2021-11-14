import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/invitation.dart';
import 'package:ink_mobile/models/chat/nats/message.dart';
import 'package:ink_mobile/models/chat/nats/message_delete.dart';
import 'package:ink_mobile/models/chat/nats/message_status.dart';
import 'package:ink_mobile/models/chat/nats/texting.dart';
import 'package:ink_mobile/models/chat/texting.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

class ChatSendMessage {
  final NatsProvider natsProvider;

  const ChatSendMessage(this.natsProvider);

  Future<void> saveToPrivateUserChatIdList({
    required int userId,
    required String channel,
    required ChatTable chat,
    bool public = false,
  }) async {
    // await natsProvider.sendSystemMessageToChannel(
    //   natsProvider.getPrivateUserChatIdList(userId.toString()),
    //   MessageType.ChatList,
    //   {
    //     chat.id: "",
    //     "channel": channel,
    //     "chat": chat.toJsonString(),
    //   },
    // );
  }

  Future<void> removeFromPrivateUserChatIdList({
    required int userId,
    required String channel,
    required ChatTable chat,
    bool public = false,
  }) async {
    await natsProvider.sendSystemMessageToChannel(
      natsProvider.getPrivateUserChatIdList(userId.toString()),
      MessageType.ChatList,
      {
        chat.id: DELETE_ACTION,
        "channel": channel,
        "chat": chat.toJsonString(),
      },
    );
  }

  Future<void> inviteUser({
    required UserTable user,
    required ChatTable chat,
    required List<UserTable> users,
    required String chatChannel,
  }) async {
    await natsProvider.sendSystemMessageToChannel(
      natsProvider.getInviteUserToJoinChatChannel(user.id),
      MessageType.InviteUserToJoinChat,
      ChatInvitationFields(
        channel: chatChannel,
        chat: chat,
        users: users,
      ).toMap(),
    );
  }

  Future<bool> sendTextMessage(String channel, ChatTable chat,
      MessageTable message, UserTable user) async {
    return await natsProvider.sendSystemMessageToChannel(
      channel,
      MessageType.Text,
      ChatMessageFields(
        channel: channel,
        chat: chat,
        message: message,
        user: user,
      ).toMap(),
    );
  }

  Future<bool> sendMessageStatus(String channel, List<MessageTable> messages,
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

  Future<bool> sendTextingMessage(
    String channel, {
    required CustomTexting customTexting,
    required String chatId,
  }) async {
    return await natsProvider.sendSystemMessageToChannel(
      channel,
      MessageType.Texting,
      ChatTextingFields(
        texting: customTexting,
        chatId: chatId,
      ).toMap(),
    );
  }

  Future<bool> sendUserJoinedMessage(
    String channel, {
    required ChatTable chat,
    required List<UserTable> users,
  }) async {
    return await natsProvider.sendSystemMessageToChannel(
      channel,
      MessageType.UserJoined,
      ChatInvitationFields(
        channel: channel,
        users: users,
        chat: chat,
      ).toMap(),
    );
  }

  Future<bool> sendUserLeftMessage(
    String channel, {
    required ChatTable chat,
    required List<UserTable> users,
  }) async {
    return await natsProvider.sendSystemMessageToChannel(
      channel,
      MessageType.UserLeftChat,
      ChatInvitationFields(
        channel: channel,
        users: users,
        chat: chat,
      ).toMap(),
    );
  }

  Future<bool> sendDeleteMessage(
    String channel, {
    required List<MessageTable> messages,
    UserTable? user,
  }) async {
    return await natsProvider.sendSystemMessageToChannel(
      channel,
      MessageType.RemoveMessage,
      ChatMessageDeleteFields(
        messages: messages,
        user: user ?? UserFunctions.getMe,
      ).toMap(),
    );
  }
}
