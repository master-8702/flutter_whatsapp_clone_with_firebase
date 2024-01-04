import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';

class WebProfileBar extends StatelessWidget {
  const WebProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.085,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: webAppBarColor,
        border: Border(
          right: BorderSide(color: Colors.grey.shade400, width: 0.4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/tony.jpg"),
              radius: 20,
            ),
            const Spacer(),
            WebProfileBarButton(icon: Icons.group_outlined, onPressed: () {}),
            WebProfileBarButton(icon: Icons.circle_outlined, onPressed: () {}),
            WebProfileBarButton(icon: Icons.perm_identity, onPressed: () {}),
            WebProfileBarButton(icon: Icons.message, onPressed: () {}),
            WebProfileBarButton(icon: Icons.more_vert, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class WebProfileBarButton extends StatelessWidget {
  const WebProfileBarButton(
      {super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        onPressed: onPressed,
        icon: Icon(icon),
        color: Colors.grey.shade400,
      ),
    );
  }
}
