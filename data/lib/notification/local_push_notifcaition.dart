import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class LocalPushNotification {
  AwesomeNotifications get _awesomeNotification => AwesomeNotifications();

  LocalPushNotification() {
    /// initialize notification ui
    _awesomeNotification.initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
            channelGroupKey: 'notification_channel_group',
            channelKey: 'notification_channel',
            channelName: 'Test notifications',
            channelDescription: 'Notification channel',
          )
        ],
        // Channel groups are only visual and are not required
        channelGroups: [NotificationChannelGroup(channelGroupKey: 'notification_channel_group', channelGroupName: 'notification_channel_name')],
        debug: kDebugMode);
    _awesomeNotification.setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  Future createNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    Map<String, String> payload = {"id": ""};

    await _awesomeNotification.createNotification(
      content: NotificationContent(
          id: message.hashCode,
          channelKey: 'notification_channel',
          title: notification?.title,
          body: notification?.body,
          actionType: ActionType.Default,
          payload: payload),
    );
  }

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  Future<void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    debugPrint(receivedNotification.toString());
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  Future<void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    debugPrint(receivedNotification.toString());
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  Future<void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    debugPrint(receivedAction.toString());
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    debugPrint(receivedAction.toString());
  }
}
