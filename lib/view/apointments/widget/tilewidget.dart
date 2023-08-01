import 'package:flutter/material.dart';

import '../../../util/constants/color.dart';
import '../../widgets/customtextwidget.dart';

class Tilewidget extends StatelessWidget {
  final String name;
  final String slnumber;
  final String date;
  final String time;
  final Function()? ontap;
  const Tilewidget({
    super.key,
    required this.name,
    required this.slnumber,
    required this.date,
    required this.time, this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cwhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: ontap,
        minLeadingWidth: 0,
        leading: TextWidget(
          text: slnumber,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 70,
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
        trailing: SizedBox(
          width: 45,
          child: TextWidget(
            text: time,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}