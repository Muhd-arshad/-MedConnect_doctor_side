import 'dart:convert';
import 'dart:developer';

import 'package:doctor_side_flutter/util/constants/api_configuration.dart';
import 'package:http/http.dart' as http;

import '../util/constants/storage.dart';

Future<void> editProfilePhoto(String photo) async {
  Map<String, dynamic> data = {"profile": photo};
  dynamic key = await readToken();
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $key',
  };
  String url = Apiconfiguration.baseurl + Apiconfiguration.profilePhoto;
  try {
    http.Response response = await http.patch(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data)

    );
    log(response.body);
    if(response.statusCode == 200){
      log('Profile Photo change successful');
    }else{
      log('failed with ${response.statusCode}');
    }
  } catch (e) {
    log('failed with an exception $e');
  }
}
