import 'dart:convert';

MyTaskModel myTaskModelFromJson(String str) =>
    MyTaskModel.fromJson(json.decode(str));

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
    this.organizationName,
    this.taskStatus,
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
  String? organizationName;
  String? taskStatus;

  factory MyTaskModel.fromJson(Map<String, dynamic> json) => MyTaskModel(
    assigneeEmail:
    json["assigneeEmail"] == null ? null : json["assigneeEmail"],
    assigneeFirstname: json["assigneeFirstname"] == null
        ? null
        : json["assigneeFirstname"],
    assigneeLastname:
    json["assigneeLastname"] == null ? null : json["assigneeLastname"],
    assignorEmail:
    json["assignorEmail"] == null ? null : json["assignorEmail"],
    assignorFirstname: json["assignorFirstname"] == null
        ? null
        : json["assignorFirstname"],
    assignorLastname:
    json["assignorLastname"] == null ? null : json["assignorLastname"],
    taskCreatedTime:
    json["taskCreatedTime"] == null ? null : json["taskCreatedTime"],
    taskDetail: json["taskDetail"] == null ? null : json["taskDetail"],
    taskTitle: json["taskTitle"] == null ? null : json["taskTitle"],
    organizationName:
    json["organizationName"] == null ? null : json["organizationName"],
    taskStatus: json["taskStatus"] == null ? null : json["taskStatus"],
  );

  Map<String, dynamic> toJson() => {
    "assigneeEmail": assigneeEmail == null ? null : assigneeEmail,
    "assigneeFirstname":
    assigneeFirstname == null ? null : assigneeFirstname,
    "assigneeLastname": assigneeLastname == null ? null : assigneeLastname,
    "assignorEmail": assignorEmail == null ? null : assignorEmail,
    "assignorFirstname":
    assignorFirstname == null ? null : assignorFirstname,
    "assignorLastname": assignorLastname == null ? null : assignorLastname,
    "taskCreatedTime": taskCreatedTime == null ? null : taskCreatedTime,
    "taskDetail": taskDetail == null ? null : taskDetail,
    "taskTitle": taskTitle == null ? null : taskTitle,
    "organizationName": organizationName == null ? null : organizationName,
    "taskStatus": taskStatus == null ? null : taskStatus,
  };
}

