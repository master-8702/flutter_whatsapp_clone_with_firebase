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
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final currentContact = contacts[index];
          return InkWell(
            onTap: () {},
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(currentContact['profilePic'].toString()),
              ),
              title: Text(currentContact['name'].toString()),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(currentContact['message'].toString()),
              ),
              trailing: Text(
                currentContact['time'].toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
