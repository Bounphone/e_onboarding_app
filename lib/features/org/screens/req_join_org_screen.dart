import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/features/home/home_vm/home_vm.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ReqJoinOrgScreen extends StatefulWidget {
  const ReqJoinOrgScreen({Key? key}) : super(key: key);

  @override
  State<ReqJoinOrgScreen> createState() => _ReqJoinOrgScreenState();
}

class _ReqJoinOrgScreenState extends State<ReqJoinOrgScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeVM>().initUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: CircleAvatarIconWidget(),
      //   elevation: 0,
      //   backgroundColor: AppColor.primaryColor,
      // ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                        SizedBox(height: 10.h),
                        Text(
                          "YZ - Tech",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      'data',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ButtonWidgets(title: 'Request Joining', onPress: () {}),
          )
        ],
      ),
    );
  }
}
