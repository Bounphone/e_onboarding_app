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
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text('Hello'),
                  Text('Name'),
                ],
              ),
              CircleAvatar(),
            ],
          )
        ],
      ),
    );
  }
}
