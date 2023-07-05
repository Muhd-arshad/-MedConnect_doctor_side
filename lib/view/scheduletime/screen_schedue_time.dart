import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/widgets/appbar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/buttonwidget.dart';
import 'package:doctor_side_flutter/view/widgets/circleavatar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:doctor_side_flutter/view/widgets/textformwidget.dart';
import 'package:flutter/material.dart';

class ScreenShuduleTime extends StatelessWidget {
  const ScreenShuduleTime({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController datecontroller = TextEditingController();
    TextEditingController startTimecontroller = TextEditingController();
    TextEditingController endTimecontroller = TextEditingController();
    TextEditingController sloatcontroller = TextEditingController();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarWidget(title: 'Schedule Time'),
      ),
      body: PrimaryWidget(
        widget: Padding(
          padding: horizontal10,
          child: Column(
            children: [
              height10,
              const CircleAvatarWidget(
                  image:
                      'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                  size: 80),
              height50,
              TextformFeildWidget(
                controller: datecontroller,
                labelText: 'Select Date',
              ),
              height20,
              TextformFeildWidget(
                  controller: startTimecontroller, labelText: 'Start Time'),
              height20,
              TextformFeildWidget(
                  controller: endTimecontroller, labelText: 'End Time'),
              height20,
              TextformFeildWidget(
                  controller: sloatcontroller, labelText: 'Slot'),
              height20,
              ButtonWidget(
                  text: 'Upload', onPressed: () {}, height: 50, width: 150),
            ],
          ),
        ),
      ),
    );
  }
}
