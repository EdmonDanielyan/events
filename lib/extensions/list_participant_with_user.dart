import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/participant_with_user.dart';

extension ListParticipantWithUserExt on List<ParticipantWithUser> {
  int sortByNameAndRole(ParticipantWithUser a, ParticipantWithUser b, int owner) {
    var prefA = a.participant!.admin || a.user?.id == owner ? "1" : "";
    var prefB = b.participant!.admin || b.user?.id == owner ? "1" : "";
    var nameA =  prefA + (a.user?.name ?? "").toLowerCase().replaceAll("ё", "е");
    var nameB = prefB  + (b.user?.name ?? "").toLowerCase().replaceAll("ё", "е");
    return nameA.compareTo(nameB);
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
