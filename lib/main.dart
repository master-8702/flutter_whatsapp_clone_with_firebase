import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';
import 'package:flutter_whatsapp_clone_with_firebase/responsive/responsive_layout.dart';
import 'package:flutter_whatsapp_clone_with_firebase/screens/mobile_screen_layout.dart';
import 'package:flutter_whatsapp_clone_with_firebase/screens/web_screen_layout.dart';

void main() {
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
