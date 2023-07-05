import 'dart:convert';

import 'package:doctor_side_flutter/util/constants/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void httpErrorHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSucces,
}) {
  switch (response.statusCode) {
    case 200:
      onSucces();
      break;
      case 401:
      showSnackBar(context, jsonDecode(response.body)['message']);
      break;
    case 404:
      showSnackBar(context, jsonDecode(response.body)['message']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['message']);
      break;
    default:
      showSnackBar(context, response.body);
  }
}
