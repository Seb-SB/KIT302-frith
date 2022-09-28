import 'package:flutter/material.dart';

class Backup {
  String title;
  String name;
  String location;
  String status;

  Backup(
      {required this.title,
      required this.name,
      required this.location,
      required this.status});
}

class BackupModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Backup> items = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  BackupModel() {
    add(Backup(
        title: "Guard1", name: "Ron", location: "Launceston", status: "NA"));
    add(Backup(
        title: "Guard2", name: "Harry", location: "Launceston", status: "NA"));
    add(Backup(
        title: "Guard3", name: "Dobbyy", location: "Launceston", status: "NA"));
    add(Backup(
        title: "Guard4", name: "Draco", location: "Launceston", status: "NA"));
    add(Backup(
        title: "Guard5",
        name: "Neville",
        location: "Launceston",
        status: "NA"));
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
