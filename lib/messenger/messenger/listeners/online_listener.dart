import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/constants/events.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/functions/debouncer.dart';
import 'package:ink_mobile/messenger/messenger/senders/online/model.dart';
import 'package:ink_mobile/setup.dart';
import 'listener.dart';

class OnlineListener extends Listener {
  final int userId;
  OnlineListener(this.userId);

  @override
  String get event => SocketEvents.onlineListener(userId);

  OnlineCubit get onlineCubit => getIt<OnlineCubit>();

  final debouncer = Debouncer(duration: const Duration(minutes: 15));

  @override
  void handler(data) {
    final model = OnlineModel.fromJsonCustom(fromBytes(data));

    if (model != null &&
        messengerProvider.onlineSubscriptions.contains(userId)) {
      debouncer.run(() {
        onlineCubit.removeById(model.user.id);
      });

      onlineCubit.addUsers([model.user]);
      getIt<CustomOnlineListener>().emitTrigger(model);
    }
  }
}

@singleton
class CustomOnlineListener {
  Set<Function(OnlineModel)> triggers = {};

  void emitTrigger(OnlineModel data) {
    if (triggers.isNotEmpty) {
      for (final trigger in triggers) {
        trigger(data);
      }
    }
  }
}
