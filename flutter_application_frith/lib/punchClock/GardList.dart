import 'package:flutter/material.dart';

class Gard {
  String title;
  int date;
  String address;

  Gard({required this.title, required this.date, required this.address});
}

class GardListModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Gard> items = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  GardListModel() {
    add(Gard(
        title: "gard1", date: 2022, address: "addess 1"));
    add(Gard(
        title: "gard2", date: 2022, address: "addess 2"));
    add(Gard(
        title: "gard3", date: 2022, address: "addess 3"));
  }

  void add(Gard item) {
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
