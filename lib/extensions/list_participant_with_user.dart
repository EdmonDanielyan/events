import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/participant_with_user.dart';

extension ListParticipantWithUserExt on List<ParticipantWithUser> {
  int sortByAdmind(ParticipantWithUser a, ParticipantWithUser b,
      {int? ownerId}) {
    if (ownerId != null) {
      return a.participant!.userId == ownerId ? -1 : 1;
    }

    return a.participant!.admin ? -1 : 1;
  }

  List<int> getUserIds() {
    List<int> ids = [];
    if (this.isNotEmpty) {
      for (final item in this) {
        ids.add(item.user!.id);
      }
    }

    return ids;
  }

  List<UserTable> getUsers() {
    List<UserTable> users = [];
    if (this.isNotEmpty) {
      for (final item in this) {
        users.add(item.user!);
      }
    }

    return users;
  }
}
