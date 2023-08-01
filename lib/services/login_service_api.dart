import 'dart:convert';
import 'dart:developer';

import 'package:doctor_side_flutter/util/constants/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../util/constants/error_handling.dart';
import '../util/constants/api_configuration.dart';
 const FlutterSecureStorage secureStorage = FlutterSecureStorage();
Future<dynamic> loginToHome(
  String mail,
  String password,
  BuildContext context,

) async{

Map<String ,dynamic> payload ={
  "value":{
    "email" :mail,
    "password":password
  }
};
try{
  String url = Apiconfiguration.baseurl + Apiconfiguration.loginurl;
  http.Response response = await http.post(
    Uri.parse(url),
    headers:{'Content-Type': 'application/json'},
    body:jsonEncode(payload),
   
  );
  // ignore: use_build_context_synchronously
  httpErrorHandler(response: response, context: context, onSucces: (){
    showSnackBar(context,'Login Success!');
  });
  if(response.statusCode == 200){
    log('Login sucsess!');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      String token = jsonResponse['token'];
      log(token);
      secureStorage.write(key: 'token', value: token);
   log(response.body);
    return true;
  }else{
    log('Request failed with status code ${response.statusCode}');
    return false;
  }
}catch(e){
 showSnackBar(context, e.toString());
}

}