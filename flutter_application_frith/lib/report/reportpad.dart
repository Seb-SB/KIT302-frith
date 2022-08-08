import 'package:flutter/material.dart';

class Reportpad {
  String specificArea;
  //String date;
  String witnesses;
  String severity;
  String description;
  String partiesInvolved;
  String reportFiled;

  Reportpad(
      {required this.specificArea,
      //required this.date,
      required this.witnesses,
      required this.severity,
      required this.description,
      required this.partiesInvolved,
      required this.reportFiled});
}

class ReportpadModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Reportpad> reportItems = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  ReportpadModel() {
    add(Reportpad(
        specificArea: "lobby",
        //date: "01/03/2022",
        witnesses: "1pm",
        severity: "Danger",
        description: "The 1st report is ...",
        partiesInvolved: "joe blogs",
        reportFiled: "y"));
    add(Reportpad(
        specificArea: "lobby",
        //date: "01/03/2022",
        witnesses: "1pm",
        severity: "Danger",
        description: "The 2nd report is ...",
        partiesInvolved: "joe blogs",
        reportFiled: 'Y'));
    add(Reportpad(
        specificArea: "lobby",
        //date: "01/03/2022",
        witnesses: "1pm",
        severity: "Danger",
        description: "The 3rd report is ...",
        partiesInvolved: "joe blogs",
        reportFiled: 'Y'));
    add(Reportpad(
        specificArea: "lobby",
        //date: "01/03/2022",
        witnesses: "1pm",
        severity: "Danger",
        description: "The 4th report is ...",
        partiesInvolved: "joe blogs",
        reportFiled: "Y"));
    add(Reportpad(
        specificArea: "lobby",
        //date: "01/03/2022",
        witnesses: "1pm",
        severity: "Danger",
        description: "The 5th report is ...",
        partiesInvolved: "joe blogs",
        reportFiled: "N"));
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
