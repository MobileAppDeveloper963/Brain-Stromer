import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  Badges({super.key});

  final List<Map<String, String>> badges = [
    {
      "icon": "assets/icons/1.webp",
      "title": "Perfectionist",
      "description": "Finish all lessons of a chapter"
    },
    {
      "icon": "assets/icons/3.png",
      "title": "Achiever",
      "description": "Complete an exercise"
    },
    {
      "icon": "assets/icons/4.png",
      "title": "Scholar",
      "description": "Study two courses"
    },
    {
      "icon": "assets/icons/9.png",
      "title": "Champion",
      "description": "Finish #1 in the Scoreboard"
    },
    {
      "icon": "assets/icons/10.png",
      "title": "Focused",
      "description": "Finish with full focused"
    },
    {
      "icon": "assets/icons/1.webp",
      "title": "Perfectionist",
      "description": "Finish all lessons of a chapter"
    },
    {
      "icon": "assets/icons/3.png",
      "title": "Achiever",
      "description": "Complete an exercise"
    },
    {
      "icon": "assets/icons/4.png",
      "title": "Scholar",
      "description": "Study two courses"
    },
    {
      "icon": "assets/icons/9.png",
      "title": "Champion",
      "description": "Finish #1 in the Scoreboard"
    },
    {
      "icon": "assets/icons/10.png",
      "title": "Focused",
      "description": "Finish with full focused"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: badges.length,
        itemBuilder: (context, index) {
          final badge = badges[index];
          return ListTile(
            leading: Image.asset(badge["icon"]!, width: 40),
            title: Text(
              badge["title"]!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              badge["description"]!,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        },
      ),
    );
  }
}
