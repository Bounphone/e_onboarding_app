import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogError extends StatelessWidget {
  String message;
  DialogError({required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.cancel,
                    color: Colors.red, size: (30.w + 30.h) / 2)),
          ),
          Icon(Icons.warning_amber, color: Colors.red, size: (30.w + 30.h) / 2),
          SizedBox(height: 20.h),
          Text(
            message,
            style: TextStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
