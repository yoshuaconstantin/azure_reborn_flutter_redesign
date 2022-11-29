import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

class Preferences {
  static Preferences? _instance;

  Preferences._internal();
  
  static Preferences getInstance() {
    if (_instance == null) {
      _instance = Preferences._internal();
    }
    
    return _instance!;
  }

  late SharedPreferences sharedPreferences;

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool? getBool(SharedPreferenceKey sharedPreferenceKey, [bool? defValue]) {
    return sharedPreferences.getBool(sharedPreferenceKey.name) ?? defValue;
  }

  int? getInt(SharedPreferenceKey sharedPreferenceKey, [int? defValue]) {
    return sharedPreferences.getInt(sharedPreferenceKey.name) ?? defValue;
  }

  double? getDouble(SharedPreferenceKey sharedPreferenceKey, [double? defValue]) {
    return sharedPreferences.getDouble(sharedPreferenceKey.name) ?? defValue;
  }

  String? getString(SharedPreferenceKey sharedPreferenceKey, [String? defValue]) {
    return sharedPreferences.getString(sharedPreferenceKey.name) ?? defValue;
  }

  List<String>? getStrings(SharedPreferenceKey sharedPreferenceKey, [List<String>? defValue]) {
    return sharedPreferences.getStringList(sharedPreferenceKey.name) ?? defValue;
  }

  void setBool(SharedPreferenceKey sharedPreferenceKey, bool? value) {
    if (value != null) {
      sharedPreferences.setBool(sharedPreferenceKey.name, value);
    }
  }

  void setInt(SharedPreferenceKey sharedPreferenceKey, int? value) {
    if (value != null) {
      sharedPreferences.setInt(sharedPreferenceKey.name, value);
    }
  }

  void setDouble(SharedPreferenceKey sharedPreferenceKey, double? value) {
    if (value != null) {
      sharedPreferences.setDouble(sharedPreferenceKey.name, value);
    }
  }

  void setString(SharedPreferenceKey sharedPreferenceKey, String? value) {
    if (value != null) {
      sharedPreferences.setString(sharedPreferenceKey.name, value);
    }
  }

  void setStrings(SharedPreferenceKey sharedPreferenceKey, List<String>? value) {
    if (value != null) {
      sharedPreferences.setStringList(sharedPreferenceKey.name, value);
    }
  }

  void remove(SharedPreferenceKey sharedPreferenceKey) {
    sharedPreferences.remove(sharedPreferenceKey.name);
  }

  bool contain(SharedPreferenceKey sharedPreferenceKey) {
    return sharedPreferences.containsKey(sharedPreferenceKey.name);
  }

  void clear() {
    sharedPreferences.clear();
  }

  reload() async {
    await sharedPreferences.reload();
  }
}