import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';

class UserFunctions {
  final ChatDatabaseCubit chatDatabaseCubit;

  const UserFunctions(this.chatDatabaseCubit);

  static UserTable get getMe => UserTable(
        id: JwtPayload.myId,
        name: JwtPayload.myName,
        avatar: JwtPayload.myAvatar,
      );

  void addMe() {
    insertUser(getMe);
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
}
