import 'package:flutter/material.dart';

class Notepad {
  String title;
  String date;
  String details;

  Notepad({required this.title, required this.date, required this.details});
}

class NotepadModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Notepad> items = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this prototype
  NotepadModel() {
    add(Notepad(
        title: "Sunday Shift incident",
        date: "2021-05-23 08:00:02.000",
        details: "Talk to boss about shift swap"));
    add(Notepad(
        title: "Bar fight Friday",
        date: "2021-09-25 02:45:09.000",
        details: "2 young males, no contact, verbal assault"));
    add(Notepad(
        title: "Stolen Vodka",
        date: "2021-11-20 12:00:02.000",
        details: "review security camera tape at main bar for stolen vodka"));
  }

  void add(Notepad item) {
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
