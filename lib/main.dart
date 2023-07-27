import 'package:doctor_side_flutter/controller/chatable_user_get_controller.dart';
import 'package:doctor_side_flutter/controller/doctor_login_controller.dart';
import 'package:doctor_side_flutter/controller/doctor_profile_controller.dart';
import 'package:doctor_side_flutter/controller/getapointsments_controller.dart';
import 'package:doctor_side_flutter/controller/message_user_post_controller.dart';
import 'package:doctor_side_flutter/view/loginPage/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/dashbord_get_controller.dart';
import 'controller/department_get_controller.dart';
import 'controller/doctor_signup_controller.dart';
import 'controller/scedule_time_controller.dart';
import 'controller/upload_details_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorloginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UploadDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DepartmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashBoardProvder(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScheduletimeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetbookedProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatableUserGetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetUserMessageProvider(),
        ),
        
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
