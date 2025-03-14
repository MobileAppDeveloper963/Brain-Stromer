import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:profile_screens/controllers/courses_page_controller.dart';

class CoursesPage extends StatelessWidget {
  CoursesPage({super.key});

  CoursesPageController controller = Get.put(CoursesPageController());

  List containerDetails = [
    {
      "image": 'assets/images/51.webp',
      'title': 'Art and Humanities',
    },
    {
      "image": 'assets/images/52.webp',
      'title': 'Computer Science',
    },
    {
      "image": 'assets/images/53.jpg',
      'title': 'Economics',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            _tabBar(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 140.h,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: containerDetails.length,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(() => _listViewContainer(index));
                  },
                ),
              ),
            ),
            _artContainer()
          ],
        ),
      ),
    );
  }

  Widget _artContainer() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 320.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircularProgressIndicator(
                        color: Colors.tealAccent.shade700,
                        backgroundColor: Colors.grey.shade200,
                        strokeAlign: 0.2,
                        strokeWidth: 4,
                        value: 0.5,
                      ),
                      Container(
                        width: 2,
                        height: 25,
                        color: Colors.grey.shade300,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text(
                      'Fundamentals of Art',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            buildStep(
                "What is Art?", "What does it really mean?", true, true, true),
            buildStep("Different Forms of Art", "It is not just painting.",
                true, false, true),
            buildStep("Art Principles", "Why are they important?", false, false,
                true),
            buildStep(
                "Color Theory", "Understanding color.", false, false, false),
          ].animate(interval: 400.ms).fade(duration: 300.ms),
        ),
      ),
    );
  }

  Widget _listViewContainer(int index) {
    return GestureDetector(
      onTap: () {
        controller.selectedContainerIndex.value = index;
      },
      child: Container(
        width: 110.w,
        height: 140.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage(containerDetails[index]['image']),
                          fit: BoxFit.cover)),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      containerDetails[index]['title'],
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight:
                              controller.selectedContainerIndex.value == index
                                  ? FontWeight.w700
                                  : FontWeight.w400),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _tabBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
      child: Obx(
        () => Container(
          height: 40.h,
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

  Widget buildStep(String title, String subtitle, bool isCompleted,
      bool isActive, bool showLine) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              isActive
                  ? Icon(
                      Icons.check,
                      color: isCompleted
                          ? Colors.tealAccent.shade700
                          : Colors.grey.shade400,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCompleted
                              ? Colors.tealAccent.shade700
                              : Colors.grey.shade400,
                        ),
                      ),
                    ),
              if (showLine)
                Container(
                  width: 2,
                  height: 50,
                  color: Colors.grey.shade300,
                ),
            ],
          ),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 17),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(height: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
