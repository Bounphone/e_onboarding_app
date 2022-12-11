import 'dart:convert';

FeedbackModel feedbackModelFromJson(String str) => FeedbackModel.fromJson(json.decode(str));

String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
  FeedbackModel({
    this.title,
    this.detail,
    this.postTime,
    this.liked,
    this.unLiked,
    this.orgFeedback,
  });

  String? title;
  String? detail;
  String? postTime;
  List<String>? liked;
  List<String>? unLiked;
  String? orgFeedback;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
    title: json["title"] == null ? null : json["title"],
    detail: json["detail"] == null ? null : json["detail"],
    postTime: json["postTime"] == null ? null : json["postTime"],
    liked: json["liked"] == null ? null : List<String>.from(json["liked"].map((x) => x)),
    unLiked: json["unLiked"] == null ? null : List<String>.from(json["unLiked"].map((x) => x)),
    orgFeedback: json["orgFeedback"] == null ? null : json["orgFeedback"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "detail": detail == null ? null : detail,
    "postTime": postTime == null ? null : postTime,
    "liked": liked == null ? null : List<dynamic>.from(liked!.map((x) => x)),
    "unLiked": unLiked == null ? null : List<dynamic>.from(unLiked!.map((x) => x)),
    "orgFeedback": orgFeedback == null ? null : orgFeedback,
  };
}
