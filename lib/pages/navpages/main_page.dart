// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/pages/navpages/bar_item_page.dart';
import 'package:flutter_cubit/pages/home_page.dart';
import 'package:flutter_cubit/pages/navpages/my_page.dart';
import 'package:flutter_cubit/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  // define method to set current index page value
  int currentIndexIs = 0;
  
  void onTapIndex(int index) {
    setState(() {
      currentIndexIs = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body page index is going to show the page we want to see 
      body: pages[currentIndexIs], //  body takes a widget (classes in Fltter usually are)
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // default is .shifting, which means that we can't change the bck color and on click the icons shift
        backgroundColor: Colors.white,
        onTap: onTapIndex, // receives onTapIndex method
        // when user taps on one of the bottomnav bar items, the items index is sent to onTap, which sends the index as a parameter to onTapIndex()
        currentIndex:
            currentIndexIs, // page we are on, receives value of currentIndexIs || we need to change Scaffold body value as well
        // if you get RenderBox.hitTest error while clicking on the icons, you need to change the size of the Font, so that it's not clickable anymore
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        // anything that has Bar in name usually has children
        items: [
          BottomNavigationBarItem(title: Text('Home'), icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              title: Text('Bar'), icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(
              title: Text('Search'), icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              title: Text('My Page'), icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
