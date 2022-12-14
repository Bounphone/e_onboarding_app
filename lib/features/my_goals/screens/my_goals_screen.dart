import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:e_onboarding_app/features/home/home_vm/home_vm.dart';
import 'package:e_onboarding_app/features/my_goals/models/my_task_model.dart';
import 'package:e_onboarding_app/features/my_goals/screens/my_goals_detail_screen.dart';
import 'package:e_onboarding_app/features/org/view_model/org_vm.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/button/my_goal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'add_task_screen.dart';

class MyGoalScreen extends StatefulWidget {
  String? status;
  MyGoalScreen({this.status});

  @override
  State<MyGoalScreen> createState() => _MyGoalScreenState();
}

class _MyGoalScreenState extends State<MyGoalScreen> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeVM>(
        builder: (context, model, _) {
          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseCollection.myTask.snapshots(),
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

              /// Success
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      if (widget.status == null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My Goals',
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            Switch(
                              value: isSwitch,
                              onChanged: (value) {
                                isSwitch = value;
                                setState(() {});
                              },
                              activeTrackColor: AppColor.primaryColor,
                              activeColor: AppColor.secondColor,
                            )
                          ],
                        ),
                      if (isSwitch)
                        Column(
                          children: [
                            SizedBox(height: 5.h),
                            if (widget.status == null)
                              ButtonWidgets(
                                  title: 'Add new task',
                                  onPress: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return AddTaskScreen();
                                    }));
                                  }),
                            ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                String? orgName =
                                    context.read<OrgVM>().getOrgName;

                                /// Parse data to model
                                MyTaskModel taskData =
                                    MyTaskModel.fromJson(data);

                                /// if assignee's email == user's email && the same org name when login
                                if (taskData.assigneeEmail == model.getEmail &&
                                    taskData.organizationName == orgName) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyGoalsDetailScreen(
                                                    title: taskData.taskTitle ??
                                                        "",
                                                    detail:
                                                        taskData.taskDetail ??
                                                            "",
                                                  )));
                                    },
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            side: const BorderSide(
                                                color: AppColor.primaryColor)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                taskData.taskTitle ?? '???????????????',
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(taskData.taskDetail ??
                                                  '???????????????'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              MyGoalButton(
                                                  taskData: taskData,
                                                  id: document.id)
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
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
