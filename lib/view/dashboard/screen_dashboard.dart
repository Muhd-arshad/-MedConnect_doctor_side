import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/widgets/cardwidget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import '../../util/constants/padding.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/circleavatar_widget.dart';

class ScreenDashboard extends StatelessWidget {
  const ScreenDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppbarWidget(
            title: 'DashBoard',
          )),
      body: SafeArea(
        child: PrimaryWidget(
            widget: Padding(
          padding: horizontal10,
          child: Column(
            children: [
              const CircleAvatarWidget(image: 'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',size: 80),
              height30,
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  children: const [
                    CardWidget(
                      image:
                          'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                      text: 'Visited Patients',
                      count: '0',
                    ),
                    CardWidget(
                      image:
                          'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                      text: 'Upcoming Appointment',
                      count: '0',
                    ),
                    CardWidget(
                      image:
                          'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                      text: 'Totel Revenue',
                      count: '0',
                    ),
                    CardWidget(
                      image:
                          'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                      text: 'Cancel Appointment',
                      count: '0',
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}


