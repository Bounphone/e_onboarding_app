import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class ButtonWidgets extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const ButtonWidgets({Key? key, required this.title, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
        ),
        onPressed: onPress,
        child: Text(title),
      ),
    );
  }
}
