// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

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

    var images = {
      // where key is the image and the value is the text
      'balloning.png': 'Balloning',
      'hiking.png': 'Hiking',
      'kayaking.png': 'Kayaking',
      'snorkling.png': 'Snorkling'
    };

    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places; // we can access the state and
          // the app_cubit_states classes and properties using this state
          print('debug 0x: ${info}');

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // menu text
                SizedBox(height: 35),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.menu, size: 30, color: Colors.black54),
                      Expanded(child: Container()),
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                // discover text
                Container(
                  padding: const EdgeInsets.only(left: 33, bottom: 15),
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
                          _tabController, // we use our own defined _tabController (w length 3 and vsync context) as a value for controller + you need to specify the same one for tabBarView as well
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
                      270, // TabBarView needs the container to have a height and width !!
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 14),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context)
                                  .detailPage(info[index]);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 14, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(33),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'http://mark.bslmeiyu.com/uploads/' +
                                          info[index].img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const Text('Inspiration - Page in progress'),
                      const Text('Emotions - Page in progress'),
                    ],
                  ),
                ),
                const SizedBox(height: 27),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: 'Explore more', size: 22),
                      AppText(text: 'See all', color: AppColors.textColor1),
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 100,
                  width: double.maxFinite,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        // default context, index
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'img/' + images.keys.elementAt(index)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: AppColors.textColor2,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ]);
        } else {
          return Container();
        }
      }),
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

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius); // black magic,
    // basically makes the dot stay under the middle of the text
    // first argument is x axis, second one is y axis
    // size!  --> null checker --> The property 'width' can't be unconditionally accessed because the receiver can be 'null'.

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
