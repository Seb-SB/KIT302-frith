import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;
import 'package:http/http.dart' as http;

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
  //Normally a model would get from a database here, we are just hardcoding some data for this prototype
  BackupModel() {
    add(Backup(
        Firstname: "Guard1",
        Lastname: "Ron",
        Location: "Launceston",
        Time: "NA",
        test: "",
        id: ""));
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
