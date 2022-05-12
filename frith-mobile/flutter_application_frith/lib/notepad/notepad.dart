import 'package:flutter/material.dart';
import 'notepad_details.dart';
import 'notepad_homepage.dart';

class Notepad
{
  String title;
  int date;
  String details;

  Notepad({required this.title, required this.date, required this.details});
}

class NotepadModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Notepad> items = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  NotepadModel() {
    add(Notepad(title: "Notepad1", date: 2022, details: "The first note is ..."));
    add(Notepad(title: "Notepad2", date: 2022, details: "The second note is ..."));
    add(Notepad(title: "Notepad3", date: 2022, details: "The third note is ..."));
    add(Notepad(title: "Notepad4", date: 2022, details: "The 4th note is ..."));
    add(Notepad(title: "Notepad5", date: 2022, details: "The 5th note is ..."));

  }

  void add(Notepad item) {
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
