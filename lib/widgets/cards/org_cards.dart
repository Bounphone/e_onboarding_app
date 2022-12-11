import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:flutter/material.dart';

class OrgCard extends StatelessWidget {
  String orgName;
  VoidCallback? onPressed;
  OrgCard({required this.orgName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor),
        onPressed: onPressed ?? () {},
        child: Text(orgName));
  }
}
