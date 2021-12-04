import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';

@injectable
class UserFunctions {
  final ChatDatabaseCubit chatDatabaseCubit;

  const UserFunctions(this.chatDatabaseCubit);

  UserTable get me => UserTable(
        id: JwtPayload.myId,
        name: JwtPayload.myName,
        avatar: JwtPayload.myAvatar,
        online: false,
      );

  void addMe() {
    insertUser(me);
  }

  Future<int> insertUser(UserTable user) async {
    UserTable? userExists = await chatDatabaseCubit.db.selectUserById(user.id);
    if (userExists == null) {
      return await chatDatabaseCubit.db.insertUser(user);
    } else {
      await chatDatabaseCubit.db.updateUser(userExists.id, user);
    }
    return user.id;
  }

  Future<bool> insertUsers(List<UserTable> users) async {
    for (final user in users) {
      await insertUser(user);
    }
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
      return await chatDatabaseCubit.db.insertParticipant(participant);
    }
    return exists.userId;
  }

  Future<bool> addParticipants(
      List<ParticipantTable> participants, ChatTable chat) async {
    for (final participant in participants) {
      await addParticipant(participant, chat);
    }
    return true;
  }

  Future<int> insertParticipant(ParticipantTable participant) async {
    ParticipantTable? exists =
        await getParticipant(participant.userId, participant.chatId);
    if (exists == null) {
      return await chatDatabaseCubit.db.insertParticipant(participant);
    }
    return exists.userId;
  }

  Future<ParticipantTable?> getParticipant(int userId, String chatId) async {
    return await chatDatabaseCubit.db.selectParticipantById(userId, chatId);
  }

  Future<bool> insertParticipants(List<ParticipantTable> participants) async {
    for (final participant in participants) {
      await insertParticipant(participant);
    }
    return true;
  }

  Future<bool> deleteParticipants(
      List<ParticipantTable> participants, ChatTable chat) async {
    for (final participant in participants) {
      await deleteParticipant(participant.userId, chat.id);
    }
    return true;
  }
}
