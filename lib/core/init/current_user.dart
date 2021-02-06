import 'package:shared_preferences/shared_preferences.dart';

class CurrentUser {
  bool isLogged = getPrefs() as bool;
}

Future<bool> getPrefs() async {
  var prefs = await SharedPreferences.getInstance();

  return prefs.getBool('isLogged');
}
