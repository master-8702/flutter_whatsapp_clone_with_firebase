import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this repository method will upload and image, audio, file ... to firestore(firebase)
// to the specified path by ref argument
class FirebaseStorageRepository {
  final FirebaseStorage firebaseStorage;

  FirebaseStorageRepository({required this.firebaseStorage});

  Future<String> storeFileToFirebase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}

final firebaseStorageRepositoryProvider =
    Provider<FirebaseStorageRepository>((ref) {
  return FirebaseStorageRepository(firebaseStorage: FirebaseStorage.instance);
});
