
import 'package:flutter/material.dart';
import 'dart:developer';

// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../services/schedule_time_post_service.dart';

class ScheduletimeProvider extends ChangeNotifier {
  TextEditingController datecontroller = TextEditingController();
  TextEditingController startTimecontroller = TextEditingController();
  TextEditingController endTimecontroller = TextEditingController();
  TextEditingController sloatcontroller = TextEditingController();
  final formGlobalKey3 = GlobalKey<FormState>();
  DateTime? selecteddate;

// bool isloading =false;
  DateTime? get selectedDate => selecteddate;

  void setSelectedDate(DateTime? date) {
    selecteddate = date;
    notifyListeners();
  }

  Future<dynamic> timeSchedule(BuildContext context) async {
    if (formGlobalKey3.currentState!.validate()) {
      log(selecteddate.toString());
     
      bool status = await schudeuleTime(
          selecteddate.toString(),
          startTimecontroller.text,
          endTimecontroller.text,
          sloatcontroller.text,
          context);
      if (status == true) {
        return true;

      } else {
        return false;
      }

     
    }
     notifyListeners();
  }
}
