import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/features/me/screen/me_screen.dart';
import 'package:flutter/material.dart';
import '../features/buddy/screen/buddy_screen.dart';
import '../features/feedbacks/screen/feedback_screen.dart';
import '../features/my_goals/screens/my_goals_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MyGoalScreen(),
    BuddyScreen(),
    FeedbackScreen(),
    MeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'My Goals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Buddy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Feedback',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Me',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColor.primaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
