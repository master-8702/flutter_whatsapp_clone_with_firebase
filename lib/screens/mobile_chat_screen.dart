import 'package:flutter/material.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';
import 'package:flutter_whatsapp_clone_with_firebase/widgets/chat_message.dart';
import 'package:flutter_whatsapp_clone_with_firebase/constants/test_files.dart';
import 'package:flutter_whatsapp_clone_with_firebase/widgets/mobile_message_composer.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(chatList[0].sender.name.toString()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          // chat list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(25),
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ChatMessage(
                    message: message, isMe: message.sender == currentUser);
              },
            ),
          ),
          // mobile message composer
          const MobileMessageComposer()
        ],
      ),
    );
  }
}
