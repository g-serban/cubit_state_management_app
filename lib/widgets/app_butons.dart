import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  double size;
  String? text; // -> null because it could be optional
  IconData? icon; // same thing
  bool? isIcon;

  AppButtons(
      {Key? key, // remove const ... if you have a non-final var
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.size,
      this.text='text',
      this.icon,
      this.isIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: ,
      width: size, // w = h -> square
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: (isIcon == false)
          ? Center(child: AppText(text: text!, color: color))
          : Center(child: Icon(icon, color: color)),
    );
  }
}
