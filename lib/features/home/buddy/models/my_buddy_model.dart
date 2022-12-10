import 'dart:convert';

MyBuddyModel myBuddyModelFromJson(String str) =>
    MyBuddyModel.fromJson(json.decode(str));

String myBuddyModelToJson(MyBuddyModel data) => json.encode(data.toJson());

class MyBuddyModel {
  MyBuddyModel({
    this.orgName,
    this.userEmail,
    this.buddies,
  });

  String? orgName;
  String? userEmail;
  List<Buddy>? buddies;

  factory MyBuddyModel.fromJson(Map<String, dynamic> json) => MyBuddyModel(
    orgName: json["orgName"] == null ? null : json["orgName"],
    userEmail: json["userEmail"] == null ? null : json["userEmail"],
    buddies: json["buddies"] == null
        ? null
        : List<Buddy>.from(json["buddies"].map((x) => Buddy.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orgName": orgName == null ? null : orgName,
    "userEmail": userEmail == null ? null : userEmail,
    "buddies": buddies == null
        ? null
        : List<dynamic>.from(buddies!.map((x) => x.toJson())),
  };
}


class Buddy {
  Buddy({
    this.buddyEmail,
    this.buddyName,
    this.buddySurname,
  });

  String? buddyEmail;
  String? buddyName;
  String? buddySurname;

  factory Buddy.fromJson(Map<String, dynamic> json) => Buddy(
        buddyEmail: json["buddyEmail"] == null ? null : json["buddyEmail"],
        buddyName: json["buddyName"] == null ? null : json["buddyName"],
        buddySurname:
            json["buddySurname"] == null ? null : json["buddySurname"],
      );

  Map<String, dynamic> toJson() => {
        "buddyEmail": buddyEmail == null ? null : buddyEmail,
        "buddyName": buddyName == null ? null : buddyName,
        "buddySurname": buddySurname == null ? null : buddySurname,
      };
}
