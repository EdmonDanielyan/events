import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_mixin.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';

class AppLayerScreen extends StatefulWidget {
  final NewBottomNavBarCubit newBottomNavBarCubit;
  const AppLayerScreen({Key? key, required this.newBottomNavBarCubit})
      : super(key: key);

  @override
  State<AppLayerScreen> createState() => _AppLayerScreenState();
}

class _AppLayerScreenState extends State<AppLayerScreen>
    with NewBottomNavBarMixin {
  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = getScreens();

    return Offstage(
      offstage: ModalRoute.of(context)?.settings.name != "/app_layer",
      child: WillStartForegroundTask(
        onWillStart: () async {
          // Return whether to start the foreground service.
          return true;
        },

        androidNotificationOptions: AndroidNotificationOptions(
          channelId: 'messenger_channel',
          channelName: 'INK Messenger',
          channelDescription: 'This notification appears when the foreground service is running.',
          channelImportance: NotificationChannelImportance.LOW,
          priority: NotificationPriority.LOW,
          isSticky: false,
          iconData: NotificationIconData(
            resType: ResourceType.mipmap,
            resPrefix: ResourcePrefix.ic,
            name: 'launcher',
          ),
        ),
        iosNotificationOptions: const IOSNotificationOptions(
          showNotification: false,
          playSound: false,
        ),
        foregroundTaskOptions: const ForegroundTaskOptions(
          interval: 5000,
          autoRunOnBoot: true,
          allowWifiLock: true,
        ),
        printDevLog: false,
        notificationTitle: "ИНК-портал",
        notificationText: "Нажмите для возврата в приложение",
        child: Scaffold(
          body: PageView(
            controller: widget.newBottomNavBarCubit.pageController,
            children: _screens,
            onPageChanged: widget.newBottomNavBarCubit.onPageChanged,
            physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: const NewBottomNavBar(),
        ),
      ),
    );
  }
}
