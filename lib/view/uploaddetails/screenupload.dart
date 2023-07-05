import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/widgets/appbar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/buttonwidget.dart';
import 'package:doctor_side_flutter/view/widgets/circleavatar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:doctor_side_flutter/view/widgets/textformwidget.dart';
import 'package:flutter/material.dart';

class ScreenUploadDetails extends StatelessWidget {
  const ScreenUploadDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController idnumberController = TextEditingController();
    TextEditingController qualificationController = TextEditingController();
    TextEditingController departmentController = TextEditingController();
    TextEditingController feeController = TextEditingController();
    TextEditingController yearofexpController = TextEditingController();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarWidget(title: 'Upload Details'),
      ),
      body: PrimaryWidget(
          widget: Padding(
        padding: horizontal10,
        child: Column(
          children: [
            const CircleAvatarWidget(
                image: 'assets/images/270006.png', size: 80),
            height20,
            TextformFeildWidget(
                controller: idnumberController, labelText: 'Id Number'),
            height10,
            TextformFeildWidget(
                controller: qualificationController,
                labelText: 'Qualification'),
            height10,
            TextformFeildWidget(
                controller: departmentController, labelText: 'Department'),
            height10,
            TextformFeildWidget(controller: feeController, labelText: 'Fees'),
            height10,
            TextformFeildWidget(
                controller: yearofexpController, labelText: 'Experiance'),
            height20,
            ButtonWidget(
                text: 'Upload', onPressed: () {}, height: 50, width: 150),
          ],
        ),
      )),
    );
  }
}
