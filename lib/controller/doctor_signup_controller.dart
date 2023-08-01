import 'package:doctor_side_flutter/services/signup_services_api.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController secondnamecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  final GlobalKey<FormState> formGlobalKey2 = GlobalKey<FormState>();
  bool? isloading = false;
  Future<bool> docotorsignup(BuildContext context) async {
    isloading = true ;
    notifyListeners();
    if (formGlobalKey2.currentState!.validate()) {
      bool status = await signup(
          firstnamecontroller.text,
          secondnamecontroller.text,
          int.parse(phonenumbercontroller.text),
          emailcontroller.text,
          passwordcontroller.text,
          confirmpasswordcontroller.text,
          context);
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
}
