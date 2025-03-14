import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Friends extends StatelessWidget {
  Friends({super.key});

  List friendsList = [
    {"name": "John Doe", "imagePath": "assets/images/1.jpg"},
    {"name": "Jane Smith", "imagePath": "assets/images/2.jpg"},
    {"name": "Alice Johnson", "imagePath": "assets/images/3.jpg"},
    {"name": "Emily Davis", "imagePath": "assets/images/8.jpg"},
    {"name": "Michael Wilson", "imagePath": "assets/images/111.jpg"},
    {"name": "Sophia Miller", "imagePath": "assets/images/7.jpg"},
    {"name": "James Anderson", "imagePath": "assets/images/5.jpg"},
    {"name": "Olivia Thomas", "imagePath": "assets/images/9.jpg"},
    {"name": "William Martinez", "imagePath": "assets/images/10.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 10),
          shrinkWrap: true,
          itemCount: friendsList.length,
          itemBuilder: (context, index) {
            final friend = friendsList[index]; // Accessing map values
            return ListTile(
              
              minTileHeight: 75,
              leading: CircleAvatar(
                radius: 25,
                backgroundImage:
                    AssetImage(friend["imagePath"]!), // Accessing image
              ),
              title: Text(
                friend["name"]!, // Accessing name
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                print("${friend["name"]} clicked!");
              },
            );
          },
        ));
  }
}
