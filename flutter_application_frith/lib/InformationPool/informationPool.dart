import 'package:flutter/material.dart';
import 'information_homepage.dart';

class InformationPool {
  String title;
  String time;
  String date;
  String details;

  InformationPool(
      {required this.title,
      required this.time,
      required this.date,
      required this.details});
}

class InformationPoolModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<InformationPool> items = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  InformationPoolModel() {
    add(InformationPool(
        title: "Information1",
        time: "1.00pm",
        date: "2021-05-23 12:00:02.000",
        details: "The first one is ..."));
    add(InformationPool(
        title: "Information2",
        time: "1.00pm",
        date: "2021-07-23 12:00:02.000",
        details: "The second one is ..."));
    add(InformationPool(
        title: "Information3",
        time: "1.00pm",
        date: "2021-07-23 12:00:02.000",
        details: "The  note is ..."));
    add(InformationPool(
        title: "Information4",
        time: "3.00pm",
        date: "2021-05-23 12:00:02.000",
        details: "The  note is ..."));
    add(InformationPool(
        title: "Information5",
        time: "1.00pm",
        date: "2021-05-23 12:00:02.000",
        details: "The note is ..."));
  }

  void add(InformationPool item) {
    items.add(item);
    update();
  }

  void sort() {
    items.sort(
        (a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));
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
