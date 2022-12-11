import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    this.birthDay,
    this.email,
    this.firstName,
    this.lastName,
    this.orgs,
  });

  String? birthDay;
  String? email;
  String? firstName;
  String? lastName;
  List<Org>? orgs;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        birthDay: json["birthDay"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        orgs: json["orgs"] == null
            ? null
            : List<Org>.from(json["orgs"].map((x) => Org.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "birthDay": birthDay,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "orgs": orgs == null
            ? null
            : List<dynamic>.from(orgs!.map((x) => x.toJson())),
      };
}

class Org {
  Org({
    this.joinedTime,
    this.orgDescription,
    this.orgName,
    this.orgStatus,
    this.orgID,
  });

  String? joinedTime;
  String? orgDescription;
  String? orgName;
  String? orgStatus;
  String? orgID;

  factory Org.fromJson(Map<String, dynamic> json) => Org(
        joinedTime: json["joinedTime"],
        orgDescription:
            json["orgDescription"],
        orgName: json["orgName"],
        orgStatus: json["orgStatus"],
    orgID: json["orgID"],
      );

  Map<String, dynamic> toJson() => {
        "joinedTime": joinedTime,
        "orgDescription": orgDescription,
        "orgName": orgName,
        "orgStatus": orgStatus,
    "orgID": orgID,
      };
}
