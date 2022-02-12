import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_butons.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1; // default: means we didn't select anything yet
  int gottenStars = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          // stack widgets onto each other
          children: [
            // image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/mountain.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Menu icon
            Positioned(
              left: 4,
              top: 40,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () =>
                        BlocProvider.of<AppCubits>(context).goHome(),
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 270,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                width: MediaQuery.of(context).size.width, // xD
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                            text: 'Yosemite',
                            color: Colors.black.withOpacity(0.8)),
                        AppLargeText(text: '\$250', color: AppColors.mainColor),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor),
                        const SizedBox(width: 5),
                        AppText(
                            text: 'USA, California',
                            color: AppColors.textColor1),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: gottenStars > index
                                    ? Colors.blue
                                    : Colors.white);
                          }),
                        ),
                        const SizedBox(width: 10),
                        AppText(text: '4.0', color: AppColors.textColor2),
                      ],
                    ),
                    const SizedBox(height: 25),
                    AppLargeText(
                        text: 'People',
                        color: Colors.black.withOpacity(0.8),
                        size: 20),
                    const SizedBox(height: 5),
                    AppText(
                        text: 'Number of people in your group',
                        color: AppColors.mainTextColor),
                    const SizedBox(height: 10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              // using this we trigger a new build
                              selectedIndex = index; // used to change color
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                                // if the selectedIndex (which we set the new state when we onTap it on a box) == current index, do this ...
                                color: (selectedIndex == index)
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: (selectedIndex == index)
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                borderColor: (selectedIndex == index)
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                size: 50,
                                text: (index + 1).toString()),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 25),
                    AppLargeText(
                        text: 'Description',
                        color: Colors.black.withOpacity(0.8),
                        size: 20),
                    const SizedBox(height: 10),
                    AppText(
                        text: 'Go visit the mountains',
                        color: AppColors.mainTextColor),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 30,
              right: 35,
              child: Row(
                children: [
                  AppButtons(
                      color: AppColors.textColor1,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.textColor1,
                      size: 40,
                      isIcon: true,
                      icon: Icons.favorite_border),
                  const SizedBox(width: 90),
                  ResponsiveButton(
                    isResponsive: true,
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
