import 'package:flutter/material.dart';

import 'package:flutter_whatsapp_clone_with_firebase/constants/colors.dart';
import 'package:flutter_whatsapp_clone_with_firebase/constants/countries.dart';
import 'package:flutter_whatsapp_clone_with_firebase/utilities/get_country.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  @override
  Widget build(BuildContext context) {
    var selectedCountry = widget.data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a country'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView.builder(
        itemCount: countryList.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> country = countryList[index];

          return ListTile(
            title: country == selectedCountry
                ? Text(country['name'], style: const TextStyle(color: tabColor))
                : Text(country['name']),
            subtitle: Text(
              country['localName'],
              style: const TextStyle(color: greyColor),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '+${country['countryCode']}',
                ),
                const SizedBox(
                  width: 5,
                ),
                Visibility.maintain(
                  visible: country == selectedCountry,
                  child: const Icon(
                    Icons.check,
                    color: tabColor,
                  ),
                ),
              ],
            ),
            leadingAndTrailingTextStyle:
                const TextStyle(fontSize: 16, color: greyColor),
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(country['flag']),
            ),
            onTap: () {
              setState(() {
                if (country['name'] != null) {
                  selectedCountry = getCountry(country['name']);
                }
              });
              // here we are returning the selected country back to the previous page (screen)
              Navigator.pop(context, selectedCountry);
            },
          );
        },
      ),
    );
  }
}
