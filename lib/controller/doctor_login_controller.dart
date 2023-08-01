

import 'package:doctor_side_flutter/services/login_service_api.dart';
import 'package:flutter/material.dart';

class DoctorloginProvider extends ChangeNotifier {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  bool? isloading = false;

  Future<bool> loginTohome(BuildContext context) async {
    isloading =true;
    notifyListeners();
    if (formGlobalKey.currentState!.validate()) {
      bool status = await loginToHome(
          emailcontroller.text, passwordcontroller.text, context);
      if (status == true) {
        isloading =false;
        notifyListeners();
        return true;
      } else {
        isloading =false;
        notifyListeners();
        return false;
      }
    }
    isloading =false;
    notifyListeners();
    return false;
  }
  void clearField(){
    emailcontroller.clear();
    passwordcontroller.clear();
  notifyListeners();
  }

}
