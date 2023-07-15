import 'dart:convert';
import 'dart:developer';
import 'package:doctor_side_flutter/model/doctor_department_model.dart';
import 'package:doctor_side_flutter/util/constants/api_configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DepartmentProvider extends ChangeNotifier {
  List<String> list = [''];
  //  Departmentmodel? departmentmodel;
  String? dropdownValue;
  Future<dynamic> getDepartment() async {
    list.clear();
    String url = Apiconfiguration.baseurl + Apiconfiguration.dptdetails;
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      log('sucsesss');
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      Departmentmodel departmentmodel = Departmentmodel.fromJson(data);
      list.addAll(departmentmodel.departments.map((e) => e.departmentName!));
      log(list.toString());
      notifyListeners();
      return departmentmodel;
    } else {
      log('failed ${response.body}');
    }
  }

  void changevalue(String value) {
    dropdownValue = value;
    notifyListeners();
  }
}
