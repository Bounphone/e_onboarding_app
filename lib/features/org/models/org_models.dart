import 'dart:convert';

OrgModel orgModelFromJson(String str) => OrgModel.fromJson(json.decode(str));

String orgModelToJson(OrgModel data) => json.encode(data.toJson());

class OrgModel {
  OrgModel({
    this.creatorEmail,
    this.members,
    this.orgCreatedTime,
    this.orgDescription,
    this.orgName,
    this.reqMembers,
  });

  String? creatorEmail;
  List<Member>? members;
  String? orgCreatedTime;
  String? orgDescription;
  String? orgName;
  List<Member>? reqMembers;

  factory OrgModel.fromJson(Map<String, dynamic> json) => OrgModel(
        creatorEmail:
            json["creatorEmail"] == null ? null : json["creatorEmail"],
        members: json["members"] == null
            ? null
            : List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
        orgCreatedTime:
            json["orgCreatedTime"] == null ? null : json["orgCreatedTime"],
        orgDescription:
            json["orgDescription"] == null ? null : json["orgDescription"],
        orgName: json["orgName"] == null ? null : json["orgName"],
        reqMembers: json["reqMembers"] == null
            ? null
            : List<Member>.from(
                json["reqMembers"].map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "creatorEmail": creatorEmail == null ? null : creatorEmail,
        "members": members == null
            ? null
            : List<dynamic>.from(members!.map((x) => x.toJson())),
        "orgCreatedTime": orgCreatedTime == null ? null : orgCreatedTime,
        "orgDescription": orgDescription == null ? null : orgDescription,
        "orgName": orgName == null ? null : orgName,
        "reqMembers": reqMembers == null
            ? null
            : List<dynamic>.from(reqMembers!.map((x) => x.toJson())),
      };
}

class Member {
  Member({
    this.memberEmail,
    this.memberFirstName,
    this.memberLastName,
    this.reqStatus,
  });

  String? memberEmail;
  String? memberFirstName;
  String? memberLastName;
  String? reqStatus;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        memberEmail: json["memberEmail"] == null ? null : json["memberEmail"],
        memberFirstName:
            json["memberFirstName"] == null ? null : json["memberFirstName"],
        memberLastName:
            json["memberLastName"] == null ? null : json["memberLastName"],
        reqStatus: json["reqStatus"] == null ? null : json["reqStatus"],
      );

  Map<String, dynamic> toJson() => {
        "memberEmail": memberEmail == null ? null : memberEmail,
        "memberFirstName": memberFirstName == null ? null : memberFirstName,
        "memberLastName": memberLastName == null ? null : memberLastName,
        "reqStatus": reqStatus == null ? null : reqStatus,
      };
}
