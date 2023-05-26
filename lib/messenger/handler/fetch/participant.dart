import 'package:ink_mobile/cubit/profile/sources/fetch/network.dart';
import 'package:ink_mobile/extensions/get_users_success.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/setup.dart';

class FetchParticipants {
  final List<User> users;
  const FetchParticipants(this.users);

  Future<void> call() async {
    if (users.isNotEmpty) {
      final cachedUsers = getIt<CachedUsersCubit>();
      await cacheUsers(users.map((e) => e.id).toList(), cachedUsers);
    }
  }

  Future<void> cacheUsers(List<int> userIds, CachedUsersCubit cubit) async {
    try {
      await Token.setNewTokensIfExpired();
      final response =
          await getIt<ProfileFetchNetworkRequest>().getUsers(userIds);
      List<UserProfileData> userData = response.mapResponse();

      final users = userData
          .map(
            (user) => User(
              id: user.id,
              name: "${user.lastName ?? ""} ${user.name ?? ""}".trim(),
              avatarUrl: user.pathToAvatar ?? "",
              absence: user.absence,
              workPosition: user.workPosition,
            ),
          )
          .toList();
      if (users.isNotEmpty) {
        for (final u in users) {
          cubit.removeAndAddUser(u, u.id);
        }
      }
    } catch (_e) {}
  }
}
