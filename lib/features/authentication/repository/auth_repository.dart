import 'dart:io';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_whatsapp_clone_with_firebase/firebase_options.dart';
import 'package:flutter_whatsapp_clone_with_firebase/common/model/user.dart';
import 'package:flutter_whatsapp_clone_with_firebase/utilities/show_snackbar.dart';
import 'package:flutter_whatsapp_clone_with_firebase/screens/web_screen_layout.dart';
import 'package:flutter_whatsapp_clone_with_firebase/responsive/responsive_layout.dart';
import 'package:flutter_whatsapp_clone_with_firebase/screens/mobile_screen_layout.dart';
import 'package:flutter_whatsapp_clone_with_firebase/features/authentication/screens/otp_screen.dart';
import 'package:flutter_whatsapp_clone_with_firebase/common/repository/firebase_storage_repository.dart';
import 'package:flutter_whatsapp_clone_with_firebase/features/authentication/screens/user_information_screen.dart';


class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({required this.auth, required this.firestore});

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      // the below code works but it needs billing accounts in order to actually authenticate user
      // with phone number

      // here we use verifyPhoneNumber for native platforms like Android and IOS
      // ( and signInWithPhoneNumber for web platform )
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          // This handler will only be called on Android devices which support automatic SMS code resolution.
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          // If Firebase returns an error (i.e incorrect phone number) a FirebaseAuthException will be sent to
          // this handler
          verificationFailed: (FirebaseAuthException e) {
            throw Exception(e.message);
          },
          // When Firebase sends an SMS code to the device, this handler is triggered with a verificationId and
          // resendToken (A resendToken is only supported on Android devices, iOS devices will always return
          // a null value).
          codeSent: (verificationId, resendToken) async {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OTPScreen(verificationId: verificationId);
            }));
          },
          // On Android devices which support automatic SMS code resolution, this handler will be called
          // if the device has not automatically resolved an SMS message within a certain timeframe.
          //Once the timeframe has passed, the device will no longer attempt to resolve any incoming messages.
          // the default is 30 seconds.
          codeAutoRetrievalTimeout: (verificationId) {});
    } catch (e) {
      showSnackBar(context: context, message: e.toString());
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String otp,
  }) async {
    try {
      // sign in the user with their phone(verification Id) and otp
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await auth.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const UserInformationScreen(),
        ),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, message: e.toString());
    }
  }

  void saveUserDataToFirebase(
      {required String name,
      required File? profilePicture,
      required ProviderRef ref,
      required BuildContext context}) async {
    try {
      String uid = auth.currentUser!.uid;
      String profileUrl =
          'https://firebasestorage.googleapis.com/v0/b/whatsapp-clone-backend-ba6fe.firebasestorage.app/o/user.png?alt=media&token=192ea6f0-6e63-4e2d-b8b7-6024dd8df51a';

      if (profilePicture != null) {
        profileUrl = await ref
            .read(firebaseStorageRepositoryProvider)
            .storeFileToFirebase('profilePictures/$uid', profilePicture);
      }

      final user = CustomUser(
          name: name,
          uid: uid,
          profilePicture: profileUrl,
          phoneNumber: auth.currentUser!.uid,
          groupIds: [],
          isOnline: true);
      // here we are creating users collection called 'users'(or use it if it already exists)
      // then create a new document with the user uid that contains the user data
      await firestore.collection('users').doc(uid).set(user.toMap());

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenlayout: MobileScreenLayout(),
            webScreenlayout: WebScreenLayout(),
          ),
        ),
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context: context, message: e.toString());
    }
  }
}

// final authRepositoryProvider = Provider((ref) {
//   return AuthRepository(
//       auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance);
// });

// for testing purpose and mock Firebase initialization, using a FutureProvider
// makes it easier to override the initialization logic. (even though the firebase
// is initialized in the main.dart file)
final firebaseInitializationProvider = FutureProvider<void>((ref) async {
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // Ensure Firebase is initialized before accessing FirebaseAuth or Firestore
  ref.watch(
      firebaseInitializationProvider); // This ensures initialization is complete

  return AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
});
