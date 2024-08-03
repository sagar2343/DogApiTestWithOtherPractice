import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:test4/pets_api_with_provider/PetsModel.dart';

class PetsProvider with ChangeNotifier {
  static const apiEndpoint = 'https://jatinderji.github.io/users_pets_api/users_pets.json';
  bool isLoading = true;
  String error = '';
  PetsModel pets = PetsModel(data: []);

  getDataFromApi() async {
    try {
      Response response = await http.get(Uri.parse(apiEndpoint));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        pets = PetsModel.fromJson(data);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
