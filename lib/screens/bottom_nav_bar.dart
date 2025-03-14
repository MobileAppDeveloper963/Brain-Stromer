import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_screens/controllers/bottom_nav_bar_controller.dart';
import 'package:profile_screens/screens/courses_page.dart';
import 'package:profile_screens/screens/home_page.dart';
import 'package:profile_screens/screens/profile_page.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final BottomNavBarController controller = Get.put(BottomNavBarController());

  final List<Widget> pages = [
    HomePage(),
    CoursesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Obx(
        () => AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.1, 0.0), // Slide in from right
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: pages[controller.selectedIndex.value],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black54,
          backgroundColor: Colors.white,
          onTap: (value) => controller.changePage(value),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.chair), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "Courses"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_3_rounded), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
