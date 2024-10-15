import 'package:flutter/material.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';
import 'package:flutter_whatsapp_clone_with_firebase/constants/languages.dart';
import 'package:flutter_whatsapp_clone_with_firebase/features/onboarding/screens/onboarding_screen2.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  String selectedValue = 'English';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height / 10,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/images/abstract bg.png',
                    color: tabColor,
                    width: 300,
                    height: 300,
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      "Welcome to WhatsApp",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text("Choose your language to get started"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height / 20,
            ),
            Expanded(
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: languageList.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> language = languageList[index];
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
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const OnboardingScreen2();
            },
          ));
        },
        backgroundColor: tabColor,
        child: const Icon(
          Icons.arrow_forward,
          color: iconColorBlack,
        ),
      ),
    );
  }
}
