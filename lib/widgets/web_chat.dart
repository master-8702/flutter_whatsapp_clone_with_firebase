import 'package:flutter/material.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/test_files.dart';
import 'package:flutter_whatsapp_clone_with_firebase/widgets/chat_message.dart';

class WebChat extends StatelessWidget {
  const WebChat({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(25),
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return ChatMessage(
            message: message, isMe: message.sender == currentUser);
      },
    );
  }
}
