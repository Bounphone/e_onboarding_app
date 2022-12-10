import 'package:flutter/material.dart';

Color setMyGoalsColor(String status) {
  if (status == 'Complete') {
    return Colors.green;
  } else if (status == 'Do the task') {
    return Color(0xFF775BE5);
  } else {
    return Colors.grey;
  }
}
