import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyGoalsDetailScreen extends StatefulWidget {
  final String title;
  final String detail;

  const MyGoalsDetailScreen(
      {Key? key, required this.title, required this.detail})
      : super(key: key);

  @override
  State<MyGoalsDetailScreen> createState() => _MyGoalsDetailScreenState();
}

class _MyGoalsDetailScreenState extends State<MyGoalsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatarIconWidget(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(widget.title,
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(widget.detail, style: TextStyle(fontSize: 15.sp)),
                  ],
                ),
              ),
            ),
            GestureDetector(
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
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 20.w),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(
                        10),
                    color: AppColor.primaryColor),
                child: const Center(
                  child: Text('Complete this task',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight:
                        FontWeight.w700),
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
