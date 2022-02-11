import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ['welcome-one.png', 'welcome-two.png', 'welcome-three.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          // we use PageView builder so that we can scroll
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            // itemBuilder keeps track of the index we are at 
            return Container(
              width: double.maxFinite, // maximum width for the screen
              height: double.maxFinite, // maximum height for the screen
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/' +
                      images[index]), // itemBuilder has index, runs 3 times
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: 'Trips'),
                        AppText(text: 'Mountain', size: 30),
                        const SizedBox(height: 20),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                'Mountain hikes give you an incredible sense of freedom along with endurance tests',
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                            width: 200,
                            child: Row(
                              children: [
                                ResponsiveButton(width: 120),
                              ],
                            )),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) { // returns 3 containers
                        return Container(
                          width: 8,
                          height: (index == indexDots) ? 16 : 8, // if itemBuilder index == indexDots (e.g. index 1 == dot slider 1)
                          margin:const EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (index == indexDots) ? AppColors.starColor : AppColors.mainColor.withOpacity(0.5),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
