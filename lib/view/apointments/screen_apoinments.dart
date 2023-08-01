import 'package:doctor_side_flutter/controller/getapointsments_controller.dart';
import 'package:doctor_side_flutter/util/constants/color.dart';
import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/apointments/widget/tilewidget.dart';
import 'package:doctor_side_flutter/view/widgets/appbar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/circleavatar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/customtextwidget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScreenApointments extends StatelessWidget {
  const ScreenApointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
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
                              if(getapointmentProvider.bookedApointmentModel!.appointments[index].cancelled  == true){
                                return height10;
                              } 
                            return Tilewidget(
                              ontap: () {
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.27,
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundImage: NetworkImage(
                                                  getapointmentProvider
                                                      .bookedApointmentModel!
                                                      .appointments[index]
                                                      .userId
                                                      .profilePhoto),
                                            ),
                                            height10,
                                            Row(
                                              children: [
                                                const TextWidget(
                                                    text: 'Name :',
                                                    fontWeight: FontWeight.bold,
                                                    size: 16),
                                                TextWidget(
                                                  text:
                                                      '${getapointmentProvider.bookedApointmentModel!.appointments[index].userId.firstName} ${getapointmentProvider.bookedApointmentModel!.appointments[index].userId.lastName}',
                                                  fontWeight: FontWeight.bold,
                                                  size: 16,
                                                )
                                              ],
                                            ),
                                            height10,
                                            Row(
                                              children: [
                                                const TextWidget(
                                                    text: 'Date :',
                                                    fontWeight: FontWeight.bold,
                                                    size: 16),
                                                TextWidget(
                                                  text: DateFormat('dd/MM/yy')
                                                      .format(getapointmentProvider
                                                          .bookedApointmentModel!
                                                          .appointments[index]
                                                          .date),
                                                  fontWeight: FontWeight.bold,
                                                  size: 16,
                                                ),
                                              ],
                                            ),
                                            height10,
                                            Row(
                                              children: [
                                                const TextWidget(
                                                    text: 'Time :',
                                                    fontWeight: FontWeight.bold,
                                                    size: 16),
                                                TextWidget(
                                                  text: getapointmentProvider
                                                      .bookedApointmentModel!
                                                      .appointments[index]
                                                      .time,
                                                  fontWeight: FontWeight.bold,
                                                  size: 16,
                                                ),
                                              ],
                                            ),
                                            height20,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    bool status =
                                                        await getapointmentProvider
                                                            .patientVisited(
                                                                index);
                                                    // getapointmentProvider.isloading =true;
                                                    if (status == true) {
                                                      // getapointmentProvider.isloading =false;
                                                      // ignore: use_build_context_synchronously
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 30,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: btcolor),
                                                    child: const Center(
                                                      child: TextWidget(
                                                        text: 'Visited',
                                                        colorText: cwhite,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        size: 18,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    bool status =
                                                        await getapointmentProvider
                                                            .patientsNotVisited(
                                                                index);
                                                    // getapointmentProvider.isloading =true;
                                                    if (status == true) {
                                                      // getapointmentProvider.isloading =false;
                                                      // ignore: use_build_context_synchronously
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 30,
                                                    width: 110,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.red),
                                                    child: const Center(
                                                      child: TextWidget(
                                                        text: 'Cancel',
                                                        colorText: cwhite,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        size: 18,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
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
