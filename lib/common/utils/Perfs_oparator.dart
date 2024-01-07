import 'package:eshakmohsen/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsOprator {
  SharedPreferences sharedPreferences;

  PrefsOprator() : sharedPreferences = locator();

  chnagestateintro() async {
    sharedPreferences.setBool("showintro", false);
  }

  getintro() async {
    return sharedPreferences.get("showintro") ?? true;
  }
}
