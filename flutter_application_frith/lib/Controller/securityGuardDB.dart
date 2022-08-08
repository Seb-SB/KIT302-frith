import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_frith/Model/api_error.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_frith/Model/securityGuard.dart';

import '../Model/api_response_sec.dart';

String baseUrl = 'http://192.168.1.21/frith/'; //might be .128:9001/

Future<ApiResponse> authenticateSecurityGuard(
    String username, String password) async {
  ApiResponse _apiResponse = ApiResponse();

  try {
    final response = await http.post(
        Uri.parse('${baseUrl}connection/security_guard_login.php'),
        body: {
          'Email': username,
          'Password': password,
        });

    print(response.statusCode);
    print(response.body);

    switch (response.statusCode) {
      case 200:
        _apiResponse.Data = SecurityGuard.fromJSON(jsonDecode(response.body));
        break;
      case 401:
        _apiResponse.ApiError = ApiError.fromJson(jsonDecode(response.body));
        break;
      default:
        _apiResponse.ApiError = ApiError.fromJson(jsonDecode(response.body));
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(error: "Server error, please retry.");
  }
  return _apiResponse;
}
/*
Future<SecurityGuard> createSecurityGuard(
    String firstName,
    String lastName,
    String phoneNumber,
    String emailAddress,
    String password,
    String uniqueKey) async {
  var result = await http
      .post(Uri.parse('${baseUrl}connection/security_guard_create.php'), body: {
    "FirstName": firstName,
    "LastName": lastName,
    "PhoneNumber": phoneNumber,
    "EmailAddress": emailAddress,
    "Password": password
  });

  if (result.statusCode == 200) {
    print(result.body); //testing -> print result to console
    var data = json.decode(result.body); //decode json to array

    if (data["error"]) {
      
    }
  }
} */
/*
Future<SecurityGuard> fetchGuard() async {
  final response =
      await http.get(Uri.parse('connection/security_guard_login.php'));

  //if status code returned is 200 then parse the JSON
  if (response.statusCode == 200) {
    return SecurityGuard.fromJSON(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Guard');
  }
}*/
