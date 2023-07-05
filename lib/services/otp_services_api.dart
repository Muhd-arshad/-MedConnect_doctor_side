import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../util/constants/error_handling.dart';
import '../util/constants/api_configuration.dart';
import '../util/constants/show_snackbar.dart';

Future<bool> otpInput(String otpInput,BuildContext context)async{

  Map<String ,dynamic> payload ={
    "otpCode" : otpInput,
  };
  //192.168.10.250:8080
  String url = Apiconfiguration.baseurl + Apiconfiguration.otpurl;

  var response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body:jsonEncode(payload),
    

  );
  log(response.body.toString());
  // ignore: use_build_context_synchronously
  httpErrorHandler(response: response, context: context, onSucces: (){
      showSnackBar(context, 'Sucessfuly login');
    });
  if(response.statusCode == 200){
    log('sucess');
    return true;
  }else{
    log('Request failed with status code ${response.statusCode}');
    return false;
  }
}