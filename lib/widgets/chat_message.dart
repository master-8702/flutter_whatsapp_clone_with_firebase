import 'package:flutter/material.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';
import 'package:flutter_whatsapp_clone_with_firebase/models/message_model.dart';

class ChatMessage extends StatefulWidget {
  final Message message;
  final bool isMe;
  const ChatMessage({super.key, required this.message, required this.isMe});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          // outside the border
          margin: widget.isMe
              ? const EdgeInsets.only(left: 80, top: 8, bottom: 8)
              : const EdgeInsets.only(top: 8, bottom: 8),
          // inside the border
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: widget.isMe
              ? const BoxDecoration(
                  // color: Color.fromARGB(255, 247, 242, 247),
                  color: messageColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
                )
              : const BoxDecoration(
                  // color: Color.fromARGB(255, 226, 207, 226),
                  color: senderMessageColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.4),
                    // width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      widget.message.text,
                      style: const TextStyle(color: Colors.white, height: 1.5),
                      // textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.message.time,
                      style: const TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 12,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  if (widget.isMe)
                    const Icon(
                      Icons.done_all,
                      size: 20,
                      color: Colors.blue,
                    ),
                ],
              )
            ],
          ),
        ),
        // if (!widget.isMe)
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         widget.message.isLiked ? Icons.favorite : Icons.favorite_border,
        //         color: widget.message.isLiked
        //             ? Theme.of(context).primaryColor
        //             : Colors.blueGrey,
        //         size: 30,
        //       ))
      ],
    );
  }
}
