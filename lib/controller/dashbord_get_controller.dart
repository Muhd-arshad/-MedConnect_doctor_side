import 'dart:convert';
import 'dart:developer';

import 'package:doctor_side_flutter/model/doctor_dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../util/constants/api_configuration.dart';
import '../util/constants/storage.dart';

class DashBoardProvder extends ChangeNotifier{
  DoctorDashboardModel? dashboardModel;
  List<String> list = [''];
  Future<dynamic> getDashBoard() async {
 
  String url = Apiconfiguration.baseurl + Apiconfiguration.dashBoard;
  dynamic key = await readToken();
  final headers = {
    'Authorization': 'Bearer $key', // Add the token to the headers
    'Content-Type': 'application/json',
  };

  http.Response response = await http.get(
    Uri.parse(url),
    headers: headers
  );
  log(response.body);
  if(response.statusCode == 200){
    log('fetching');
    Map<String,dynamic> data =jsonDecode(response.body) as Map<String,dynamic>;
    dashboardModel = DoctorDashboardModel.fromJson(data);
    notifyListeners();
    return dashboardModel;
  }else{
   log('Request failed with status code ${response.statusCode}');
  }
}
  
}