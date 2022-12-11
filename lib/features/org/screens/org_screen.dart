import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:e_onboarding_app/features/auth/model/user_profile_model.dart';
import 'package:e_onboarding_app/features/auth/screen/login_screen.dart';
import 'package:e_onboarding_app/features/home/home_vm/home_vm.dart';
import 'package:e_onboarding_app/features/org/screens/req_join_org_screen.dart';
import 'package:e_onboarding_app/features/org/models/org_models.dart';
import 'package:e_onboarding_app/features/org/view_model/org_vm.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/cards/org_cards.dart';
import 'package:e_onboarding_app/widgets/text_field/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/app_colors.dart';

class OrgScreen extends StatefulWidget {
  const OrgScreen({Key? key}) : super(key: key);

  @override
  State<OrgScreen> createState() => _OrgScreenState();
}

class _OrgScreenState extends State<OrgScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeVM>().initUserData();
  }
  TextEditingController companyID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.clear();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                  return LoginScreen();
                }), (route) => false);
              },
              icon: Icon(
                Icons.logout,
                color: AppColor.primaryColor,
              ))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseCollection.userProfile.snapshots(),
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
                    Text('My organizations',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.h),
                    // TextFieldWidget(
                    //   controller: companyID,
                    //   hide: false,
                    // ),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        String? email = context.read<HomeVM>().getEmail;

                        /// Parse data to model
                        UserProfileModel userProfileData =
                            UserProfileModel.fromJson(data);
                        if (userProfileData.email == email) {
                          if (userProfileData.orgs!.isEmpty) {
                            return Text("Your dont have any organization");
                          } else {
                            for (var i in userProfileData.orgs!) {
                              return OrgCard(
                                orgName: i.orgName ?? 'None',
                                onPressed: () {
                                  context.read<OrgVM>().onSelectOrg(
                                      i.orgName ?? '',
                                      i.orgDescription ?? '',
                                      i.orgID ?? '',
                                      context);
                                },
                              );
                            }
                          }
                        }

                        return Container();
                      }).toList(),
                    )
                  ],
                )),
                // ButtonWidgets(
                //     title: 'Search',
                //     onPress: () {
                //       setState(() {});
                //     }),
                SizedBox(height: 10.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
