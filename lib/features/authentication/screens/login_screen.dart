import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';
import 'package:flutter_whatsapp_clone_with_firebase/constants/countries.dart';
import 'package:flutter_whatsapp_clone_with_firebase/utilities/show_snackbar.dart';
import 'package:flutter_whatsapp_clone_with_firebase/features/authentication/screens/countries_list.dart';
import 'package:flutter_whatsapp_clone_with_firebase/features/authentication/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController countryController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  var selectedCountry = countryList[1];

  @override
  void dispose() {
    countryController.dispose();
    countryCodeController.dispose();

    super.dispose();
  }

  void checkNumberAndGoToOTPScreen() {
    // call trip to avoid extra white spaces before and after the text
    String phoneNumber = phoneNumberController.text.trim();

    if (countryController.text.isNotEmpty &&
        countryCodeController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty) {
      ref.read(authControllerProvider).signInWithPhone(
          context, '+${selectedCountry['countryCode']}$phoneNumber');
    } else {
      showSnackBar(
          context: context, message: 'Please fill all the fields correctly!');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    countryController.text = selectedCountry['name'];
    countryCodeController.text = selectedCountry['countryCode'];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Enter your phone number',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert))
                ],
              ),
              SizedBox(
                height: height / 35,
              ),
              const Text(
                  textAlign: TextAlign.center,
                  "WhatsApp will need to verify your phone number. Carrier charges may apply. What's my number?"),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: countryController,
                            textAlign: TextAlign.center,
                            readOnly: true,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: -10),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 34,
                                  ),
                                ),
                                suffixIconConstraints:
                                    BoxConstraints(maxHeight: 20),
                                suffixIconColor: tabColor,
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: tabColor,
                                )),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: tabColor, width: 2.5))),
                            onTap: () async {
                              // here we are receiving selected Country from CountriesList screen after selection
                              final country = await Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                // here we are passing currently selected country to CountriesList screen
                                // in order to show the previously selected(default) country
                                return CountriesList(data: selectedCountry);
                              }));

                              setState(() {
                                selectedCountry = country;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: countryCodeController,
                            textAlign: TextAlign.start,
                            cursorColor: tabColor,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  bottom: -15,
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                  child: Icon(
                                    Icons.add,
                                    color: iconColorGrey,
                                    size: 18,
                                  ),
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  maxHeight: 5,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: tabColor)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: tabColor, width: 2.5))),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          flex: 3,
                          // fit: FlexFit.loose,
                          child: TextField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: -15),
                              hintText: 'Phone number',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: tabColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: tabColor, width: 2.5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(tabColor)),
                        onPressed: checkNumberAndGoToOTPScreen,
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
