import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:e_onboarding_app/features/home/home_vm/home_vm.dart';
import 'package:e_onboarding_app/features/me/screen/my_employee_list.dart';
import 'package:e_onboarding_app/features/org/models/org_models.dart';
import 'package:e_onboarding_app/features/org/view_model/org_vm.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
      body: StreamBuilder(
        stream: FirebaseCollection.organizations.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          String? organizationName = context.read<OrgVM>().getOrgName;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                color: AppColor.primaryColor,
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    Text(organizationName ?? 'None',
                        style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  'Employee List',
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    String? orgName = context.read<OrgVM>().getOrgName;

                    /// Parse data to model
                    OrgModel orgData = OrgModel.fromJson(data);

                    /// query via org name
                    if (orgData.orgName == orgName) {
                      for (var i in orgData.members!) {
                        return MyEmployeeListScreen(
                            email: i.memberEmail ?? 'None',
                            lastName: i.memberLastName ?? 'None',
                            firstName: i.memberFirstName ?? 'None',
                            index: 0);
                      }
                    }
                    return Container();
                  }).toList(),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
