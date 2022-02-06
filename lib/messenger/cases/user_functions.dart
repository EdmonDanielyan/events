import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/jwt_payload.dart';

@injectable
class UserFunctions {
  final ChatDatabaseCubit chatDatabaseCubit;

  const UserFunctions(this.chatDatabaseCubit);

  UserTable get me => UserTable(
        id: JwtPayload.myId,
        name: JwtPayload.myName,
        avatar: JwtPayload.myAvatar,
      );

  Future<void> addMe() async {
    await insertUser(me);
  }

  Future<int> insertUser(UserTable user, {bool update = true}) async {
    UserTable? userExists = await chatDatabaseCubit.db.selectUserById(user.id);
    if (userExists == null) {
      return await chatDatabaseCubit.db.insertUserOrUpdate(user);
    } else if (update) {
      await chatDatabaseCubit.db.updateUser(userExists.id, user);
    }
    return user.id;
  }

  Future<bool> insertUsersOneByOne(List<UserTable> users) async {
    for (final user in users) {
      await insertUser(user);
    }
    return true;
  }

  Future<bool> insertMultipleUsers(List<UserTable> users) async {
    await chatDatabaseCubit.db.insertMultipleUsers(users);
    return true;
  }

  Future<bool> deleteParticipant(int userId, String chatId) async {
    await chatDatabaseCubit.db.deleteParticipant(userId, chatId);
    return true;
  }

  Future<int> addParticipant(
      ParticipantTable participant, ChatTable chat) async {
    ParticipantTable? exists =
        await getParticipant(participant.userId, chat.id);
    if (exists == null) {
      return await chatDatabaseCubit.db.insertParticipantOrUpdate(participant);
    }
    return exists.userId;
  }

  Future<int> insertParticipant(ParticipantTable participant) async {
    ParticipantTable? exists =
        await getParticipant(participant.userId, participant.chatId);
    if (exists == null) {
      return await chatDatabaseCubit.db.insertParticipantOrUpdate(participant);
    }
    return exists.userId;
  }

  Future<ParticipantTable?> getParticipant(int userId, String chatId) async {
    return await chatDatabaseCubit.db.selectParticipantById(userId, chatId);
  }

  Future<bool> insertMultipleParticipants(
      List<ParticipantTable> participants) async {
    await chatDatabaseCubit.db.insertMultipleParticipants(participants);

    return true;
  }

  Future<bool> deleteParticipants(
      List<ParticipantTable> participants, ChatTable chat) async {
    await chatDatabaseCubit.db.deleteParticipants(
        participants.map((e) => e.userId).toList(), chat.id);
    return true;
  }
}
