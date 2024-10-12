import 'package:flutter/material.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';

class MobileMessageComposer extends StatefulWidget {
  const MobileMessageComposer({super.key});

  @override
  State<MobileMessageComposer> createState() => _MobileMessageComposerState();
}

class _MobileMessageComposerState extends State<MobileMessageComposer> {
  bool isTyping = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // color: Color.fromARGB(255, 32, 44, 41),
          // color: webAppBarColor //202C33Color.fromARGB(255, 42, 57, 66)
          ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 10, left: 10, top: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 42, 57, 66),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.emoji_emotions_outlined,
                        color: Colors.grey),
                  ),
                  Expanded(
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 5,
                      minLines: 1,
                      style: const TextStyle(
                          fontSize: 14, height: 1.5, wordSpacing: 1.5),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Message',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          )),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          setState(() {
                            isTyping = false;
                          });
                        } else {
                          setState(() {
                            isTyping = true;
                          });
                        }
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.attach_file, color: iconColorGrey),
                  ),
                  if (!isTyping)
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt, color: iconColorGrey),
                    ),
                ],
              ),
            ),
          ),
          isTyping
              ? IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    backgroundColor: iconBackgroundColor,
                    child: Icon(Icons.send, color: iconColorBlack),
                  ),
                )
              : IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    backgroundColor: iconBackgroundColor,
                    child: Icon(
                      Icons.mic,
                      color: iconColorBlack,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
