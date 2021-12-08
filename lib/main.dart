import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ms_tromm/ui/authentication/login.dart';
import 'package:ms_tromm/ui/authentication/tutorial.dart';
import 'package:ms_tromm/ui/home/home.dart';
import 'package:ms_tromm/ui/survey/survey_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


import 'firebase_options.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  runApp(MaterialApp(
    title: 'MS. TROMM',
    initialRoute: '/',
    routes: {
      '/': (context) => const TutorialPage(),
      '/login': (context) => const LoginPage(),
      '/survey': (context) => const SurveyMain(),
      '/home': (context) => const HomePage(),
      '/tutorial': (context) => const TutorialPage()
    },
    theme:
        ThemeData(fontFamily: 'Roboto', scaffoldBackgroundColor: Colors.white),
  ));
}
