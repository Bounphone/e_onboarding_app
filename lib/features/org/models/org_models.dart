import 'dart:convert';

OrgModel orgModelFromJson(String str) => OrgModel.fromJson(json.decode(str));

String orgModelToJson(OrgModel data) => json.encode(data.toJson());

class OrgModel {
  OrgModel({
    this.data,
  });

  Data? data;

  factory OrgModel.fromJson(Map<String, dynamic> json) => OrgModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    creatorEmail: json["creatorEmail"],
    members: json["members"] == null ? null : List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
    orgCreatedTime: json["orgCreatedTime"],
    orgDescription: json["orgDescription"],
    orgName: json["orgName"],
    reqMembers: json["reqMembers"] == null ? null : List<Member>.from(json["reqMembers"].map((x) => Member.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "creatorEmail": creatorEmail,
    "members": members == null ? null : List<dynamic>.from(members!.map((x) => x.toJson())),
    "orgCreatedTime": orgCreatedTime,
    "orgDescription": orgDescription,
    "orgName": orgName,
    "reqMembers": reqMembers == null ? null : List<dynamic>.from(reqMembers!.map((x) => x.toJson())),
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
    memberEmail: json["memberEmail"],
    memberFirstName: json["memberFirstName"],
    memberLastName: json["memberLastName"],
    reqStatus: json["reqStatus"],
  );

  Map<String, dynamic> toJson() => {
    "memberEmail": memberEmail,
    "memberFirstName": memberFirstName,
    "memberLastName": memberLastName,
    "reqStatus": reqStatus,
  };
}
