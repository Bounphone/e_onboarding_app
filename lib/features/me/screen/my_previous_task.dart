import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPreviousTaskScreen extends StatefulWidget {
  const MyPreviousTaskScreen({Key? key}) : super(key: key);

  @override
  State<MyPreviousTaskScreen> createState() => _MyPreviousTaskState();
}

class _MyPreviousTaskState extends State<MyPreviousTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatarIconWidget(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Previous task',
                  style: TextStyle(
                      fontSize: 25.sp,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             MyGoalsDetailScreen(
                  //               title: taskData.taskTitle ?? "",
                  //               detail: taskData.taskDetail ?? "",
                  //               showButton: true,
                  //             )));
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        side: const BorderSide(color: AppColor.primaryColor)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('title',
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 18.sp, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10.h),
                          Text('ບໍ່ມີ'),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                // data.update('taskStatus',
                                //         (value) {
                                //       return value ==
                                //           'Do the task'
                                //           ? 'Completed'
                                //           : 'Do the task';
                                //     });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 20.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey),
                                child: Text(
                                  'Complete',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
