import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_app_check/firebase_app_check.dart'; // For App Check

import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';
import 'package:flutter_whatsapp_clone_with_firebase/firebase_options.dart';
import 'package:flutter_whatsapp_clone_with_firebase/features/onboarding/screens/onboarding_screen1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  

    // Set Firebase Auth language code (optional, fixes locale warnings)
  await FirebaseAuth.instance.setLanguageCode("en"); // will be replaced  with actual locale


  // Initialize Firebase App Check (optional, but recommended for production)
  await FirebaseAppCheck.instance.activate(
    // webProvider:
        // ReCaptchaV3Provider('your-recaptcha-site-key'), // Replace with your key
    // Use .debug for development and use AndroidProvider.playIntegrity or 
    // AndroidProvider.safetyNet for production.
    // but if we set .debug we need to add the debug token that is generated in the console
    // when we run the app in debug mode, to the firebase console app check settings
    androidProvider: AndroidProvider.debug, 
    // appleProvider: AppleProvider.appAttest, // For iOS/macOS
  );


  runApp(const ProviderScope(child: MyApp()));
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

      home: OnboardingScreen1(),
      // home: const ResponsiveLayout(
      //     webScreenlayout: WebScreenLayout(),
      //     mobileScreenlayout: MobileScreenLayout()),
    );
  }
}
