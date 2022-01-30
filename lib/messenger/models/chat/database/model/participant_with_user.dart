import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';

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
