import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/app.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';

///
/// Wrapper for Local Notification
///
///
@lazySingleton
class LocalNotificationsProvider with Loggable {
  Function(Map<String, String>)? _displayHandler;
  Function(Map<String, String>)? _actionHandler;

  set displayHandler(Function(Map<String, String>) value) {
    _displayHandler = value;
  }

  set actionHandler(Function(Map<String, String>) value) {
    _actionHandler = value;
  }

  Future<void> load() async {
    logger.finest('load');

    await AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        'resource://drawable/ic_launcher',
        [
          NotificationChannel(
              channelGroupKey: 'messenger_channel_group',
              channelKey: 'messenger_channel',
              channelName: 'Messenger',
              channelDescription: 'Messenger notification',
              ledColor: Colors.white)
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupkey: 'messenger_channel_group',
              channelGroupName: 'Messenger group')
        ],
        debug: true);

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        requestUserPermissions(
            App.getContext!,
            channelKey: 'messenger_channel',
            permissionList: const [
              NotificationPermission.Alert,
              NotificationPermission.Sound,
              NotificationPermission.Vibration,
              NotificationPermission.Light,
              NotificationPermission.PreciseAlarms,
            ]);
      }
    });
  }

  Future showNotification(String title, String body,
      {Map<String, String>? payload,
      Function(String?)? onSelect,
      int id = 0}) async {
    logger.finest(() =>
        "showNotification. title: $title, body: $body, payload: $payload");
    return AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            category: NotificationCategory.Message,
            locked: false,
            autoDismissible: true,
            displayOnBackground: true,
            displayOnForeground: true,
            channelKey: 'messenger_channel',
            title: title,
            body: body,
            notificationLayout: NotificationLayout.Default));
  }

  Future<void> selectNotification(String? payload) async {
    if (payload != null) {
      logger.info(() => 'notification payload: $payload');
      var secureStorage = sl<SecureStorage>();
      await secureStorage.write(key: "open_chat_id", value: payload);
    }
  }

  Future<void> cancelNotification(int id) async {
    await AwesomeNotifications().cancel(id);
  }

  static Future<List<NotificationPermission>> requestUserPermissions(
      BuildContext context,{
        // if you only intends to request the permissions until app level, set the channelKey value to null
        required String? channelKey,
        required List<NotificationPermission> permissionList}
      ) async {

    // Check which of the permissions you need are allowed at this time
    List<NotificationPermission> permissionsAllowed = await AwesomeNotifications().checkPermissionList(
        channelKey: channelKey,
        permissions: permissionList
    );

    // If all permissions are allowed, there is nothing to do
    if(permissionsAllowed.length == permissionList.length)
      return permissionsAllowed;

    // Refresh the permission list with only the disallowed permissions
    List<NotificationPermission> permissionsNeeded =
    permissionList.toSet().difference(permissionsAllowed.toSet()).toList();

    // Check if some of the permissions needed request user's intervention to be enabled
    List<NotificationPermission> lockedPermissions = await AwesomeNotifications().shouldShowRationaleToRequest(
        channelKey: channelKey,
        permissions: permissionsNeeded
    );

    // If there is no permissions depending on user's intervention, so request it directly
    if(lockedPermissions.isEmpty){

      // Request the permission through native resources.
      await AwesomeNotifications().requestPermissionToSendNotifications(
          channelKey: channelKey,
          permissions: permissionsNeeded
      );

      // After the user come back, check if the permissions has successfully enabled
      permissionsAllowed = await AwesomeNotifications().checkPermissionList(
          channelKey: channelKey,
          permissions: permissionsNeeded
      );
    }
    else {
      // If you need to show a rationale to educate the user to conceived the permission, show it
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Color(0xfffbfbfb),
            title: Text('Приложение «ИНК-Портал» запрашивает разрешение на отправку Вам уведомлений.',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Уведомления могут содержать напоминания, звуки и наклейки значков. Их конфигурирование возможно в Настройках.',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: (){ Navigator.pop(context); },
                  child: Text(
                    'Запретить',
                    style: TextStyle(fontSize: 18),
                  )
              ),
              TextButton(
                onPressed: () async {

                  // Request the permission through native resources. Only one page redirection is done at this point.
                  await AwesomeNotifications().requestPermissionToSendNotifications(
                      channelKey: channelKey,
                      permissions: lockedPermissions
                  );

                  // After the user come back, check if the permissions has successfully enabled
                  permissionsAllowed = await AwesomeNotifications().checkPermissionList(
                      channelKey: channelKey,
                      permissions: lockedPermissions
                  );

                  Navigator.pop(context);
                },
                child: Text(
                  'Разрешить',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
      );
    }

    // Return the updated list of allowed permissions
    return permissionsAllowed;
  }
}
