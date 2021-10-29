import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';

class UserFunctions {
  final ChatDatabaseCubit chatDatabaseCubit;

  const UserFunctions(this.chatDatabaseCubit);

  void addMe() {
    addUser(JwtPayload.myId, JwtPayload.myName, JwtPayload.myAvatar);
  }

  void addUser(int id, String name, String avatar) {
    insertUser(UserTable(id: id, name: name, avatar: avatar));
  }

  Future<int> insertUser(UserTable user) async {
    UserTable? userExists = await chatDatabaseCubit.db.selectUserById(user.id);
    if (userExists == null) {
      return await chatDatabaseCubit.db.insertUser(user);
    }

    return userExists.id;
  }

  Future<bool> insertUsers(List<UserTable> users) async {
    for (final user in users) {
      await insertUser(user);
    }

    return true;
  }
}
