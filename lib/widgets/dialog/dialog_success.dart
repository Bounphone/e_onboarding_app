import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_colors.dart';

class DialogSuccess extends StatelessWidget {
  const DialogSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Icon(Icons.check_circle_outline_sharp, color: Colors.green, size: 50.sp),
                SizedBox(height: 30.h),
                Text('Logging in...'),
                SizedBox(height: 30.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
