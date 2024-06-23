import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test4/random_dog_img/dog_model.dart';

class DogApiService{
  Future<DogImage> fetchRandomDogImage() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if(response.statusCode == 200){
      return DogImage.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load the Dog Image');
    }
  }
}