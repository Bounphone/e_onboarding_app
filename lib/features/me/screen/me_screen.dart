import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeScreen extends StatefulWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.secondColor,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello!',
                            style: TextStyle(color: AppColor.primaryColor, fontSize: 15.sp)),
                        Text('Name',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    CircleAvatar(),
                  ],
                ),
                Text('30-60-90 Day Plan', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColor.orangeColor)),
              ],
            ),
          )),
    );
  }
}
