import 'dart:developer';

import 'package:doctor_side_flutter/util/constants/api_configuration.dart';
import 'package:doctor_side_flutter/util/constants/storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetapointmentsProvider extends ChangeNotifier {
  Future<void> getApointments() async {
    String key = await readToken();

    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json',
    };
    String url = Apiconfiguration.baseurl + Apiconfiguration.getapoint;
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers:  headers,
      );
      log(response.body);
      if(response.statusCode == 200){
        log('Sucesssfull ');
      }else{
        log('failed with ${response.statusCode}');
      }
    } catch (e) {
      log('failed with exception $e');
    }
  }
}
