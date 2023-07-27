import 'dart:convert';
import 'dart:developer';

import 'package:doctor_side_flutter/model/chatable_user.dart';
import 'package:doctor_side_flutter/util/constants/api_configuration.dart';
import 'package:doctor_side_flutter/util/constants/storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatableUserGetProvider extends ChangeNotifier {
  UserChatModel? userChatModel;
  Future<void> getChatableUser() async {
    
    final key = await readToken();
    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json',
    };

    String url = Apiconfiguration.baseurl + Apiconfiguration.chatableUser;

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers
      );
      if(response.statusCode == 200){
        Map<String,dynamic> data = jsonDecode(response.body) as Map<String,dynamic>;
        userChatModel = UserChatModel.fromJson(data);
      }
    } catch (e) {
      log('get chable user failed with an exception $e');
    }
  }
 
}
