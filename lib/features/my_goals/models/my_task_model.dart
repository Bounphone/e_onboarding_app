import 'dart:convert';

MyTaskModel myTaskModelFromJson(String str) => MyTaskModel.fromJson(json.decode(str));

String myTaskModelToJson(MyTaskModel data) => json.encode(data.toJson());

class MyTaskModel {
  MyTaskModel({
    this.assigneeEmail,
    this.assigneeFirstname,
    this.assigneeLastname,
    this.assignorEmail,
    this.assignorFirstname,
    this.assignorLastname,
    this.taskCreatedTime,
    this.taskDetail,
    this.taskTitle,
    this.taskStatus,
    this.organizationName,
  });

  String? assigneeEmail;
  String? assigneeFirstname;
  String? assigneeLastname;
  String? assignorEmail;
  String? assignorFirstname;
  String? assignorLastname;
  String? taskCreatedTime;
  String? taskDetail;
  String? taskTitle;
  String? taskStatus;
  String? organizationName;

  factory MyTaskModel.fromJson(Map<String, dynamic> json) => MyTaskModel(
    assigneeEmail: json["assigneeEmail"],
    assigneeFirstname: json["assigneeFirstname"],
    assigneeLastname: json["assigneeLastname"],
    assignorEmail: json["assignorEmail"],
    assignorFirstname: json["assignorFirstname"],
    assignorLastname: json["assignorLastname"],
    taskCreatedTime: json["taskCreatedTime"],
    taskDetail: json["taskDetail"],
    taskTitle: json["taskTitle"],
    taskStatus: json["taskStatus"] ,
    organizationName: json["organizationName"],
  );

  Map<String, dynamic> toJson() => {
    "assigneeEmail": assigneeEmail,
    "assigneeFirstname": assigneeFirstname,
    "assigneeLastname": assigneeLastname,
    "assignorEmail": assignorEmail,
    "assignorFirstname": assignorFirstname,
    "assignorLastname": assignorLastname,
    "taskCreatedTime": taskCreatedTime,
    "taskDetail": taskDetail,
    "taskTitle": taskTitle,
    "taskStatus": taskStatus,
    "organizationName": organizationName,
  };
}
