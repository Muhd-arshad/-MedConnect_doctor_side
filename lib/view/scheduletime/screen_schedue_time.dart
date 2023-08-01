import 'package:doctor_side_flutter/controller/scedule_time_controller.dart';
import 'package:doctor_side_flutter/util/constants/color.dart';
import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/homePage/home_screen.dart';
import 'package:doctor_side_flutter/view/widgets/appbar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/buttonwidget.dart';
import 'package:doctor_side_flutter/view/widgets/circleavatar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:doctor_side_flutter/view/widgets/textformwidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScreenShuduleTime extends StatelessWidget {
  const ScreenShuduleTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarWidget(title: 'Schedule Time'),
      ),
      body: SingleChildScrollView(
        child: PrimaryWidget(
          widget: Padding(
            padding: horizontal10,
            child: Consumer<ScheduletimeProvider>(
                builder: (context, schedultimeProvider, child) {
              return Form(
                key: schedultimeProvider.formGlobalKey3,
                child: Column(
                  children: [
                    height10,
                    const CircleAvatarWidget(
                      image:
                          'assets/images/medical-appointment-time-icon-on-white-vector.jpg',
                      size: 80,
                    ),
                    height50,
                    Container(
                      height: 65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: cwhite,
                          border: Border.all()),
                      child: TextButton.icon(
                        onPressed: () async {
                          final selectedDateTemp = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            // .add(const Duration(days: 60)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 60)),
                          );
                          if (selectedDateTemp == null) {
                            return;
                          } else {
                            schedultimeProvider
                                .setSelectedDate(selectedDateTemp);
                          }
                        },
                        icon: const Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                        ),
                        label: Text(
                          schedultimeProvider.selectedDate == null
                              ? "select date"
                              : DateFormat("yyyy-MM-dd")
                                  .format(schedultimeProvider.selectedDate!),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                    height20,
                    TextformFeildWidget(
                        controller: schedultimeProvider.startTimecontroller,
                        labelText: 'Start Time'),
                    height20,
                    TextformFeildWidget(
                        controller: schedultimeProvider.endTimecontroller,
                        labelText: 'End Time'),
                    height20,
                    TextformFeildWidget(
                        controller: schedultimeProvider.sloatcontroller,
                        labelText: 'Slot'),
                    height20,
                    schedultimeProvider.isloading == true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ButtonWidget(
                            text: 'Upload',
                            onPressed: () async {
                              bool status = await schedultimeProvider
                                  .timeSchedule(context);
                              if (status == true) {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ScreenHome(),
                                  ),
                                );
                              } else {
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                              }
                            },
                            height: 50,
                            width: 150),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
