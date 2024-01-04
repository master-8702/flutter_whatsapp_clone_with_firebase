import 'package:flutter/material.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';

class WebMessageComposer extends StatefulWidget {
  const WebMessageComposer({super.key});

  @override
  State<WebMessageComposer> createState() => _WebMessageComposerState();
}

class _WebMessageComposerState extends State<WebMessageComposer> {
  bool isTyping = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // color: Color.fromARGB(255, 32, 44, 41),
          color: webAppBarColor //202C33
          ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 42, 57, 66),
                borderRadius: BorderRadius.circular(12),
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
                          hintText: 'Type a message',
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
                ],
              ),
            ),
          ),
          isTyping
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                  color: Colors.grey,
                )
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mic),
                  color: Colors.grey,
                ),
        ],
      ),
    );
  }
}
