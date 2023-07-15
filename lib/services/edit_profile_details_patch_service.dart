import 'dart:convert';
import 'dart:developer';

import 'package:doctor_side_flutter/util/constants/api_configuration.dart';
import 'package:http/http.dart' as http;

import '../util/constants/storage.dart';

// "profile"
Future<dynamic> editProfile(
  String firstName,
  String email,
  int experience,
  int phoneNumber,
) async {
  Map<String, dynamic> data = {
    "details": {
      "firstName": firstName,
      "email": email,
      "experience": experience,
      "phoneNumber": phoneNumber
    }
  };
  String url = Apiconfiguration.baseurl + Apiconfiguration.updateProfileDetails;

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
    // ignore: use_build_context_synchronously
    // httpErrorHandler(response: response, context: context, onSucces: (){
    //   showSnackBar(context, 'Profile Updated');
    // });
    log(response.body);
    if (response.statusCode == 200) {
      log('patch meethod sucessful');
      return true;
    } else {
      log('failed with ${response.statusCode}');
    }
  } catch (e) {
    log('failed with an exception $e');
  }
  return false;
}
