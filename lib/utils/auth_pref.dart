import 'package:shared_preferences/shared_preferences.dart';

class AuthPref {
  final firstName = 'firstName';
  final lastName = 'firstName';
  final email = 'email';
  final birthday = 'birthday';

  /// set first name to Local DB
   Future<void> saveFirstName(String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(firstName, val);
  }

  /// set last name to Local DB
  Future<void> saveLastName(String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(lastName, val);
  }

  /// set email to Local DB
  Future<void> saveEmail(String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(email, val);
  }

  /// set birthday to Local DB
  Future<void> saveBirthday(String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(birthday, val);
  }

  Future<String?> getFirstName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(firstName);
  }

  Future<String?> getLastName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(lastName);
  }

  Future<String?> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(email);
  }

  Future<String?> getBirthday() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(birthday);
  }
}
