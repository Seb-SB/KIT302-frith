import 'package:flutter/material.dart';

class Reportpad {
  String specificArea;
  DateTime date;
  String severity;
  String description;
  String reportFiled;

  Reportpad(
      {required this.specificArea,
      required this.date,
      required this.severity,
      required this.description,
      required this.reportFiled});
}

class ReportpadModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Reportpad> reportItems = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  ReportpadModel() {
    add(Reportpad(
        specificArea: "lobby",
        date: DateTime.now(),
        severity: "Danger",
        description: "John, RedHead, pale, 6.2ft, Had a knife ...",
        reportFiled: "N"));
    add(Reportpad(
        specificArea: "Bar",
        date: DateTime.now(),
        severity: "Low",
        description: "Small FM, Brown hair, Pink shirt, stole a drink ...",
        reportFiled: 'N'));
  }

  void add(Reportpad item) {
    reportItems.add(item);
    update();
  }

  void remove(Reportpad item) {
    reportItems.remove(item);
    update();
  }

  void removeAll() {
    reportItems.clear();
    update();
  }

  //update any listeners
  // This call tells the widgets that are listening to this model to rebuild.
  void update() {
    notifyListeners();
  }
}
