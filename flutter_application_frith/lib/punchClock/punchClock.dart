import 'package:flutter/material.dart';

class Business {
  String title;
  int date;
  String address;

  Business({required this.title, required this.date, required this.address});
}

class PunchClockModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Business> items = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  PunchClockModel() {
    add(Business(
        title: "Business1", date: 2022, address: "addess 1"));
    add(Business(
        title: "Business2", date: 2022, address: "addess 2"));
    add(Business(
        title: "Business3", date: 2022, address: "addess 3"));
    add(Business(title: "Business4", date: 2022, address: "addess 4"));
    add(Business(title: "Business5", date: 2022, address: "addess 5"));
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
