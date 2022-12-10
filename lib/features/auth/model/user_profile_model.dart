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
        birthDay: json["birthDay"] == null ? null : json["birthDay"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        orgs: json["orgs"] == null
            ? null
            : List<Org>.from(json["orgs"].map((x) => Org.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "birthDay": birthDay == null ? null : birthDay,
        "email": email == null ? null : email,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
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
  });

  String? joinedTime;
  String? orgDescription;
  String? orgName;
  String? orgStatus;

  factory Org.fromJson(Map<String, dynamic> json) => Org(
        joinedTime: json["joinedTime"] == null ? null : json["joinedTime"],
        orgDescription:
            json["orgDescription"] == null ? null : json["orgDescription"],
        orgName: json["orgName"] == null ? null : json["orgName"],
        orgStatus: json["orgStatus"] == null ? null : json["orgStatus"],
      );

  Map<String, dynamic> toJson() => {
        "joinedTime": joinedTime == null ? null : joinedTime,
        "orgDescription": orgDescription == null ? null : orgDescription,
        "orgName": orgName == null ? null : orgName,
        "orgStatus": orgStatus == null ? null : orgStatus,
      };
}
