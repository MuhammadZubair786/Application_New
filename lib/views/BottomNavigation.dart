// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:interviewapp/views/HomPage.dart';
import 'package:interviewapp/views/MoviewListScreen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;
  final tabs = [
   HomePage(),
   MovieListScreen(),
    Container(
        height: 400,
        width: 800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              ('Camera Screen'),
              style: TextStyle(fontSize: 30),
            )
          ],
        )),
    Container(
        height: 400,
        width: 800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              ('Profile Screen'),
              style: TextStyle(fontSize: 30),
            )
          ],
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedFontSize: 20,
        unselectedFontSize: 20,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: "Home",
              activeIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              icon: Icon(Icons.home),
              backgroundColor: Color.fromARGB(255, 4, 128, 70)),
          BottomNavigationBarItem(
              label: "Moview",
              activeIcon: Icon(
                Icons.movie_creation_outlined,
                color: Colors.red,
              ),
              icon: Icon(Icons.movie_creation_outlined),
              backgroundColor: Color.fromARGB(255, 1, 9, 10)),
          BottomNavigationBarItem(
              label: "Video",
              activeIcon: Icon(
                Icons.video_camera_back,
                color: Colors.red,
              ),
              icon: Icon(
                Icons.camera,
                size: 40,
              ),
              backgroundColor: Color.fromARGB(255, 110, 110, 110)),
          BottomNavigationBarItem(
              label: "Profile",
              activeIcon: Icon(
                Icons.person,
                color: Colors.red,
              ),
              icon: Icon(Icons.person),
              backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}
