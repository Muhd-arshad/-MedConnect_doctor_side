import 'package:doctor_side_flutter/services/login_service_api.dart';
import 'package:flutter/material.dart';

class DoctorloginProvider extends ChangeNotifier {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  Future<bool> loginTohome(BuildContext context) async {
    if (formGlobalKey.currentState!.validate()) {
      bool status = await loginToHome(
          emailcontroller.text, passwordcontroller.text, context);
      if (status == true) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
