import 'package:flutter_whatsapp_clone_with_firebase/models/user_model.dart';

class Message {
  final User sender;
  final String text;
  final String time;
  final bool unread;

  Message(
      {required this.sender,
      required this.text,
      required this.time,
      required this.unread});
}