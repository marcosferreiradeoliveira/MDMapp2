// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// class NotificationService {
//   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
//   static const String fcmSubcriptionTopticforAll = 'all';

//   Future<void> initFirebasePushNotification(BuildContext context) async {
//     try {
//       NotificationSettings settings = await _fcm.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );

//       if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//         debugPrint('User granted permission');

//         // Configura handlers de mensagem
//         FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//           debugPrint('Got a message whilst in the foreground!');
//           if (message.notification != null) {
//             debugPrint('Notification: ${message.notification?.title}');
//           }
//         });

//         FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//           debugPrint('Message clicked!');
//           if (message.notification != null) {
//             // Implementar navegação aqui se necessário
//           }
//         });
//       } else if (settings.authorizationStatus ==
//           AuthorizationStatus.provisional) {
//         debugPrint('User granted provisional permission');
//       } else {
//         debugPrint('User declined permission');
//       }
//     } catch (e) {
//       debugPrint('Error initializing notifications: $e');
//     }
//   }

//   Future<bool?> checkingPermisson() async {
//     try {
//       NotificationSettings settings = await _fcm.getNotificationSettings();
//       return settings.authorizationStatus == AuthorizationStatus.authorized ||
//           settings.authorizationStatus == AuthorizationStatus.provisional;
//     } catch (e) {
//       debugPrint('Error checking permission: $e');
//       return false;
//     }
//   }

//   Future<void> subscribe() async {
//     try {
//       await _fcm.subscribeToTopic(fcmSubcriptionTopticforAll);
//       debugPrint('Subscribed to notifications');
//     } catch (e) {
//       debugPrint('Error subscribing to notifications: $e');
//     }
//   }

//   Future<void> unsubscribe() async {
//     try {
//       await _fcm.unsubscribeFromTopic(fcmSubcriptionTopticforAll);
//       debugPrint('Unsubscribed from notifications');
//     } catch (e) {
//       debugPrint('Error unsubscribing from notifications: $e');
//     }
//   }
// }
