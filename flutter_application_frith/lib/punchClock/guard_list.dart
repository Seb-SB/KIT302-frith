import 'package:flutter/material.dart';

class Guard {
  String title;
  int date;
  String address;

  Guard({required this.title, required this.date, required this.address});
}

class GardListModel extends ChangeNotifier {
  final List<Guard> items = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this prototype
  GardListModel() {
    add(Guard(title: "guard1", date: 2022, address: "address 1"));
    add(Guard(title: "guard2", date: 2022, address: "address 2"));
    add(Guard(title: "guard3", date: 2022, address: "address 3"));
  }

  void add(Guard item) {
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
