// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const ACCESS_TOKEN = "ACCESS_TOKEN";

abstract class LocalStorage {
  Future<void> initialize();

  /// get data from local storage as json format
  /// return null if the data doesn't exist
  Map<String, dynamic> getJson(String key);

  /// set a json type to the local storage
  Future<bool> setJson(String key, Map<String, dynamic> dict);

  /// get string list from local storage
  List<String> getStringList(String key);

  /// set string list from local storage
  Future<bool> setStringList(String key, List<String> stringList);

  /// set boolean value to the local storage
  Future<bool> setBool(String key, bool value);

  /// get the value as boolean and return false if the key doesn't exist
  bool getBool(String key);

  String getString(String key);

  Future<bool> setString(String key, String value);

  int getInt(String key);

  Future<bool> setInt(String key, int value);

  /// remove key from the local storage
  Future<bool> remove(String key);

  Future<bool> clear();

  factory LocalStorage() {
    return _LocalStorage();
  }
}

class _LocalStorage implements LocalStorage {
  late SharedPreferences prefs;

  @override
  Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Map<String, dynamic> getJson(String key) {
    final value = prefs.getString(key);
    if (value == null) {
      return {"": ""};
    }
    try {
      return jsonDecode(value);
      // FormatException can be raised but make it wild to cover all the unexpected exceptions
    } catch (err) {
      return jsonDecode("");
    }
  }

  @override
  Future<bool> setJson(String key, Map<String, dynamic> dict) async {
    final value = jsonEncode(dict);
    return prefs.setString(key, value);
  }

  @override
  List<String> getStringList(String key) {
    final value = prefs.getStringList(key);
    if (value == null) {
      return [];
    }
    return value;
  }

  @override
  Future<bool> setStringList(String key, List<String> stringList) async {
    return prefs.setStringList(key, stringList);
  }

  @override
  Future<bool> remove(String key) async {
    return prefs.remove(key);
  }

  @override
  Future<bool> setBool(String key, bool value) {
    return prefs.setBool(key, value);
  }

  @override
  bool getBool(String key) {
    final value = prefs.getBool(key);
    if (value == null) {
      return false;
    }
    return value;
  }

  @override
  String getString(String key) {
    return prefs.getString(key) ?? "";
  }

  @override
  Future<bool> setString(String key, String value) async {
    return prefs.setString(key, value);
  }

  @override
  Future<bool> clear() async {
    return prefs.clear();
  }

  @override
  int getInt(String key) {
    return prefs.getInt(key) ?? -1;
  }

  @override
  Future<bool> setInt(String key, int value) {
    return prefs.setInt(key, value);
  }
}
