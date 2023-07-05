import 'package:doctor_side_flutter/services/signup_services_api.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController secondnamecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  Future<bool> docotorsignup(BuildContext context) async {
    if (formGlobalKey.currentState!.validate()) {
      bool status = await signup(
          firstnamecontroller.text,
          secondnamecontroller.text,
          int.parse(phonenumbercontroller.text),
          emailcontroller.text,
          passwordcontroller.text,
          confirmpasswordcontroller.text,
          context);
      if (status == true) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
