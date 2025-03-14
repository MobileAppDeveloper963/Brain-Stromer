import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_screens/controllers/home_page_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomePageController controller = Get.put(HomePageController());

  List studyingDetails = [
    {
      "image": 'assets/images/pharmacist_23.jpg',
      'title_1': 'Biology Basis',
      'title_2': 'Biology & The Scientific Method',
    },
    {
      "image": 'assets/images/45.webp',
      'title_1': 'Cosmology',
      'title_2': 'Earth Rotation & Climate Change',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Container(
              // color: Colors.amber.shade50,
              height: 90.h,
              child: Column(
                children: [
                  Text(
                    'Hi, Antonio',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'What would you like to learn today? Search below.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: controller.searchController,
                        style: TextStyle(fontSize: 16.h),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search here',
                        ),
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 45.h,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 350.h,
              // color: Colors.amber.shade50,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'STUDYING',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ),

                  // display listview>builder in return _studyingContainer

                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 265.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: studyingDetails.length,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                        itemBuilder: (context, index) {
                          return _studyingContainer(index);
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _studyingContainer(int index) {
    return Container(
      height: 265.h,
      width: 220.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage(studyingDetails[index]['image']),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  studyingDetails[index]['title_1'],
                  style: TextStyle(fontSize: 12.sp, color: Colors.blue),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 150.w,
              // color: Colors.amber.shade50,
              alignment: Alignment.bottomLeft,
              child: Text(
                studyingDetails[index]['title_2'],
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  index == 0 ? "4 of 8 lessons" : "2 of 13 lessons",
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  height: 10,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      // alignment: Alignment.centerLeft,
                      width: index == 0 ? 20 : 8,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.tealAccent),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
