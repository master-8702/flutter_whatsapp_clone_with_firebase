import 'package:flutter/material.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';
import 'package:flutter_whatsapp_clone_with_firebase/widgets/web_profile_bar.dart';

class WebChatAppBar extends StatelessWidget {
  const WebChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.085,
      decoration: const BoxDecoration(
        color: webAppBarColor,
        border: Border(
          right: BorderSide(color: Colors.white),
        ),
      ),
      child: Row(children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/tony.jpg',
            ),
          ),
        ),
        Text(
          'Tony',
          style: TextStyle(fontSize: 18, color: Colors.grey.shade400),
        ),
        const Spacer(),
        WebProfileBarButton(icon: Icons.search, onPressed: () {}),
        WebProfileBarButton(icon: Icons.more_vert, onPressed: () {})
      ]),
    );
  }
}
