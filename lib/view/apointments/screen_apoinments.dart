import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/apointments/widget/tilewidget.dart';
import 'package:doctor_side_flutter/view/widgets/appbar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/circleavatar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';

class ScreenApointments extends StatelessWidget {
  const ScreenApointments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppbarWidget(title: 'Appoinments'),
      ),
      body: PrimaryWidget(
          widget: Padding(
        padding: horizontal10,
        child: Column(
          children: [
            CircleAvatarWidget(
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              size: 80,
            ),
            height50,
            Tilewidget(
              slnumber: '1',
              name: 'muhammed',
              date: '21/04/2023',
              time: '4.00pm',
            ),
            height20,
            Tilewidget(
              slnumber: '1',
              name: 'muhammed',
              date: '21/04/2023',
              time: '4.00pm',
            ),
            height20,
            Tilewidget(
              slnumber: '1',
              name: 'muhammed',
              date: '21/04/2023',
              time: '4.00pm',
            ),
            height20,
            Tilewidget(
              slnumber: '1',
              name: 'muhammed',
              date: '21/04/2023',
              time: '4.00pm',
            ),
            height20,
            Tilewidget(
              slnumber: '1',
              name: 'muhammedasdfgh',
              date: '21/04/2023',
              time: '4.00pm',
            )
          ],
        ),
      )),
    );
  }
}
