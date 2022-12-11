import 'package:e_onboarding_app/features/home/screens/home_screen.dart';
import 'package:e_onboarding_app/utils/shared_pref/org_pref.dart';
import 'package:flutter/material.dart';

class OrgVM extends ChangeNotifier {
  String? _orgID;
  String? _orgDescription;
  String? _orgName;

  String? get getOrgID => _orgID;
  String? get getOrgDescription => _orgDescription;
  String? get getOrgName => _orgName;

  /// When select an organization
  Future<void> onSelectOrg(String orgName, String orgDescription, String orgID,
      BuildContext context) async {
    try {
      _orgID = orgID;
      _orgDescription = orgDescription;
      _orgName = orgName;
      await OrgPref().saveOrgID(orgID);
      await OrgPref().saveOrgDescription(orgDescription);
      await OrgPref().saveOrgName(orgName);
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return HomeScreens();
      }));
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}
