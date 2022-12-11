import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:e_onboarding_app/features/home/home_vm/home_vm.dart';
import 'package:e_onboarding_app/features/home/my_goals/models/my_task_model.dart';
import 'package:e_onboarding_app/features/home/my_goals/screens/add_task_screen.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyGoalScreen extends StatefulWidget {
  const MyGoalScreen({Key? key}) : super(key: key);

  @override
  State<MyGoalScreen> createState() => _MyGoalScreenState();
}

class _MyGoalScreenState extends State<MyGoalScreen> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(
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
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text('Task progress',
                          //         style: TextStyle(fontSize: 14.sp)),
                          //     Text(
                          //       '10%',
                          //       style: TextStyle(fontSize: 14.sp),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 5.h),
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

                              /// Parse data to model
                              MyTaskModel taskData = MyTaskModel.fromJson(data);

                              /// if assignee's email == user's email
                              if (taskData.assigneeEmail ==
                                  model.getEmail) {
                                return SizedBox(
                                  width: double.infinity,
                                  child: Card(
                                    elevation: 5,
                                    shape: const Border.fromBorderSide(
                                        BorderSide(
                                            color: AppColor.secondColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            taskData.taskTitle ?? 'ບໍ່ມີ',
                                          ),
                                          Text(taskData.taskDetail ??
                                              'ບໍ່ມີ'),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h,
                                                  horizontal: 20.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey),
                                              child: Text(
                                                  taskData.taskStatus ??
                                                      'None'),
                                            ),
                                          )
                                        ],
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
    );
  }
}
