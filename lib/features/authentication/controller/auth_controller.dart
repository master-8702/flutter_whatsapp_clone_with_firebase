import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_whatsapp_clone_with_firebase/features/authentication/repository/auth_repository.dart';

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthController({
    required this.authRepository,
    required this.ref,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationID, String otp) {
    authRepository.verifyOTP(
        context: context, verificationId: verificationID, otp: otp);
  }

  void saveUserDataToFirebase(
      {required String name,
      File? profilePicture,
      required BuildContext context}) {
    authRepository.saveUserDataToFirebase(
        name: name, profilePicture: profilePicture, ref: ref, context: context);
  }
}

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});
