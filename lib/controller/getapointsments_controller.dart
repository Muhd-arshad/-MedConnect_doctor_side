import 'dart:convert';
import 'dart:developer';

import 'package:doctor_side_flutter/model/booked_apointment_model.dart';
import 'package:doctor_side_flutter/util/constants/api_configuration.dart';
import 'package:doctor_side_flutter/util/constants/storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetbookedProvider extends ChangeNotifier {
  BookedApointmentModel? bookedApointmentModel;
  bool isloading = false;
  Future<void> getbookedApointment() async {
    dynamic key = await readToken();
    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json',
    };
    String url = Apiconfiguration.baseurl + Apiconfiguration.getapoint;
    try {
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      log(response.body);
      if (response.statusCode == 200) {
        log('get booked apoinment successful');
        Map<String, dynamic> data =
            jsonDecode(response.body) as Map<String, dynamic>;
        bookedApointmentModel = BookedApointmentModel.fromJson(data);
      }
    } catch (e) {
      log('get apoinment failed with an exception $e');
    }
  }

  Future<bool> patientVisited(int index) async {
    isloading = true;
    String url = Apiconfiguration.baseurl + Apiconfiguration.visited;
    Map<String, dynamic> data = {
      "appointmentId": bookedApointmentModel!.appointments[index].id,
    };
    try {
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      log(response.body);
      if (response.statusCode == 200) {
        log('patients visited successful');
        isloading = false;
        notifyListeners();
        return true;
      } else {
        log('patient visited failed with ${response.statusCode}');
        isloading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      log('failed with an exception $e');
      isloading = false;
      notifyListeners();
    }
    isloading = false;
    notifyListeners();
    return false;
  }

  Future<bool> patientsNotVisited(int index) async {
    isloading =true;
    Map<String, dynamic> data = {
      "appointmentId": bookedApointmentModel!.appointments[index].id
    };
     String url = Apiconfiguration.baseurl + Apiconfiguration.cancel;
    // String url = 'http//:10.4.3.105:8080/api/doctor/cancelAppointment';

    try {
      http.Response response = await http.patch(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data));
          log(response.body);
      if (response.statusCode == 200) {
        log('cancel successful');
        isloading = false;
        notifyListeners();
        return true;
      } else {
        log('Failed with an error${response.statusCode}');
        isloading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      log('cancel apoitnment failed with an exception $e');
      isloading = false;
      notifyListeners();
    }
    isloading = false;
    notifyListeners();
    return false;
  }
}
