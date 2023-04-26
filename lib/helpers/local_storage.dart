import 'package:shared_preferences/shared_preferences.dart';

class IdStoring {
  static SharedPreferences? preferences;

  static Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future setName(name) async {
    await preferences!.setString("name", name);
  }

  static Future getName() async {
    return preferences!.getString("name");
  }

  static Future setEmail(email) async {
    await preferences!.setString("email", email);
  }

  static Future getEmail() async {
    return preferences!.getString("email");
  }

  static Future setPhone(phone) async {
    await preferences!.setString("phone", phone);
  }

  static Future getPhone() async {
    return preferences!.getString("phone");
  }

  static Future setPassword(password) async {
    await preferences!.setString("password", password);
  }

  static Future getPassword() async {
    return preferences!.getString("password");
  }

  static Future setProfession(profession) async {
    await preferences!.setString("profession", profession);
  }

  static Future getProfession() async {
    return preferences!.getString("profession");
  }

  static Future setIsLogged(logged) async {
    await preferences!.setBool("logged", logged);
  }

  static Future getIsLogged() async {
    return preferences!.getBool("logged");
  }
}
