import 'package:flutter/material.dart';

import '../../../util/constants/color.dart';
import '../../widgets/customtextwidget.dart';

class Tilewidget extends StatelessWidget {
  final String name;
  final String slnumber;
  final String date;
  final String time;
  const Tilewidget({
    super.key,
    required this.name,
    required this.slnumber,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cwhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        minLeadingWidth: 0,
        leading: TextWidget(
          text: slnumber,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextWidget(
                text: name,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextWidget(
              text: date, 
            ),
          ],
        ),
        trailing: Expanded(
          child: TextWidget(
            text: time,
          ),
        ),
      ),
    );
  }
}