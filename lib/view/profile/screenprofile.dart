import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/widgets/appbar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/circleavatar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/customtextwidget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:doctor_side_flutter/view/widgets/textformwidget.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController numbercontroller = TextEditingController();
    TextEditingController experiancecontroller = TextEditingController();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarWidget(title: 'Profile'),
      ),
      body: PrimaryWidget(
        widget: Padding(
          padding: horizontal10,
          child: Column(
            children: [
              const CircleAvatarWidget(
                  image:
                      'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                  size: 80),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'About',
                    fontWeight: FontWeight.bold,
                    size: 20,
                  ),
                  TextWidget(
                    text: 'Edit',
                    fontWeight: FontWeight.bold,
                    size: 20,
                  )
                ],
              ),
              height20,
              TextformFeildWidget(
                  controller: namecontroller, labelText: 'Name'),
              height20,
              TextformFeildWidget(
                  controller: emailcontroller, labelText: 'Email'),
              height20,
              TextformFeildWidget(
                  controller: numbercontroller, labelText: 'PhoneNumber'),
              height20,
              TextformFeildWidget(
                  controller: experiancecontroller, labelText: 'Experiance'),
            ],
          ),
        ),
      ),
    );
  }
}
