import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  Courses({super.key});

  List courses = [
    {
      "courseName": "Communication",
      "chapters": "18 Chapters",
      "image": "assets/vectors/31.png",
    },
    {
      "courseName": "Customer Experience",
      "chapters": "7 Chapters",
      "image": "assets/vectors/32.webp",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          card(0),
          card(1),
         
        ],
      ),
    );
  }

  Widget card(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 220,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber.shade200,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage(courses[index]['image']),
                          fit: BoxFit.cover)),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: ListTile(
                    title: Text(courses[index]['courseName']),
                    titleTextStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                    subtitle: Text(courses[index]['chapters']),
                    subtitleTextStyle:
                        TextStyle(color: Colors.grey, fontSize: 16),
                    trailing: Icon(
                      Icons.bookmark,
                      size: 28,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
