import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_whatsapp_clone_with_firebase/utilities/pick_image.dart';
import 'package:flutter_whatsapp_clone_with_firebase/features/authentication/controller/auth_controller.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  const UserInformationScreen({super.key});

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController nameFieldController = TextEditingController();
  File? image;

  @override
  void dispose() {
    nameFieldController.dispose();
    super.dispose();
  }

  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  void storeUserData() async {
    String name = nameFieldController.text.trim();
    if (name.isNotEmpty) {
      ref.read(authControllerProvider).saveUserDataToFirebase(
          name: name, profilePicture: image, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  image == null
                      ? const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/whatsapp-clone-backend-ba6fe.firebasestorage.app/o/user.png?alt=media&token=192ea6f0-6e63-4e2d-b8b7-6024dd8df51a'),
                          radius: 70,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(image!),
                          radius: 70,
                        ),
                  Positioned(
                      bottom: -10,
                      left: 100,
                      child: IconButton(
                          onPressed: selectImage,
                          icon: Icon(Icons.add_a_photo)))
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.85,
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: nameFieldController,
                      decoration:
                          const InputDecoration(hintText: 'Enter your name'),
                    ),
                  ),
                  IconButton(onPressed: storeUserData, icon: Icon(Icons.done))
                ],
              )
            ],
          ),
        )));
  }
}
