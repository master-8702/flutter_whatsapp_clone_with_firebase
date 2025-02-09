import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:flutter_whatsapp_clone_with_firebase/utilities/show_snackbar.dart';

// a generic method used for picking image from the device 
Future<File?> pickImage(BuildContext context) async {
  File? image;

  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context: context, message: e.toString());
  }

  return image;
}
