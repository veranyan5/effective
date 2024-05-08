import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService._();
  late SharedPreferences _prefs;

  static final StorageService _instance = StorageService._();

  static StorageService get instance => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }
}
