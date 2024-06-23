import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {

  bool _isLoading = false;
  bool get loading => _isLoading;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  void login(String email, String password) async {

    setLoading(true);

    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {"email": email, "password": password},
      );

      if(response.statusCode == 200){
        setLoading(false);
        print('Successfull');
      }else{
        setLoading(false);
        print('failed');
      }

    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
