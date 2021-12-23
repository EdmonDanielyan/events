import 'package:ink_mobile/models/chat/database/chat_db.dart';

class ParticipantWithUser {
  final ParticipantTable? participant;
  final UserTable? user;

  const ParticipantWithUser({
    required this.participant,
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ParticipantWithUser &&
        other.participant == participant &&
        other.user == user;
  }

  @override
  int get hashCode => participant.hashCode ^ user.hashCode;
}

class ParticipantWithUserListView {
  static int sortByAdmin(ParticipantWithUser a, ParticipantWithUser b,
      {int? ownerId}) {
    if (ownerId != null) {
      return a.participant!.userId == ownerId ? -1 : 1;
    }

    return a.participant!.admin ? -1 : 1;
  }

  static List<int> getUserIds(List<ParticipantWithUser> items) {
    List<int> ids = [];
    if (items.isNotEmpty) {
      for (final item in items) {
        ids.add(item.user!.id);
      }
    }

    return ids;
  }

  static List<UserTable> getUsers(List<ParticipantWithUser> items) {
    List<UserTable> users = [];
    if (items.isNotEmpty) {
      for (final item in items) {
        users.add(item.user!);
      }
    }

    return users;
  }
}
