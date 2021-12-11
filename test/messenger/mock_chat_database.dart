import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/chat/database/model/participant_with_user.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/moor.dart';

class _FakeMigrationStrategy_0 extends Fake
    implements MigrationStrategy {}

class MockChatDatabase extends Mock implements ChatDatabase {
  MockChatDatabase() {
    throwOnMissingStub(this);
  }

  @override
  int get schemaVersion =>
      (super.noSuchMethod(Invocation.getter(#schemaVersion), returnValue: 0)
      as int);
  @override
  MigrationStrategy get migration =>
      (super.noSuchMethod(Invocation.getter(#migration),
          returnValue: _FakeMigrationStrategy_0()) as MigrationStrategy);
  @override
  Future<ChatTable?> selectChatById(String? chatId) =>
      (super.noSuchMethod(Invocation.method(#selectChatById, [chatId]),
          returnValue: Future<ChatTable?>.value()));
  @override
  Future<List<ChatTable>> getAllChats() =>
      (super.noSuchMethod(Invocation.method(#getAllChats, []),
          returnValue: Future<List<ChatTable>>.value([])));
  @override
  Stream<List<ChatTable>> searchChats(String? query) => (super.noSuchMethod(
      Invocation.method(#searchChats, [query]),
      returnValue: Stream<List<ChatTable>>.empty()));
  @override
  Stream<List<ChatTable>> watchAllChats() => (super.noSuchMethod(
      Invocation.method(#watchAllChats, []),
      returnValue: Stream<List<ChatTable>>.empty()));
  @override
  Stream<ChatTable> watchChatById(String? id) =>
      (super.noSuchMethod(Invocation.method(#watchChatById, [id]),
          returnValue: Stream<ChatTable>.empty()));
  @override
  Future<int> insertChat(dynamic chat) =>
      (super.noSuchMethod(Invocation.method(#insertChat, [chat]),
          returnValue: Future<int>.value(0)));
  @override
  Future<dynamic> updateChatById(String? id, dynamic chat) =>
      (super.noSuchMethod(Invocation.method(#updateChatById, [id, chat]),
          returnValue: Future<dynamic>.value()));
  @override
  Future<dynamic> deleteChat(dynamic chat) =>
      (super.noSuchMethod(Invocation.method(#deleteChat, [chat]),
          returnValue: Future<dynamic>.value()));
  @override
  Future<dynamic> deleteChatById(String? id) =>
      (super.noSuchMethod(Invocation.method(#deleteChatById, [id]),
          returnValue: Future<dynamic>.value()));
  @override
  Stream<List<MessageTable>> watchAllMessages() => (super.noSuchMethod(
      Invocation.method(#watchAllMessages, []),
      returnValue: Stream<List<MessageTable>>.empty()));
  @override
  Future<List<MessageTable>> getAllMessages() =>
      (super.noSuchMethod(Invocation.method(#getAllMessages, []),
          returnValue: Future<List<MessageTable>>.value(<MessageTable>[])));
  @override
  Future<MessageTable?> selectMessageById(String? id) =>
      (super.noSuchMethod(Invocation.method(#selectMessageById, [id]),
          returnValue: Future<MessageTable?>.value()));
  @override
  Future<int> updateMessageById(String? id, dynamic message) =>
      (super.noSuchMethod(Invocation.method(#updateMessageById, [id, message]),
          returnValue: Future<int>.value(0)) as Future<int>);
  @override
  Future<int> insertMessage(dynamic messageTable) =>
      (super.noSuchMethod(Invocation.method(#insertMessage, [messageTable]),
          returnValue: Future<int>.value(0)) as Future<int>);
  @override
  Future<MessageTable?> searchMessageByText(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMessageByText, [query]),
          returnValue: Future<MessageTable?>.value()) as Future<MessageTable?>);
  @override
  Future<List<MessageTable>> getUnsentMessages(int? userId) =>
      (super.noSuchMethod(Invocation.method(#getUnsentMessages, [userId]),
          returnValue: Future<List<MessageTable>>.value(<MessageTable>[]))
      as Future<List<MessageTable>>);
  @override
  Stream<List<MessageWithUser>> watchChatMessages(String? chatId) =>
      (super.noSuchMethod(Invocation.method(#watchChatMessages, [chatId]),
          returnValue: Stream<List<MessageWithUser>>.empty())
      as Stream<List<MessageWithUser>>);
  @override
  Stream<List<MessageWithUser>> watchChatFilesMessages(
      String? chatId) =>
      (super.noSuchMethod(Invocation.method(#watchChatFilesMessages, [chatId]),
          returnValue: Stream<List<MessageWithUser>>.empty())
      as Stream<List<MessageWithUser>>);
  @override
  Future<List<MessageWithUser>> getChatMessages(String? chatId) =>
      (super.noSuchMethod(Invocation.method(#getChatMessages, [chatId]),
          returnValue: Future<List<MessageWithUser>>.value(
              <MessageWithUser>[]))
      as Future<List<MessageWithUser>>);
  @override
  Future<dynamic> deleteMessagesByChatId(String? chatId) =>
      (super.noSuchMethod(Invocation.method(#deleteMessagesByChatId, [chatId]),
          returnValue: Future<dynamic>.value()) as Future<dynamic>);
  @override
  Future<dynamic> deleteMessageById(String? id) =>
      (super.noSuchMethod(Invocation.method(#deleteMessageById, [id]),
          returnValue: Future<dynamic>.value()) as Future<dynamic>);
  @override
  Future<List<UserTable>> getAllUsers() =>
      (super.noSuchMethod(Invocation.method(#getAllUsers, []),
          returnValue: Future<List<dynamic>>.value(<UserTable>[]))
      as Future<List<UserTable>>);
  @override
  Future<int> insertUser(dynamic user) =>
      (super.noSuchMethod(Invocation.method(#insertUser, [user]),
          returnValue: Future<int>.value(0)) as Future<int>);
  @override
  Future<int> updateUser(int? id, dynamic user) =>
      (super.noSuchMethod(Invocation.method(#updateUser, [id, user]),
          returnValue: Future<int>.value(0)) as Future<int>);
  @override
  Future<UserTable?> selectUserById(int? id) =>
      (super.noSuchMethod(Invocation.method(#selectUserById, [id]),
          returnValue: Future<UserTable?>.value()) as Future<UserTable?>);
  @override
  Stream<UserTable?> watchUser(int? userId) =>
      (super.noSuchMethod(Invocation.method(#watchUser, [userId]),
          returnValue: Stream<UserTable?>.empty()) as Stream<UserTable?>);
  @override
  Future<List<ChannelTable>> getAllChannels() =>
      (super.noSuchMethod(Invocation.method(#getAllChannels, []),
          returnValue: Future<List<ChannelTable>>.value(<ChannelTable>[]))
      as Future<List<ChannelTable>>);
  @override
  Future<ChannelTable?> getChannelByChannelName(String? channelName) => (super
      .noSuchMethod(Invocation.method(#getChannelByChannelName, [channelName]),
      returnValue: Future<ChannelTable?>.value()) as Future<ChannelTable?>);
  @override
  Future<int> insertChannel(dynamic channel) =>
      (super.noSuchMethod(Invocation.method(#insertChannel, [channel]),
          returnValue: Future<int>.value(0)) as Future<int>);
  @override
  Future<int> updateChannelByChannelName(
      String? channelName, dynamic channel) =>
      (super.noSuchMethod(
          Invocation.method(
              #updateChannelByChannelName, [channelName, channel]),
          returnValue: Future<int>.value(0)) as Future<int>);
  @override
  Future<dynamic> deleteChannelByChannelName(String? channelName) =>
      (super.noSuchMethod(
          Invocation.method(#deleteChannelByChannelName, [channelName]),
          returnValue: Future<dynamic>.value()) as Future<dynamic>);
  @override
  Future<List<ParticipantTable>> getAllParticipants() =>
      (super.noSuchMethod(Invocation.method(#getAllParticipants, []),
          returnValue: Future<List<ParticipantTable>>.value(<ParticipantTable>[]))
      as Future<List<ParticipantTable>>);
  @override
  Future<int> insertParticipant(dynamic participant) =>
      (super.noSuchMethod(Invocation.method(#insertParticipant, [participant]),
          returnValue: Future<int>.value(0)) as Future<int>);
  @override
  Future<dynamic> deleteParticipant(int? userId, String? chatId) => (super
      .noSuchMethod(Invocation.method(#deleteParticipant, [userId, chatId]),
      returnValue: Future<dynamic>.value()) as Future<dynamic>);
  @override
  Future<ParticipantTable?> selectParticipantById(int? id, String? chatId) => (super
      .noSuchMethod(Invocation.method(#selectParticipantById, [id, chatId]),
      returnValue: Future<ParticipantTable?>.value()) as Future<ParticipantTable?>);
  @override
  Stream<List<ParticipantWithUser>> watchParticipants(String? chatId) =>
      (super.noSuchMethod(Invocation.method(#watchParticipants, [chatId]),
          returnValue: Stream<List<ParticipantWithUser>>.empty())
      as Stream<List<ParticipantWithUser>>);
  @override
  Future<void> deleteEverything() =>
      (super.noSuchMethod(Invocation.method(#deleteEverything, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as Future<void>);
  @override
  String toString() => super.toString();
}