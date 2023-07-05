import 'package:flutter/material.dart';

import '../../util/constants/color.dart';
import 'customtextwidget.dart';

class CardWidget extends StatelessWidget {
  final String image;
  final String text;
  final dynamic count;
  final double? height;
  final EdgeInsets padding;
  final Function()? onTap;
  const CardWidget({
    super.key,
    required this.image,
    required this.text,
    this.count, this.height,  this.padding=EdgeInsets.zero,  this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: cwhite,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding:  padding,
          child: Column(
            children: [
              CircleAvatar(radius: 45, backgroundImage: AssetImage(image)),
              //  height10,
              SizedBox(height: height,),
              TextWidget(
                text: text,
                fontWeight: FontWeight.bold,
                size: 15,
              ),
              //  height10,
              count == null
                  ? const SizedBox()
                  : TextWidget(
                      text: count,
                      fontWeight: FontWeight.bold,
                      colorText: cBlack,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
