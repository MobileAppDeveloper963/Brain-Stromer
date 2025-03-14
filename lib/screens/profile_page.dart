import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:profile_screens/controllers/profile_page_controller.dart';
import 'package:profile_screens/screens/badges.dart';
import 'package:profile_screens/screens/courses.dart';
import 'package:profile_screens/screens/friends.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  ProfilePageController controller = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profileContainer(),
            SizedBox(
              height: 30,
            ),
            _addFriendContainer(),
            _tabBar(),
            _tabBarContent()
          ],
        ),
      ),
    );
  }

  Widget _tabBarContent() {
    return Obx(
      () => Expanded(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.1, 0.0), // Slide in from right
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: controller.selectedIndex.value == 0
              ? Badges()
              : controller.selectedIndex.value == 1
                  ? Friends()
                  : Courses(),
        ),
      ),
    );
  }

  Widget _tabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Obx(
        () => Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(controller.tabList.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.selectedIndex.value = index;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: index != controller.tabList.length - 1
                          ? Border(right: BorderSide(color: Colors.grey))
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        controller.tabList[index],
                        style: TextStyle(
                          fontWeight: controller.selectedIndex.value == index
                              ? FontWeight.bold
                              : FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _addFriendContainer() {
    return Obx(
      () => Stack(
        children: [
          InkWell(
            onTap: () {
              controller.isLoading.value = true; // Start loading animation
              Timer(Duration(seconds: 2), () {
                controller.isLoading.value = false; // Stop loading
                controller.isRequestSent.toggle();
              });
            },
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: controller.isRequestSent.value
                    ? Colors.blue.shade400
                    : Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade300,
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: controller.isLoading.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Sending    ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              strokeAlign: 0.2,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        controller.isRequestSent.value
                            ? 'Request Sent ⏳'
                            : 'ADD FRIEND',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ),
          if (!controller.isRequestSent.value && !controller.isLoading.value)
            Positioned(
              right: 15,
              top: 0,
              bottom: 0,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Colors.blue.shade700,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _profileContainer() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
            )),
        CircleAvatar(
          radius: 65,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 58,
            backgroundColor: Colors.orange,
            backgroundImage: AssetImage('assets/images/11.png'),
          ).animate().fade(duration: 300.ms).scale(delay: 100.ms),
        ).animate().fade(duration: 300.ms).scale(delay: 0.ms),
        SizedBox(
          height: 5,
        ),
        Text(
          'Navaeh Griffith',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ).animate().fade(duration: 300.ms).scale(delay: 100.ms),
        Text(
          '289,490 XP',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.grey),
        ).animate().fade(duration: 300.ms).scale(delay: 100.ms),
      ],
    );
  }
}
