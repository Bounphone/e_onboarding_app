import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:e_onboarding_app/features/feedbacks/models/feedback_models.dart';
import 'package:e_onboarding_app/features/feedbacks/view_models/feedback_vm.dart';
import 'package:e_onboarding_app/features/my_goals/screens/my_goals_detail_screen.dart';
import 'package:e_onboarding_app/features/org/view_model/org_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'feedback_comment.dart';

class FeedbackScreen extends StatefulWidget {

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseCollection.feedback.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            /// Error
            if (snapshot.hasError) {
              return Text('Something went wrong ${snapshot.error}');
            }

            /// Loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Feedback',
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold)),
                            CircleAvatar(
                              backgroundColor: AppColor.secondColor,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return FeedbackComment();
                                    }));
                                  },
                                  icon: Icon(Icons.add,
                                      color: AppColor.primaryColor)),
                            ),
                          ],
                        ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          String? orgName = context.read<OrgVM>().getOrgName;

                          /// Parse data to model
                          FeedbackModel feedbackModel =
                              FeedbackModel.fromJson(data);

                          /// query via org name
                          if (feedbackModel.orgFeedback == orgName) {
                            String title = feedbackModel.title ?? 'none';
                            String detail = feedbackModel.detail ?? 'none';
                            return GestureDetector(
                              onTap: () {
                                /// Navigate to detail
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return MyGoalsDetailScreen(
                                    title: title,
                                    detail: detail,
                                  );
                                }));
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      side: const BorderSide(
                                          color: AppColor.primaryColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(title,
                                            style: TextStyle(
                                                color: AppColor.primaryColor,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(height: 10),
                                        Text(detail,
                                            style: TextStyle(fontSize: 14.sp)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            button(context, feedbackModel,
                                                document, true),
                                            button(context, feedbackModel,
                                                document, false),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container();
                        }).toList(),
                      )
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }

  Row button(BuildContext context, FeedbackModel feedbackModel,
      DocumentSnapshot<Object?> document, bool isLiked) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              /// On click button
              context
                  .read<FeedbackVM>()
                  .onLikeFeedBack(feedbackModel, document.id, context, isLiked);
            },
            icon: Icon(isLiked ? Icons.thumb_up : Icons.thumb_down)),
        Text(
            '${isLiked ? feedbackModel.liked!.length ?? 0 : feedbackModel.unLiked!.length ?? 0}')
      ],
    );
  }
}
