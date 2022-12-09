import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:flutter/material.dart';

class CircleAvatarIconWidget extends StatelessWidget {
  const CircleAvatarIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: CircleAvatar(
        backgroundColor: AppColor.secondColor,
        child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: AppColor.primaryColor)),
      ),
    );
  }
}
