import 'package:doctor_side_flutter/util/constants/color.dart';
import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/widgets/appbar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/circleavatar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/customtextwidget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarWidget(title: 'Chats'),
      ),
      body: PrimaryWidget(
        widget: ListView.separated(
            padding: horizontal10,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: cwhite,
                ),
                child: const ListTile(
                  leading: CircleAvatarWidget(
                      image:
                          'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                      size: 20),
                  title: TextWidget(
                    text: 'Arshad',
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: TextWidget(
                    text: '4.00pm',
                    size: 19,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => height20,
            itemCount: 10),
      ),
    );
  }
}
