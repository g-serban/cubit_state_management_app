// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // with TickerProviderStateMixin = extends this class as well, because TabBar view has it's own state and you can access it if implement this calls into the statefull widget

  @override
  Widget build(BuildContext context) {
    // vsync: this -> has to have context, everytime we click on the bar, it get's rebuild, so it needs the context of the widget
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // menu text
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          // discover text
          Container(
            padding: const EdgeInsets.only(left: 20, top: 40, bottom: 40),
            child: AppLargeText(text: 'Discover'),
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft, // (a) -> they work together to position & align the tab bar correctly || using this one we put everything on the left
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20), // (b) -> they work together to position & align the tab bar correctly || using this one we control the space 
                controller:
                    _tabController, // we use our own defined _tabController (w length 3 and vsync context) as a value for controller
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,  // (c) -> they work together to position & align the tab bar correctly
                indicatorSize: TabBarIndicatorSize.label, // makes the line under the text the same length as the text above
                tabs: const [
                  Tab(text: 'Places'),
                  Tab(text: 'Inspiration'),
                  Tab(text: 'Emotions'),
                ],
              ),
            ),
          ),
          Container(
            height:
                300, // TabBarView needs the container to have a height and width !!
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: const [
                Text('Hi'),
                Text('There'),
                Text('Bye'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
