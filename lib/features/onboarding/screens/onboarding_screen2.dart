import 'package:flutter/material.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';
import 'package:flutter_whatsapp_clone_with_firebase/constants/languages.dart';
import 'package:flutter_whatsapp_clone_with_firebase/features/authentication/screens/login_screen.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  String selectedValue = 'English';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/abstract bg.png',
                  width: 300,
                  height: 300,
                  color: tabColor,
                ),
              ),
              SizedBox(
                height: height / 40,
              ),
              const Text(
                'Welcome to WhatsApp',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: height / 40,
              ),
              const Text(
                'Read our privacy policy. tap "Agree and continue" to accept the Terms o services',
                textAlign: TextAlign.center,
                style: TextStyle(color: greyColor),
              ),
              SizedBox(
                height: height / 50,
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    // enableDrag: true,
                    isScrollControlled: true,
                    showDragHandle: true,
                    // backgroundColor: tabColor,
                    context: context,
                    builder: (context) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.4,
                        minChildSize: 0.3,
                        maxChildSize: 1.0,
                        expand: false,
                        builder: (context, scrollController) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.close)),
                                  const Text(
                                    "App Language",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: languageList.length,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> language =
                                        languageList[index];
                                    return ListTile(
                                      title: Text(
                                        language['localName'],
                                      ),
                                      subtitle: Text(language['name']),
                                      leading: Radio<String>(
                                        value: language['name'],
                                        activeColor: tabColor,
                                        groupValue: selectedValue,
                                        onChanged: (String? value) {
                                          // take the $value (the selected language)
                                          // dismiss the bottomSheet
                                          // and change the locale accordingly
                                          if (value != null) {
                                            setState(() {
                                              selectedValue = value;
                                            });
                                          }
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.language,
                      color: tabColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      // 'English',
                      selectedValue,
                      style: const TextStyle(color: tabColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: tabColor),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextButton(
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(tabColor)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Agree and Continue',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
