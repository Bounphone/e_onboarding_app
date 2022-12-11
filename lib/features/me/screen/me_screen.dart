import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:flutter/material.dart';

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
            padding: EdgeInsets.symmetric())
      ),
    );
  }
}
