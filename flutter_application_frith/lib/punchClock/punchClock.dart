import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;
import 'package:http/http.dart' as http;
class Business {
  String id;
  String title;
  int date;
  String address;

  Business({required this.id,required this.title, required this.date, required this.address});
}

class PunchClockModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Business> items = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  PunchClockModel() {
    initData();
    // add(Business(
    //     title: "Business1", date: 2022, address: "addess 1"));
    // add(Business(
    //     title: "Business2", date: 2022, address: "addess 2"));
    // add(Business(
    //     title: "Business3", date: 2022, address: "addess 3"));
    // add(Business(title: "Business4", date: 2022, address: "addess 4"));
    // add(Business(title: "Business5", date: 2022, address: "addess 5"));
  }

  initData() async {
    var url = 'http://' +
        globals.GLOBAL_IP +
        '/frith-backend/connection/bussiness_show.php';
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
      print(data);
      for (var i=0 ;i< data.length;i++) {
        add(
            Business(id: data[i]['businessID'],title: data[i]['BusinessName'], date: 21, address: ''));
      }
    }
  }


  void add(Business item) {
    items.add(item);
    update();
  }

  void removeAll() {
    items.clear();
    update();
  }

  //update any listeners
  // This call tells the widgets that are listening to this model to rebuild.
  void update() {
    notifyListeners();
  }
}
