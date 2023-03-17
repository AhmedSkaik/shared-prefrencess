import 'package:shared_preferences/shared_preferences.dart';

import '../Modals/User.dart';

enum PrefKeys { name, email, logedIn }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPrefances() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  Future<void> save(User user) async {
    await _sharedPreferences.setString(PrefKeys.name.name, user.name);
    await _sharedPreferences.setString(PrefKeys.email.name, user.email);
    await _sharedPreferences.setBool(PrefKeys.logedIn.name, true);
  }

  bool get logedIn =>
      _sharedPreferences.getBool(PrefKeys.logedIn.name) ?? false;

  Future<bool> deleteValueFor({required String key}) async {
    if (_sharedPreferences.containsKey(key)) {
      return await _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
