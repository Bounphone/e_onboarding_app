import 'package:e_onboarding_app/config/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
     items: [
        BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage(AppIcons.myGoal),
            ),
          label: 'My goals'
        ),
       BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage(AppIcons.myGoal),
            ),
          label: 'Buddy'
        ),
       BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage(AppIcons.myGoal),
            ),
          label: 'Feedback'
        ),
       BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage(AppIcons.myGoal),
            ),
          label: 'Me'
        ),
    ]);
  }
}
