import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:mocktail/mocktail.dart';

class FakeParticipantTable extends Fake implements ParticipantTable {}
class FakeUserTable extends Fake implements UserTable {}
class FakeChannelTable extends Fake implements ChannelTable {}
class FakeMessageTable extends Fake implements MessageTable {}
class FakeChatTable extends Fake implements ChatTable {}

void registerFakes(){
  registerFallbackValue(FakeUserTable());
  registerFallbackValue(FakeParticipantTable());
  registerFallbackValue(FakeChannelTable());
  registerFallbackValue(FakeMessageTable());
  registerFallbackValue(FakeChatTable());
}