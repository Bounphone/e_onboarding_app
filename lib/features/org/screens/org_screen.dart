import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:e_onboarding_app/features/auth/screen/req_join_org_screen.dart';
import 'package:e_onboarding_app/features/org/models/org_models.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/cards/org_cards.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:e_onboarding_app/widgets/text_field/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';

class OrgScreen extends StatefulWidget {
  const OrgScreen({Key? key}) : super(key: key);

  @override
  State<OrgScreen> createState() => _OrgScreenState();
}

class _OrgScreenState extends State<OrgScreen> {
  TextEditingController companyID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Text('Search org',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.h),
                    TextFieldWidget(
                      controller: companyID,
                      hide: false,
                    ),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        /// if id of user's input === company id in database
                        if (document.id == companyID.text.trim()) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          /// Parse data to model
                          OrgModel orgData = OrgModel.fromJson(data);
                          return OrgCard(
                            orgName: orgData.orgName ?? 'None',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ReqJoinOrgScreen()));
                            },
                          );
                        }
                        return Container();
                      }).toList(),
                    )
                  ],
                )),
                ButtonWidgets(
                    title: 'Search',
                    onPress: () {
                      setState(() {});
                    }),
                SizedBox(height: 10.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
