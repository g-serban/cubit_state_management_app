// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
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
              alignment: Alignment
                  .centerLeft, // (a) -> they work together to position & align the tab bar correctly || using this one we put everything on the left
              child: TabBar(
                labelPadding: const EdgeInsets.only(
                    left: 20,
                    right:
                        20), // (b) -> they work together to position & align the tab bar correctly || using this one we control the space
                controller:
                    _tabController, // we use our own defined _tabController (w length 3 and vsync context) as a value for controller
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable:
                    true, // (c) -> they work together to position & align the tab bar correctly
                indicator: CircleTabIndicator(
                    color: AppColors.mainColor,
                    radius: 4), // only takes a Decoration as argument
                indicatorSize: TabBarIndicatorSize
                    .label, // makes the line under the text the same length as the text above
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
              children: [
                Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(
                        'img/mountain.jpeg'
                      ),
                      fit: BoxFit.cover
                    ),
                  ),

                ),
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

// create a class for the TabBar indicator
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  // everytime you extend Decoration you need to override and create the BoxPainter method
  // this method needs to return a BoxPainter (defined below)
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

// we create this class so that we can return the BoxPainter in the CircleTabIndicator class
class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  // everytime we extend BoxPainter, we need to override the paint method
  @override
  // the paint method is going to draw the (indicator) circle
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true; // hardware acceleration

    final Offset circleOffset = Offset(configuration.size!.width / 2 - radius / 2, configuration.size!.height - radius); // black magic, 
    // basically makes the dot stay under the middle of the text
    // first argument is x axis, second one is y axis
    // size!  --> null checker --> The property 'width' can't be unconditionally accessed because the receiver can be 'null'.

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
