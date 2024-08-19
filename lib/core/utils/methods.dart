import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/service/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Methods {
//singleton class
  Methods._internal();

  static final instance = Methods._internal();

  factory Methods() => instance;

  Future<void> clearAuth() async {
    SharedPreferences preference = getIt();
    preference.remove(StringManager.userDataKey);
    preference.remove(StringManager.userTokenKey);
    preference.remove(StringManager.deviceToken);
  }

  Future<void> saveUserToken({String? authToken}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (authToken != null) {
      preferences.setString(StringManager.userTokenKey, authToken);
    } else {
      preferences.setString(StringManager.userTokenKey, authToken ?? "noToken");
    }
  }

  Future<String> returnUserToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokenPref =
        preferences.getString(StringManager.userTokenKey) ?? "noToken";
    return tokenPref;
  }

  Future<void> Sign_in() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_logged', true) ?? false;
  }

  Future<void> Sign_out() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('is_logged');
  }

  Future<bool> isSignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('is_logged')!) {
      return true;
    } else {
      return false;
    }
  }
}
