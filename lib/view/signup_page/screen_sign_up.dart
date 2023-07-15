import 'package:doctor_side_flutter/controller/doctor_signup_controller.dart';
import 'package:doctor_side_flutter/view/otppage/screenotp.dart';
import 'package:doctor_side_flutter/view/widgets/buttonwidget.dart';
import 'package:doctor_side_flutter/view/widgets/customtextwidget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:doctor_side_flutter/view/widgets/textformwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../util/constants/sizedbox.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryWidget(
          widget: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Consumer<SignupProvider>(
              builder: (context, signupProvider, child) {
            return Form(
              key: signupProvider.formGlobalKey2,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      text: 'Welcome',
                      size: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    const TextWidget(
                      text: 'sign up for the app',
                      size: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    height30,
                    TextformFeildWidget(
                        controller: signupProvider.firstnamecontroller,
                        labelText: 'FirstName'),
                    height10,
                    TextformFeildWidget(
                        controller: signupProvider.secondnamecontroller,
                        labelText: 'SecondName'),
                    height10,
                    TextformFeildWidget(
                        controller: signupProvider.phonenumbercontroller,
                        labelText: 'PhoneNumbeer'),
                    height10,
                    TextformFeildWidget(
                        controller: signupProvider.emailcontroller,
                        labelText: 'Email'),
                    height10,
                    TextformFeildWidget(
                        controller: signupProvider.passwordcontroller,
                        labelText: 'Password'),
                    height10,
                    TextformFeildWidget(
                      controller: signupProvider.confirmpasswordcontroller,
                      labelText: 'Conform Password',
                    ),
                    height30,
                    ButtonWidget(
                        text: 'Sign Up',
                        onPressed: () async {
                          bool status =
                              await signupProvider.docotorsignup(context);
                          if (status == true) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScreenOtpPage(),
                              ),
                            );
                          }
                        },
                        height: 50,
                        width: 160)
                  ],
                ),
              ),
            );
          }),
        ),
      )),
    );
  }
}
