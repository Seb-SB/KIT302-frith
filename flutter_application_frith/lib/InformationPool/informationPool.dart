import 'package:flutter/material.dart';
import 'information_homepage.dart';

class InformationPool {
  String title;
  String date;
  String details;

  InformationPool(
      {required this.title,
      required this.date,
      required this.details});
}

class InformationPoolModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<InformationPool>informationItems = [];


  //Normally a model would get from a database here, we are just hardcoding some data for this week
  InformationPoolModel() {
    add(InformationPool(
        title: "Information1",
        date: "2021-05-23 12:00:02.000",
        details: "The first one is ..."));
    add(InformationPool(
        title: "Information2",
        date: "2021-07-23 12:00:02.000",
        details: "The second one is ..."));
    add(InformationPool(
        title: "Information3",
        date: "2021-07-23 12:00:02.000",
        details: "The  note is ..."));
    add(InformationPool(
        title: "Information4",
        date: "2021-05-23 12:00:02.000",
        details: "The  note is ..."));
    add(InformationPool(
        title: "Information5",
        date: "2021-05-23 12:00:02.000",
        details: "The note is ..."));
  }

  void add(InformationPool item) {
    informationItems.add(item);
    update();
  }

  void sort() {
    informationItems.sort(
        (a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));
  }

  void removeAll() {
    informationItems.clear();
    update();
  }

  //update any listeners
  // This call tells the widgets that are listening to this model to rebuild.
  void update() {
    notifyListeners();
  }

  get(String? id) {}
}
