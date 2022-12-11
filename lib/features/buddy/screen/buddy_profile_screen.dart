import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuddyProfileScreen extends StatefulWidget {
  const BuddyProfileScreen({Key? key}) : super(key: key);

  @override
  State<BuddyProfileScreen> createState() => _BuddyProfileScreenState();
}

class _BuddyProfileScreenState extends State<BuddyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        leading: const CircleAvatarIconWidget(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: AppColor.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your buddy",
                    style: TextStyle(color: Colors.white, fontSize: 18.sp)),
                SizedBox(height: 10),
                Text("Jay",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 5.w),
              GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.secondColor),
                  child: const Text(
                    'Buddy info',
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.secondColor),
                  child: const Text(
                    'Buddy share',
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             MyGoalsDetailScreen(
              //               title: taskData.taskTitle ?? "",
              //               detail: taskData.taskDetail ?? "",
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
                      Text(
                        'title', style: TextStyle(color: AppColor.primaryColor, fontSize: 18.sp),
                      ),
                      SizedBox(height: 5),
                      Text('detail'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
