import 'dart:convert';
import 'dart:developer';

import 'package:doctor_side_flutter/model/booked_apointment_model.dart';
import 'package:doctor_side_flutter/util/constants/api_configuration.dart';
import 'package:doctor_side_flutter/util/constants/storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetbookedProvider extends ChangeNotifier {
  BookedApointmentModel? bookedApointmentModel;
  Future<void> getbookedApointment() async {
    dynamic key = await readToken();
    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json',
    };
    String url =
        Apiconfiguration.baseurl + Apiconfiguration.getapoint;
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers
      );
      log(response.body);
      if(response.statusCode == 200){
        log('get booked apoinment successful');
        Map<String,dynamic> data =jsonDecode(response.body) as Map<String,dynamic>;
        bookedApointmentModel =BookedApointmentModel.fromJson(data);
        
      }
    } catch (e) {
      log('get apoinment failed with an exception $e');
    }
  }
}