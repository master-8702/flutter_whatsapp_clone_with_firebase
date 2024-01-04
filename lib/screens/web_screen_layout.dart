import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone_with_firebase/common/contacts_list.dart';
import 'package:flutter_whatsapp_clone_with_firebase/widgets/web_chat.dart';
import 'package:flutter_whatsapp_clone_with_firebase/widgets/web_chat_app_bar.dart';
import 'package:flutter_whatsapp_clone_with_firebase/widgets/web_profile_bar.dart';
import 'package:flutter_whatsapp_clone_with_firebase/widgets/web_search_bar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        const Expanded(
          child: Column(
            children: [
              // web profile bar
              WebProfileBar(),

              // web search bar
              WebSearchBar(),

              // contacts list
              Expanded(child: ContactsList())
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('assets/images/whatsapp_background_image.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              // web chat app bar
              WebChatAppBar(),

              // messages
              Expanded(child: WebChat()),

              // message input box
            ],
          ),
        )
      ],
    ));
  }
}
