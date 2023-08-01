
import 'package:doctor_side_flutter/controller/doctor_login_controller.dart';
import 'package:doctor_side_flutter/view/signup_page/screen_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../util/constants/color.dart';
import '../../util/constants/padding.dart';
import '../../util/constants/sizedbox.dart';
import '../homePage/home_screen.dart';
import '../widgets/buttonwidget.dart';
import '../widgets/customtextwidget.dart';
import '../widgets/primarywidget.dart';
import '../widgets/textformwidget.dart';

class LoginScreen extends StatelessWidget {
 const LoginScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryWidget(
        widget: Padding(
          padding: horizontal10,
          child: Consumer<DoctorloginProvider>(
           
            builder: (context, doctorloginProvider,child) {
              return Form(
                key: doctorloginProvider.formGlobalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                        colorText: cBlack,
                        fontWeight: FontWeight.bold,
                        size: 40,
                        text: 'Welcome Back'),
                    const TextWidget(
                      // padding: 20,
                      text: 'Login into your Account',
                      fontWeight: FontWeight.bold,
                      size: 20,
                    ),
                    height50,
                    TextformFeildWidget(
                        controller: doctorloginProvider.emailcontroller, labelText: 'Enter your Email'),
                    height30,
                    TextformFeildWidget(
                        controller: doctorloginProvider.passwordcontroller,
                        labelText: 'Enter Your Password'),
                    height30,
                    doctorloginProvider.isloading == true ?const Center(child: CircularProgressIndicator(),):
                    ButtonWidget(text: 'Login',height: 60,width:250, onPressed: ()async {
                      doctorloginProvider.isloading = true;
                     bool status = await doctorloginProvider.loginTohome(context);
                     if(status == true){
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScreenHome(),
                              ),
                            );
                            doctorloginProvider.clearField();
                     }
                     
                    },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextWidget(text: 'Do not have any account?',),
                        TextButton(onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>  const ScreenSignUp(),));
                        }, child:const TextWidget(text: 'Sign Up' , colorText: btcolor,))
                      ],
                    )
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
