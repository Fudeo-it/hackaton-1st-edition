// TODO: Change to Isar Database

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  final Future<SharedPreferences> sharedPrefs;

  const Storage({required this.sharedPrefs});

  Future<void> setStringList(String key, List<String> value) async {
    final SharedPreferences prefs = await sharedPrefs;
    await prefs.setStringList(key, value);
  }

  Future<List<String>?> getStringList(String key) async {
    final SharedPreferences prefs = await sharedPrefs;
    return prefs.getStringList(key);
  }
}
