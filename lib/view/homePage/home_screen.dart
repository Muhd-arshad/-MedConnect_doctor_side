import 'package:doctor_side_flutter/controller/dashbord_get_controller.dart';
import 'package:doctor_side_flutter/controller/department_get_controller.dart';
import 'package:doctor_side_flutter/controller/doctor_profile_controller.dart';
import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/apointments/screen_apoinments.dart';
import 'package:doctor_side_flutter/view/chat/screenchat.dart';
import 'package:doctor_side_flutter/view/dashboard/screen_dashboard.dart';
import 'package:doctor_side_flutter/view/profile/screenprofile.dart';
import 'package:doctor_side_flutter/view/scheduletime/screen_schedue_time.dart';
import 'package:doctor_side_flutter/view/uploaddetails/screenupload.dart';
import 'package:doctor_side_flutter/view/widgets/cardwidget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryWidget(
        widget: SafeArea(
          child: Column(
            children: [
              height50,
              height30,
              height10,
              Expanded(
                child: GridView.count(
                  padding: paddingall10,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.2,
                  children: [
                    CardWidget(
                      image:
                          'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                      height: 10,
                      text: 'DashBoard',
                      padding: const EdgeInsets.all(10),
                      onTap: () async{
                       await Provider.of<DashBoardProvder>(context,listen: false).getDashBoard();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenDashboard(),
                          ),
                        );
                      },
                    ),
                    CardWidget(
                      image:
                          'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                      height: 10,
                      text: 'Shedule Time',
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
                          'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                      height: 10,
                      text: 'Apoinments',
                      padding: const EdgeInsets.all(10),
                      onTap: () {
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
                          'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                      height: 10,
                      text: 'Profile',
                      padding: const EdgeInsets.all(10),
                      onTap: () async{
                       await Provider.of<DoctorProfileProvider>(context,listen: false).getProfile();
                       // ignore: use_build_context_synchronously
                       Provider.of<DoctorProfileProvider>(context,listen: false).controller();
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
                          'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                      height: 10,
                      text: 'Chat',
                      padding: const EdgeInsets.all(10),
                      onTap: () async{
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
                            'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                        height: 10,
                        text: 'Upload Details',
                        padding: const EdgeInsets.all(10),
                        onTap: () async{
                            await Provider.of<DepartmentProvider>(context,listen: false).getDepartment();
                            // ignore: use_build_context_synchronously
                            Provider.of<DepartmentProvider>(context,listen: false)
                            .dropdownValue =
                        // ignore: use_build_context_synchronously
                        Provider.of<DepartmentProvider>(context, listen: false)
                            .list[0];
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenUploadDetails(),
                            ),
                          );
                        
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
