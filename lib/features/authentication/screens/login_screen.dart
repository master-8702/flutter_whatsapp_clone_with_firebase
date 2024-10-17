import 'package:flutter/material.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';
import 'package:flutter_whatsapp_clone_with_firebase/constants/countries.dart';
import 'package:flutter_whatsapp_clone_with_firebase/utilities/get_country.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController countryController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  var selectedCountry = countryList[1];

  @override
  void dispose() {
    countryController.dispose();
    countryCodeController.dispose();

    super.dispose();
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
                            onTap: () {
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
                                                  icon:
                                                      const Icon(Icons.close)),
                                              const Text(
                                                "Choose a country",
                                                style: TextStyle(fontSize: 24),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              controller: scrollController,
                                              itemCount: countryList.length,
                                              itemBuilder: (context, index) {
                                                Map<String, dynamic> country =
                                                    countryList[index];

                                                return ListTile(
                                                  title: country ==
                                                          selectedCountry
                                                      ? Text(country['name'],
                                                          style:
                                                              const TextStyle(
                                                                  color:
                                                                      tabColor))
                                                      : Text(country['name']),
                                                  subtitle: Text(
                                                    country['localName'],
                                                    style: const TextStyle(
                                                        color: greyColor),
                                                  ),
                                                  trailing: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        '+${country['countryCode']}',
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Visibility.maintain(
                                                        visible: country ==
                                                            selectedCountry,
                                                        child: const Icon(
                                                          Icons.check,
                                                          color: tabColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  leadingAndTrailingTextStyle:
                                                      const TextStyle(
                                                          fontSize: 16,
                                                          color: greyColor),
                                                  leading: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                        country['flag']),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      if (country['name'] !=
                                                          null) {
                                                        selectedCountry =
                                                            getCountry(country[
                                                                'name']);

                                                        countryController.text =
                                                            selectedCountry[
                                                                'name'];
                                                        countryCodeController
                                                                .text =
                                                            selectedCountry[
                                                                'countryCode'];
                                                      }
                                                    });
                                                    Navigator.pop(context);
                                                  },
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
                            controller: textEditingController3,
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
            ],
          ),
        ),
      ),
    );
  }
}
