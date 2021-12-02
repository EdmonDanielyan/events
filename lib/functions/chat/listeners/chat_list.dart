import 'dart:async';

// ignore: implementation_imports
import 'package:dart_nats_streaming/src/data_message.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/channel.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/chat_list.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../chat_creation.dart';
import 'all.dart';

@injectable
class ChatListListener {
  final NatsProvider natsProvider;
  final ChatDatabaseCubit chatDatabaseCubit;
  final UserFunctions userFunctions;
  final ChannelFunctions channelFunctions;
  ChatListListener({
    required this.natsProvider,
    required this.chatDatabaseCubit,
    required this.userFunctions,
    required this.channelFunctions,
  });

  NatsListener? get natsListener =>
      UseMessageProvider.messageProvider!.natsListener;

  static Set<String> busyChannels = {};
  Set<String> _getChatIds = {};

  Future<void> listenTo(UserTable user) async {
    try {
      final channel = natsProvider.getPrivateUserChatIdList(user.id.toString());
      final sub = await natsProvider.listenChatList(channel);
      if (sub != null) {
        DataMessage? dataMessage;
        dataMessage = await sub.stream.first
            .timeout(Duration(seconds: 3))
            .catchError((_err) {
          dataMessage = null;
        });

        if (dataMessage != null) {
          natsProvider.acknowledge(sub, dataMessage!);
          NatsMessage message = natsProvider.parseMessage(dataMessage);
          await onMessage(message);

          sub.subscription.close();
        }
      }
    } on SubscriptionAlreadyExistException {
    } catch (_e) {
      return;
    }
  }

  Future<void> onMessage(NatsMessage message) async {
    final mapPayload = message.payload! as SystemPayload;
    try {
      ChatListFields fields = ChatListFields.fromMap(mapPayload.fields);

      var chats = fields.chats;
      final users = fields.users;
      final participants = fields.participants;
      final messages = fields.messages;
      final channels = fields.channels;

      //THIS ORDER IS ESSENTIAL (DO NOT CHANGE)
      await _insertUsers(users);
      if (chats.length > 0) {
        await _insertChats(chats, messages);
      }
      await _insertParticipants(participants, chats);
      await _insertChannels(channels);

      await UseMessageProvider.messageProvider?.chatSaver.saveChats(newChat: null);
    } on NoConnectionException {
      return;
    } on NoSuchMethodError {
      return;
    } catch (_e, stack) {
      print("ERROR");
      print(_e.toString());
      print(stack.toString());
    }
  }

  Future<void> _insertChats(
      List<ChatTable> chats, List<MessageTable> messages) async {
    final distinctChats = chats.toSet().toList();

    final storedChats = await chatDatabaseCubit.db.getAllChats();

    for (final chat in distinctChats) {
      _getChatIds.add(chat.id);
      bool insert = _chatExistsInStoredChannels(chat, storedChats);

      if (insert) {
        await ChatCreation(chatDatabaseCubit).insertChat(chat);
      }
      await _insertMessages(chat, messages);
    }
  }

  bool _chatExistsInStoredChannels(
      ChatTable chat, List<ChatTable> storedChats) {
    for (final storedChat in storedChats) {
      if (storedChat.id == chat.id) return false;
    }

    return true;
  }

  Future<void> _insertUsers(List<UserTable> users) async {
    await userFunctions.insertUsers(users);
  }

  Future<void> _insertParticipants(
      List<ParticipantTable> participants, List<ChatTable> chats) async {
    var distinctParticipants = _getParticipantThatAreInChats(
      participants,
      chats,
    );
    await userFunctions.insertParticipants(distinctParticipants);
  }

  List<ParticipantTable> _getParticipantThatAreInChats(
      List<ParticipantTable> participants, List<ChatTable> chats) {
    var distinctParticipants = participants.toSet().toList();

    distinctParticipants.removeWhere((element) {
      bool _notInChat = true;
      for (final chat in chats) {
        if (chat.id == element.chatId) {
          _notInChat = false;
        }
      }

      return _notInChat;
    });

    return distinctParticipants;
  }

  Future<void> _insertMessages(
      ChatTable chat, List<MessageTable> messages) async {
    if (messages.isNotEmpty) {
      final distinctMessages = messages.toSet().toList();
      List<MessageTable> insertMessages = distinctMessages
          .where((element) => element.chatId == chat.id)
          .toList();

      if (insertMessages.isNotEmpty) {
        try {
          await SendMessage(chat: chat, chatDatabaseCubit: chatDatabaseCubit)
              .addMessagesIfNotExists(insertMessages);
        } catch (e) {
          print("ERROR ${e.toString()}");
        }
      }
    }
  }

  Future<void> _insertChannels(List<ChannelTable> channels) async {
    if (channels.isNotEmpty) {
      final distinctChannels = _channelFilter(channels);
      _setBusyChannels(distinctChannels);
      for (final channel in distinctChannels) {
        await channelFunctions.insertOrUpdate(channel);
      }

      if (natsProvider.isConnected && natsListener != null) {
        await natsListener!.listenToMyStoredChannels();
      } else {
        throw NoConnectionException(message: "Disconnected");
      }
    }
  }

  List<ChannelTable> _channelFilter(List<ChannelTable> channels) {
    var newChannels = channels.toSet().toList();
    newChannels = _clearFromOtherInviteUserChannels(newChannels);
    newChannels = _clearFromNotExistingChats(newChannels);

    return newChannels;
  }

  List<ChannelTable> _clearFromOtherInviteUserChannels(
      List<ChannelTable> channels) {
    channels = channels
      ..removeWhere(
        (element) {
          bool inviteUserChannel =
              ChannelListView.isChannelInviteUser(element.to);
          if (natsListener != null &&
              inviteUserChannel &&
              element.to != natsListener!.inviteUserChannel) {
            return true;
          }

          return false;
        },
      );

    return channels;
  }

  List<ChannelTable> _clearFromNotExistingChats(List<ChannelTable> channels) {
    channels = channels
      ..removeWhere((element) {
        bool delete = false;
        final thisChannel = element.to.toLowerCase();
        bool isChatChannel = thisChannel.contains(GROUP_CHANNEL);
        if (isChatChannel) {
          delete = true;
          _getChatIds.forEach((element) {
            if (thisChannel.contains(element.toLowerCase())) {
              delete = false;
            }
          });
          return delete;
        }

        return delete;
      });

    return channels;
  }

  void _setBusyChannels(List<ChannelTable> channels) {
    for (final channel in channels) {
      busyChannels.add(channel.to);
    }
  }
}
