import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:doctor_side_flutter/util/constants/api_configuration.dart';

import '../util/constants/error_handling.dart';
import '../util/constants/show_snackbar.dart';
import '../util/constants/storage.dart';

Future<dynamic> uploadDetails(
  int idnumber,
  String qualification,
  String department,
 int fee,
  int experience,
  String idcardImage,
  String certificateImage,
  BuildContext context,
) async {
   String url = Apiconfiguration.baseurl + Apiconfiguration.uploadDetails;
// String url ='http://10.4.3.105:8080/api/doctor/addDoctorDetails';

  Map<String, dynamic> data = {
    "value": {
    "idNumber": idnumber,
    "qualification": qualification,
    "department": department,
    "fee": fee,
    "experience": experience
  },
  "IdcardImage": idcardImage,
  "certificateImage": certificateImage,
  };
    
  try {
    dynamic key = await readToken();
    http.Response response = await http.patch(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $key',
      },
      body: jsonEncode(data),
    );
    
    log(response.body);
     // ignore: use_build_context_synchronously
     httpErrorHandler(
        response: response,
        context: context,
        onSucces: () {
          showSnackBar(context, 'SucssesFull');
        });
        
    if (response.statusCode == 200) {
      // PATCH request successful
      log('PATCH request successful');
      log(response.body);
       
      return true;
    } else {
      // PATCH request failed
      log('PATCH request failed');
      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');
      return false;
    }
  } catch (e) {
    log(e.toString());
  }
}
