import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test4/random_dog_img/api_service.dart';
import 'package:test4/random_dog_img/dog_model.dart';

class DogProvider with ChangeNotifier {
  DogImage? _currentDog;
  List<DogImage> _history = [];

  DogImage? get currentDog => _currentDog;
  List<DogImage> get history => _history;

  final DogApiService _dogApiService = DogApiService();


  DogProvider(){
    _loadHistory();
  }

  //===============fetching Random Dog ====================
  Future<void> fetchRandomDog() async {
    _currentDog = await _dogApiService.fetchRandomDogImage();
    _history.add(_currentDog!);
    _saveHistory();
    notifyListeners();
  }

  //================= Saving History in storage ======================
  void _saveHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'history',
        jsonEncode(_history
            .map((dog) => {'message': dog.imageUrl, 'status': dog.status})
            .toList()));
  }
  //================== Loading History from storage ==================
  void _loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? historyString = prefs.getString('history');
    print("====================================${historyString}");
    if (historyString!=null){
      List<dynamic> historyJson = jsonDecode(historyString);
      _history = historyJson.map((json) => DogImage.fromJson(json)).toList();
      notifyListeners();
    }
  }

  // ========================= Clearing History ========================
  Future<void> clearHistory() async{
    _history = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('history');
    notifyListeners();
  }


}
