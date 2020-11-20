import 'package:flutter/foundation.dart';

class PersonData extends ChangeNotifier {
  String _name;
  String _gender;
  String _state;
  String _city;

  void addName(String name) {
    _name = name;
    notifyListeners();
  }

  void addGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  void addState(String state) {
    _state = state;
    notifyListeners();
  }

  void addCity(String city) {
    _city = city;
    notifyListeners();
  }

  String get name => _name;
  String get gender => _gender;
  String get state => _state;
  String get city => _city;
}
