import 'package:doctor_side_flutter/controller/getapointsments_controller.dart';
import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/apointments/widget/tilewidget.dart';
import 'package:doctor_side_flutter/view/widgets/appbar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/circleavatar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScreenApointments extends StatelessWidget {
  const ScreenApointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppbarWidget(title: 'Appoinments'),
      ),
      body: PrimaryWidget(
          widget: Padding(
        padding: horizontal10,
        child: Column(
          children: [
            const CircleAvatarWidget(
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              size: 80,
            ),
            height50,
            Provider.of<GetbookedProvider>(context)
                    .bookedApointmentModel!
                    .appointments
                    .isEmpty
                ? const Center(
                    child: Text(
                      'No apoinments yet',
                    ),
                  )
                : Expanded(
                    child: Consumer<GetbookedProvider>(
                        builder: (context, getapointmentProvider, child) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return Tilewidget(
                              slnumber: '${index + 1}',
                              name:
                                  '${getapointmentProvider.bookedApointmentModel!.appointments[index].userId.firstName} ${getapointmentProvider.bookedApointmentModel!.appointments[index].userId.lastName}',
                              date: DateFormat('dd/MM/yy').format(
                                getapointmentProvider.bookedApointmentModel!
                                    .appointments[index].date
                                    .add(
                                  const Duration(days: 1),
                                ),
                              ),
                              time: getapointmentProvider.bookedApointmentModel!
                                  .appointments[index].time,
                            );
                          },
                          separatorBuilder: (context, index) => height10,
                          itemCount: getapointmentProvider
                              .bookedApointmentModel!.appointments.length);
                    }),
                  ),
          ],
        ),
      )),
    );
  }
}
