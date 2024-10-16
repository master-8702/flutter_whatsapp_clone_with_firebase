import 'package:flutter_whatsapp_clone_with_firebase/constants/countries.dart';

Map<String, dynamic> getCountry(String name) {
  var temp = countryList.where(
    (country) {
      if (country['name'] == name) {
        return true;
      } else {
        return false;
      }
    },
  ).first;

  return temp;
}
