import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;
import 'package:http/http.dart' as http;
// import 'package:mysql1/mysql1.dart';

class Backup {
  String Firstname;
  String Lastname;
  String Location;
  String Time;  
  String test;
  String id;

  Backup(
      {required this.Firstname,
      required this.Lastname,
      required this.Location,
      required this.Time,
      required this.test,
      required this.id});
}

class BackupModel extends ChangeNotifier {
  /// Internal, private state of the list.
  List<Backup> items = [];
  //Normally a model would get from a database here, we are just hardcoding some data for this week
  BackupModel() {
    // items= _getbackdata() as List<Backup>;
    // for (var item in items) {
    //   print("item :" + item.name.toString());
    //   // add(Backup(
    //   //     title: item.title,
    //   //     name: item.name,
    //   //     location: item.location,
    //   //     status: item.status));
    // }
    add(Backup(
        Firstname: "Guard1", Lastname: "Ron", Location: "Launceston", Time: "NA", test: "", id: ""));
    // add(Backup(
    //     title: "Guard2", name: "Harry", location: "Launceston", status: "NA"));
    // add(Backup(
    //     title: "Guard3", name: "Dobbyy", location: "Launceston", status: "NA"));
    // add(Backup(
    //     title: "Guard4", name: "Draco", location: "Launceston", status: "NA"));
    // add(Backup(
    //     title: "Guard5",
    //     name: "Neville",
    //     location: "Launceston",
    //     status: "NA"));


    
  }

  void add(Backup item) {
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
