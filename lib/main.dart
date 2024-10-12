import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';
import 'package:flutter_whatsapp_clone_with_firebase/firebase_options.dart';
import 'package:flutter_whatsapp_clone_with_firebase/responsive/responsive_layout.dart';
import 'package:flutter_whatsapp_clone_with_firebase/screens/mobile_screen_layout.dart';
import 'package:flutter_whatsapp_clone_with_firebase/screens/web_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp',
      // theme: ThemeData.dark().copyWith(colorScheme: const ColorScheme.dark().copyWith(background: backgroundColor) ),
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: const ResponsiveLayout(
          webScreenlayout: WebScreenLayout(),
          mobileScreenlayout: MobileScreenLayout()),
    );
  }
}
