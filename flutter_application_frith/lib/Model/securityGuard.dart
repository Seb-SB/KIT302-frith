import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//SecurityGuard securityGuardModelFromMap(String str) =>
//SecurityGuard.fromMap(json.decode(str));
///SecurityGuard guard = SecurityGuard.fromJSON(json);

class SecurityGuard {
  String GuardKey;
  String FirstName;
  String LastName;
  String PhoneNumber;
  String EmailAddress;
  String Password;

  //constructor
  SecurityGuard(
      {required this.GuardKey,
      required this.FirstName,
      required this.LastName,
      required this.PhoneNumber,
      required this.EmailAddress,
      required this.Password});

  factory SecurityGuard.fromJSON(Map<String, dynamic> json) {
    //var list = SecurityGuardJson['items'] as List;
    //List<Item> itemsList = list.map((i) => Item.fromJSON(i)).toList();

    return SecurityGuard(
      GuardKey: json["GuardKey"],
      FirstName: json["FirstName"],
      LastName: json["LastName"],
      PhoneNumber: json["PhoneNumber"],
      EmailAddress: json["EmailAddress"],
      Password: json["Password"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GuardKey'] = GuardKey;
    data['FirstName'] = FirstName;
    data['LastName'] = LastName;
    data['PhoneNumber'] = PhoneNumber;
    data['EmailAddress'] = EmailAddress;
    data['Password'] = Password;

    return data;
  }
}

class LoggedInGuard {
  late SecurityGuard logged_in_guard = SecurityGuard(
      GuardKey: "",
      FirstName: "",
      LastName: "",
      PhoneNumber: "",
      EmailAddress: "",
      Password: "");

  void setGuardValue(SecurityGuard current_guard) {
    logged_in_guard = current_guard;
  }

  SecurityGuard getGuardValue() {
    return logged_in_guard;
  }
}
