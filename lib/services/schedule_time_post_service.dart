import 'dart:convert';
import 'dart:developer';

import 'package:doctor_side_flutter/util/constants/api_configuration.dart';
import 'package:doctor_side_flutter/util/constants/error_handling.dart';
import 'package:doctor_side_flutter/util/constants/show_snackbar.dart';
import 'package:doctor_side_flutter/util/constants/storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<dynamic> schudeuleTime(
    dynamic date, String starttime, String endTime, String slot,BuildContext context) async {
      log('entered post method tym schedule');
  String key = await readToken();
  Map<String, dynamic> payload = {
    "details": {
      "date": date,
      "startingTime": starttime,
      "endingTime": endTime,
      "slot": slot
    }
  };
  final headers = {
    'Authorization': 'Bearer $key', // Add the token to the headers
    'Content-Type': 'application/json',
  };
  String url = Apiconfiguration.baseurl+Apiconfiguration.schudule;
  try {
    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: headers
    );
    // ignore: use_build_context_synchronously
    httpErrorHandler(response: response, context: context, onSucces: (){
    showSnackBar(context, 'Uploaded Sucsessfuly');
    });
    if(response.statusCode == 200){
      log('post metheod sucsessful');
      return true;
    }else{
      log('failed ${response.body}');
      return false;
    }
  } catch (e) {
    log('failed with exception $e');
  }
}
