import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnCompleteTaskScreen extends StatefulWidget {
  const UnCompleteTaskScreen({Key? key}) : super(key: key);

  @override
  State<UnCompleteTaskScreen> createState() => _UnCompleteTaskScreenState();
}

class _UnCompleteTaskScreenState extends State<UnCompleteTaskScreen> {
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
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Uncompleted task',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      color: AppColor.primaryColor)),
              SizedBox(height: 10.h),
              SizedBox(
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
                        Text('title', style: TextStyle(fontSize: 18.sp, color: AppColor.primaryColor)),
                        SizedBox(height: 10.h),
                        Text('detail'),
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
                                  vertical: 8.h,
                                  horizontal: 20.w),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10),
                                  color: AppColor.primaryColor),
                              child: Text('Do the task',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight:
                                    FontWeight.w700),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          )
        ));
  }
}
