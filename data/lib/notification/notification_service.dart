import 'package:data_package/firebase/firebase_options_dev.dart';
import 'package:data_package/notification/local_push_notifcaition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class NotificationService {
  FirebaseMessaging get _firebaseMessaging => FirebaseMessaging.instance;

  NotificationService() {
    init();
  }

  init() async {
    /// initialise firebase
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    /// check for permission
    await requestPermission();

    /// handle notification callbacks
    registerListeners();
  }

  Future requestPermission() async {
    /// Request permission to receive messages (Apple and Web)
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    /// Get access token to be sent to server
    var fcmToken = await _firebaseMessaging.getToken();
    debugPrint('FCM Token : $fcmToken');

    /// refreshed FCM token
    _firebaseMessaging.onTokenRefresh.listen((fcmToken) {
      debugPrint("Refreshed FCM Token is: $fcmToken");
    });
  }

  void registerListeners() async {
    /// Update the iOS foreground notification presentation options to allow heads up notifications.
    _firebaseMessaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

    /// To handle messages while your application is in the foreground, listen to the onMessage
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleMessage(message);
    });

    /// handle any interaction when the app is in the background via a Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    /// Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    /// handle app open from terminated state
    _firebaseMessaging.getInitialMessage().then(
      (RemoteMessage? message) {
        if (message == null) {
          return;
        }
        _handleMessage(message);
      },
    );
  }
}

void _handleMessage(RemoteMessage message) async {
  debugPrint('${message.notification?.title}');

  final LocalPushNotification localPushNotification = LocalPushNotification();
  localPushNotification.createNotification(message);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  _handleMessage(message);

  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}
