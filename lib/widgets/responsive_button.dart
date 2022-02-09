import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';

import 'app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  double? height;

  ResponsiveButton(
      {Key? key, this.isResponsive = false, this.width=120, this.height = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: (isResponsive == true) ? double.maxFinite : width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: (isResponsive == true)
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            (isResponsive == true)
            ? Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppText(
                text: 'Book Trip Now',
                color: Colors.white,
              ),
            )
            : Container(),
            Image.asset('img/button-one.png')
          ],
        ),
      ),
    );
  }
}
