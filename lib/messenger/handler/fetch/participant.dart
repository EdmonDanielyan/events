import 'package:ink_mobile/cubit/profile/sources/fetch/network.dart';
import 'package:ink_mobile/extensions/get_user_success.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/providers/logger.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/setup.dart';

class FetchPartcipants {
  final List<User> users;

  const FetchPartcipants(this.users);

  Future<void> call() async {
    if (users.isNotEmpty) {
      final cachedUsers = getIt<CachedUsersCubit>();
      for (final user in users) {
        if (!cachedUsers.exists(user.id)) {
          await cacheUser(user.id, cachedUsers);
        }
      }
    }
  }

  Future<void> cacheUser(int userId, CachedUsersCubit cubit) async {
    try {
      await Token.setNewTokensIfExpired();
      final response =
          await getIt<ProfileFetchNetworkRequest>(param1: userId)();
      UserProfileData userData = response.mapResponse();

      final user = User(
        id: userId,
        name: "${userData.name ?? ""} ${userData.lastName ?? ""}".trim(),
        avatarUrl: userData.pathToAvatar ?? "",
      );
      print("ADDING PARTICIPANT $user");

      cubit.addUsers([user]);
    } catch (_e) {
      logger.e(_e.toString());
    }
  }
}
