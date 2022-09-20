import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:flutter_session_manager/flutter_session_manager.dart';

class Business {
  String id;
  String name;
  String phone;
  String email;

  Business({required this.id,required this.name, required this.phone, required this.email});
}

class BusinessModel extends ChangeNotifier {
  final List<Business> items = [];

  BusinessModel() {
    initData();
  }

  initData() async {
    dynamic guardKey = await SessionManager().get("GuardKey");

    var url = 'http://' +
        globals.GLOBAL_IP +
        '/frith/connection/bussiness_display.php';
    final response = await http.post(Uri.parse(url),
        headers: {
          ///'Content-Type': 'application/x-www-form-urlencoded',
          ///'Accept': 'application/json'
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(null),
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //print(guardKey); //testing
      for (var i=0 ;i< data.length;i++) {
        if(guardKey == int.parse(data[i]['PoolID'])){
          add(
              Business(id: data[i]['businessID'],
                  name: data[i]['BusinessName'],
                  phone: data[i]['PhoneNumber'],
                  email: data[i]['EmailAddress'])
          );
        }
      }
    }
  }

  void removeAll() {
    items.clear();
    update();
  }
  void add(Business item) {
    items.add(item);
    update();
  }
  void update() {
    notifyListeners();
  }
}

