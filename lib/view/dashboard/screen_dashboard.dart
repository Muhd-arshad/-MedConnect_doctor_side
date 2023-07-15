import 'package:doctor_side_flutter/controller/dashbord_get_controller.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/widgets/cardwidget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                child: Consumer<DashBoardProvder>(
                 
                  builder: (context,dashboardProvider,child) {
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 20,
                      children:  [
                        CardWidget(
                          image:
                              'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                          text: 'Visited Patients',
                          count: dashboardProvider.dashboardModel!.visitedPatients.toString(),
                        ),
                        CardWidget(
                          image:
                              'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                          text: 'Upcoming Appointment',
                          count: dashboardProvider.dashboardModel!.bookedAppointments.toString(),
                        ),
                        CardWidget(
                          image:
                              'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                          text: 'Totel Revenue',
                          count: dashboardProvider.dashboardModel!.totalRevenue.toString(),
                        ),
                        CardWidget(
                          image:
                              'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                          text: 'Cancel Appointment',
                          count: dashboardProvider.dashboardModel!.cancelledAppointments.toString(),
                        ),
                      ],
                    );
                  }
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}


