import 'package:flutter/foundation.dart';

class FavouriteItemProvider with ChangeNotifier{

  List<String> _selectedItem = [];
  List<String> get dogBreeds => _selectedItem;

  void addItem(String value){
    _selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(String value){
    _selectedItem.remove(value);
    notifyListeners();
  }

}