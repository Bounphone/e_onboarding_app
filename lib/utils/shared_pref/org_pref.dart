import 'package:shared_preferences/shared_preferences.dart';

class OrgPref {
  final orgName = 'orgName';
  final orgDescription = 'orgDescription';
  final orgID = 'orgID';

  /// set orgName to Local DB
  Future<void> saveOrgName(String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(orgName, val);
  }

  /// set orgDescription to Local DB
  Future<void> saveOrgDescription(String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(orgDescription, val);
  }

  /// set orgID to Local DB
  Future<void> saveOrgID(String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(orgID, val);
  }

  /// get orgName to Local DB
  Future<String?> getOrgName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(orgName);
  }

  /// get orgDescription to Local DB
  Future<String?> getOrgDescription() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(orgDescription);
  }

  /// get orgID to Local DB
  Future<String?> getOrgID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(orgID);
  }
}
