import 'package:flutter/material.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';

class WebSearchBar extends StatelessWidget {
  const WebSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.30,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: dividerColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: searchBarColor,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 25),
                  child: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey.shade400,
                  ),
                ),
                hintText: 'Search or start new chat',
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 0.0,
                      style: BorderStyle.none,
                    )),
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_list,
                color: Colors.grey.shade400,
                size: 20,
              ))
        ],
      ),
    );
  }
}
