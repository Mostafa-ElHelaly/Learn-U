import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/service/service_locator.dart';
import 'package:Learn_U/features/category/data/model/reviews_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:html/parser.dart' as html_parser;

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

  Future<bool> isSignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('is_logged')!) {
      return true;
    } else {
      return false;
    }
  }

  String fetch_current_languagecode(BuildContext context) {
    String localetype = Localizations.localeOf(context).languageCode;
    return localetype;
  }

  String convertToArabicNumbers(String input) {
    const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return input.split('').map((char) {
      if (char.contains(RegExp(r'[0-9]'))) {
        return arabicDigits[int.parse(char)];
      } else {
        return char;
      }
    }).join();
  }

  String transformFromHtml(String html) {
    return html_parser.parse(html).body?.text ?? '';
  }

  double Calculate_Rating(List<ReviewsModel> totalreview) {
    double sum = 0.0;
    for (var review in totalreview) {
      sum += double.parse(review.review.toString());
    }

    // Calculate and return the average
    return (sum / totalreview.length) / 2;
  }
}
