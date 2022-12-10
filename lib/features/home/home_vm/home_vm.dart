import 'package:e_onboarding_app/utils/auth_pref.dart';
import 'package:flutter/cupertino.dart';

class HomeVM extends ChangeNotifier {
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _birthDay;

  String? get getEmail => _email;
  String? get getFirstName => _firstName;
  String? get getLastName => _lastName;
  String? get getBirthDay => _birthDay;

  Future<void> initUserData() async {
    _email = await AuthPref().getEmail();
    _firstName = await AuthPref().getFirstName();
    _lastName = await AuthPref().getLastName();
    _birthDay = await AuthPref().getBirthday();
    notifyListeners();
  }
}
