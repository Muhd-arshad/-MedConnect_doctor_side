import 'dart:developer';

import 'package:doctor_side_flutter/services/otp_services_api.dart';
import 'package:doctor_side_flutter/util/constants/color.dart';
import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/homePage/home_screen.dart';
import 'package:doctor_side_flutter/view/widgets/buttonwidget.dart';
import 'package:doctor_side_flutter/view/widgets/customtextwidget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
 TextEditingController pinputcontoller =TextEditingController();
class ScreenOtpPage extends StatelessWidget {
  const ScreenOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          color: cwhite),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.white,
      ),
    );
   
    return Scaffold(
      body: PrimaryWidget(
        widget: SafeArea(
          child: Padding(
            padding: horizontal10,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  height50,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Image(
                      image: AssetImage('assets/images/OTP 1.png'),
                    ),
                  ),
                  const TextWidget(
                    text: 'E-mail Verification',
                    size: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  height10,
                  const TextWidget(
                    text: 'We have send a code to your mail',
                    fontWeight: FontWeight.bold,
                    colorText: Colors.grey,
                  ),
                  height30,
                  Pinput(
                    validator: (value) {
                      if(value?.length != 6 || value == null){
                       return 'Enter 6 digit Otp';
                      }
                      return null;
                    },
                    controller: pinputcontoller,
                   pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                  ),
                  height30,
                  ButtonWidget(
                      text: 'Verify',
                      onPressed: ()async {
                        bool status = await otpInput(pinputcontoller.text, context);
                        if(status == true){
                          log(status.toString());
                         // ignore: use_build_context_synchronously
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenHome(),
                          ),
                        );
                        }
                        
                      },
                      height: 50,
                      width: 140)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
