import 'dart:developer';
import 'package:doctor_side_flutter/controller/chatable_user_get_controller.dart';
import 'package:doctor_side_flutter/controller/dashbord_get_controller.dart';
import 'package:doctor_side_flutter/controller/department_get_controller.dart';
import 'package:doctor_side_flutter/controller/doctor_profile_controller.dart';
import 'package:doctor_side_flutter/controller/getapointsments_controller.dart';
import 'package:doctor_side_flutter/controller/loading_controller.dart';
import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/view/apointments/screen_apoinments.dart';
import 'package:doctor_side_flutter/view/chat/screenchat.dart';
import 'package:doctor_side_flutter/view/dashboard/screen_dashboard.dart';
import 'package:doctor_side_flutter/view/loginPage/loginpage.dart';
import 'package:doctor_side_flutter/view/profile/screenprofile.dart';
import 'package:doctor_side_flutter/view/scheduletime/screen_schedue_time.dart';
import 'package:doctor_side_flutter/view/uploaddetails/screenupload.dart';
import 'package:doctor_side_flutter/view/widgets/cardwidget.dart';
import 'package:doctor_side_flutter/view/widgets/customtextwidget.dart';
import 'package:doctor_side_flutter/view/widgets/loading_screen_widget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final lodindProvider =Provider.of<LoadingController>(context);
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const TextWidget(
                text: 'Do You Want To Exit The App',
                fontWeight: FontWeight.bold,
                size: 18,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false);
                  },
                  child: const TextWidget(
                    text: 'Yes',
                    colorText: Colors.red,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const TextWidget(
                    text: 'No',
                    colorText: Colors.green,
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        body: PrimaryWidget(
          widget: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.15,
                    ),
                    Expanded(
                      child: GridView.count(
                        padding: paddingall10,
                        crossAxisCount: 2,
                        mainAxisSpacing: MediaQuery.sizeOf(context).height * .029,
                        crossAxisSpacing: MediaQuery.sizeOf(context).width * .03,
                        childAspectRatio: 1.2,
                        children: [
                         
                              CardWidget(
                                  image:
                                      'assets/images/business-man-walking-standing-confident-confidence-vector-8212123.jpg',
                                  height: 10,
                                  text: 'DashBoard',
                                  padding: const EdgeInsets.all(10),
                                  onTap: () async {
                                   lodindProvider.setLoading(true);
                                    log(Provider.of<DashBoardProvder>(context,
                                            listen: false)
                                        .isloading
                                        .toString());
                                    await Provider.of<DashBoardProvder>(context,
                                            listen: false)
                                        .getDashBoard();
                                        lodindProvider.setLoading(false);
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ScreenDashboard(),
                                      ),
                                    );
                                  },
                                ),
                          CardWidget(
                            image:
                                'assets/images/medical-appointment-time-icon-on-white-vector.jpg',
                            height: 10,
                            text: 'Schedule Time',
                            padding: const EdgeInsets.all(10),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ScreenShuduleTime(),
                                  ));
                            },
                          ),
                          CardWidget(
                            image:
                                'assets/images/istockphoto-1286487110-612x612.jpg',
                            height: 10,
                            text: 'Appointments',
                            padding: const EdgeInsets.all(10),
                            onTap: () async {
                              lodindProvider.setLoading(true);
                              await Provider.of<GetbookedProvider>(context,
                                      listen: false)
                                  .getbookedApointment();
                                  lodindProvider.setLoading(false);
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ScreenApointments(),
                                ),
                              );
                            },
                          ),
                          CardWidget(
                            image:
                                'assets/images/3774299.png',
                            height: 10,
                            text: 'Profile',
                            padding: const EdgeInsets.all(10),
                            onTap: () async {
                              lodindProvider.setLoading(true);
                              await Provider.of<DoctorProfileProvider>(context,
                                      listen: false)
                                  .getProfile();
                              // ignore: use_build_context_synchronously
                              Provider.of<DoctorProfileProvider>(context,
                                      listen: false)
                                  .controller();
                                  lodindProvider.setLoading(false);
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ScreenProfile(),
                                ),
                              );
                            },
                          ),
                          CardWidget(
                            image:
                                'assets/images/icons8-chat-48.png',
                            height: 10,
                            text: 'Chat',
                            padding: const EdgeInsets.all(10),
                            onTap: () async {
                              lodindProvider.setLoading(true);
                              await Provider.of<ChatableUserGetProvider>(context,
                                      listen: false)
                                  .getChatableUser();
                              // ignore: use_build_context_synchronously
                              await Provider.of<DoctorProfileProvider>(context,
                                      listen: false)
                                  .getProfile();
                                  lodindProvider.setLoading(false);
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ScreenChat(),
                                ),
                              );
                            },
                          ),
                          CardWidget(
                              image:
                                  'assets/images/270006.png',
                              height: 10,
                              text: 'Upload Details',
                              padding: const EdgeInsets.all(10),
                              onTap: () async {
                                lodindProvider.setLoading(true);
                                await Provider.of<DepartmentProvider>(context,
                                        listen: false)
                                    .getDepartment();
                                // ignore: use_build_context_synchronously
                                Provider.of<DepartmentProvider>(context,
                                            listen: false)
                                        .dropdownValue =
                                    // ignore: use_build_context_synchronously
                                    Provider.of<DepartmentProvider>(context,
                                            listen: false)
                                        .list[0];
                                        lodindProvider.setLoading(false);
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ScreenUploadDetails(),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
               const LoadingScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
