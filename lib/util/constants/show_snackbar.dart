import 'package:doctor_side_flutter/util/constants/color.dart';
import 'package:doctor_side_flutter/view/widgets/customtextwidget.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      
      backgroundColor: cBlack.withOpacity(0.5),
      content: Center(
        child: TextWidget(
          text: text,
          size: 18,
          colorText: cwhite,
        ),
      ),
    ),
  );
}
