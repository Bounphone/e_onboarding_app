import 'package:e_onboarding_app/features/auth/model/user_profile_model.dart';
import 'package:e_onboarding_app/features/org/screens/org_screen.dart';
import 'package:e_onboarding_app/features/home/screens/home_screen.dart';
import 'package:e_onboarding_app/utils/shared_pref/auth_pref.dart';
import 'package:flutter/material.dart';

Future<void> checkLogin(BuildContext context) async {
  String? email = await AuthPref().getEmail();
  String? firstName = await AuthPref().getFirstName();
  String? lastName = await AuthPref().getLastName();
  String? birthday = await AuthPref().getBirthday();

  /// if user ever login, go dashboard
  if (email != null &&
      firstName != null &&
      lastName != null &&
      birthday != null) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
      return OrgScreen();
    }), (route) => false);
  }
}
