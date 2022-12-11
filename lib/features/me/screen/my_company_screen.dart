import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCompanyScreen extends StatefulWidget {
  const MyCompanyScreen({Key? key}) : super(key: key);

  @override
  State<MyCompanyScreen> createState() => _MyCompanyScreenState();
}

class _MyCompanyScreenState extends State<MyCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: CircleAvatarIconWidget(),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            color: AppColor.primaryColor,
            child: Column(
              children: [
                CircleAvatar(),
                SizedBox(height: 5.h),
                Text('Company name',
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Row(
             children: [
               SizedBox(width: 5.w),
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
                   padding: EdgeInsets.symmetric(
                       vertical: 8.h,
                       horizontal: 20.w),
                   decoration: BoxDecoration(
                       borderRadius:
                       BorderRadius.circular(
                           10),
                       color: AppColor.secondColor),
                   child: const Text('Company info',
                     style: TextStyle(
                         color: AppColor.primaryColor,
                         fontWeight:
                         FontWeight.w700),
                   ),
                 ),
               ),
               SizedBox(width: 5.w),
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
                   padding: EdgeInsets.symmetric(
                       vertical: 8.h,
                       horizontal: 20.w),
                   decoration: BoxDecoration(
                       borderRadius:
                       BorderRadius.circular(
                           10),
                       color: Colors.grey),
                   child: const Text('Employee List',
                     style: TextStyle(
                         color: Colors.black87,
                         fontWeight:
                         FontWeight.w700),
                   ),
                 ),
               ),
            ],
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
          child: Text('info'),
          )
        ],
      ),
    );
  }
}
