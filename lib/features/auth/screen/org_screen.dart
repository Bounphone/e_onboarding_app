import 'package:e_onboarding_app/features/auth/data/org_data.dart';
import 'package:e_onboarding_app/features/auth/screen/req_join_org_screen.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:e_onboarding_app/widgets/text_field/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';

class OrgScreen extends StatefulWidget {
  const OrgScreen({Key? key}) : super(key: key);

  @override
  State<OrgScreen> createState() => _OrgScreenState();
}

class _OrgScreenState extends State<OrgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const CircleAvatarIconWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Search org', style: TextStyle(fontSize: 20, color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextFieldWidget(controller: companyID),
            const Spacer(),
            ButtonWidgets(title: 'Search', onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ReqJoinOrgScreen()));
            }),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
