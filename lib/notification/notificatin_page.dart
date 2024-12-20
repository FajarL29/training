import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    initializeNotification();
  }

  void initializeNotification() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Android Initialization
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS Initialization (if required)
    const DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        debugPrint('Notification clicked: ${response.payload}');
      },
    );
  }

  // Method to display a simple notification
  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'This is your channel description',
      sound: RawResourceAndroidNotificationSound('notif'),
      importance: Importance.max, // Ensure maximum visibility
      priority: Priority.high,
      ongoing: true, // Keeps the notification persistent
      autoCancel: false, // Prevent notification auto-dismiss
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
      0, // notification ID
      'Hello, Fajar!',
      'Semangat ya',
      notificationDetails,
      payload: 'Notification Payload', // Optional payload
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notifications'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showNotification,
          child: const Text('Show Notification'),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: NotificationPage(),
  ));
}
