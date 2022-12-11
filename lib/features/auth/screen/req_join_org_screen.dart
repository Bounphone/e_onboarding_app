import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReqJoinOrgScreen extends StatefulWidget {
  const ReqJoinOrgScreen({Key? key}) : super(key: key);

  @override
  State<ReqJoinOrgScreen> createState() => _ReqJoinOrgScreenState();
}

class _ReqJoinOrgScreenState extends State<ReqJoinOrgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: CircleAvatarIconWidget(),
      //   elevation: 0,
      //   backgroundColor: AppColor.primaryColor,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                CircleAvatar(),
                SizedBox(height: 10.h),
                Text(
                  "YZ - Tech",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.secondColor),
            child: const Text('Company info',
                style: TextStyle(color: AppColor.primaryColor)),
          ),
          const Text('data'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ButtonWidgets(title: 'Request Joining', onPress: () {}),
          )
        ],
      ),
    );
  }
}
