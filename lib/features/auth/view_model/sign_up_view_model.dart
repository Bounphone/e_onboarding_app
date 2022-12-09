import 'package:flutter/cupertino.dart';

class SignUpViewModel extends ChangeNotifier{
  String? _firstname;
  String? get firstname => _firstname;

  String? _lastname;
  String? get lastname => _lastname;

  String? _birthdate;
  String? get birthdate => _birthdate;

  String? _email;
  String? get email => _email;

  String? _password;
  String? get password => _password;

  String? _buddyId;
  String? get buddyId => _buddyId;

  setFirstname(String? firstname){
    _firstname = firstname;
    notifyListeners();
  }
}