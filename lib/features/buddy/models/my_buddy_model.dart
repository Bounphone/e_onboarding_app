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
    orgName: json["orgName"],
    userEmail: json["userEmail"],
    buddies: json["buddies"] == null
        ? null
        : List<Buddy>.from(json["buddies"].map((x) => Buddy.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orgName": orgName,
    "userEmail": userEmail,
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
        buddyEmail: json["buddyEmail"],
        buddyName: json["buddyName"],
        buddySurname:
            json["buddySurname"],
      );

  Map<String, dynamic> toJson() => {
        "buddyEmail": buddyEmail,
        "buddyName": buddyName,
        "buddySurname": buddySurname,
      };
}
