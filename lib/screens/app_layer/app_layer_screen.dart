import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_mixin.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/providers/push_notification_manager.dart';
import 'package:ink_mobile/setup.dart';

class AppLayerScreen extends StatefulWidget {
  final NewBottomNavBarCubit newBottomNavBarCubit;
  const AppLayerScreen({Key? key, required this.newBottomNavBarCubit})
      : super(key: key);

  @override
  State<AppLayerScreen> createState() => _AppLayerScreenState();
}

class _AppLayerScreenState extends State<AppLayerScreen>
    with NewBottomNavBarMixin, Loggable {

  @override
  void initState() {
    super.initState();
    sl<PushNotificationManager>().initialChat.then((chat) {
      if (chat != null) {
        logger.finest("Scheduling to open chat: ${chat.id}");
        SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
          OpenChat(sl(), chat)();
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = getScreens();

    return Offstage(
      offstage: ModalRoute.of(context)?.settings.name != "/app_layer",
      child: Scaffold(
        body: PageView(
          controller: widget.newBottomNavBarCubit.pageController,
          children: _screens,
          onPageChanged: widget.newBottomNavBarCubit.onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: const NewBottomNavBar(),
      ),
    );
  }
}
