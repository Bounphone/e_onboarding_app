import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:flutter/material.dart';

class DialogLoading extends StatelessWidget {
  const DialogLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 30),
                CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
                SizedBox(height: 30),
                Text('Logging in...'),
                SizedBox(height: 30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
