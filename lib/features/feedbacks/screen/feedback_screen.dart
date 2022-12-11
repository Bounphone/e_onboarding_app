import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:e_onboarding_app/features/feedbacks/models/feedback_models.dart';
import 'package:e_onboarding_app/features/org/view_model/org_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'feedback_comment.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseCollection.organizations.snapshots(),
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

                          /// if assignee's email == user's email
                          if (feedbackModel.orgFeedback == orgName) {
                            return Container();
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
}
