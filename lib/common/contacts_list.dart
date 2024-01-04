import 'package:flutter/material.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/test_files.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final contact = chatList[index];
          return InkWell(
            onTap: () {},
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(contact.sender.imageUrl),
              ),
              title: Text(contact.sender.name),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  contact.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: Text(
                contact.time,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                
              ),
            ),
          );
        },
      ),
    );
  }
}
