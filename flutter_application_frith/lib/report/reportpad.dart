import 'package:flutter/material.dart';
import 'reportpad_details.dart';
import 'reportpad_homepage.dart';

class Reportpad {
  String location;
  String date;
  String witnesses;
  String severity;
  String description;
  String parties;
  String status;

  Reportpad({required this.location, required this.date, required this.witnesses, required this.severity, required this.description,
      required this.parties, required this.status});
}

class ReportpadModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Reportpad> reportItems = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  ReportpadModel() {
    add(Reportpad(
        location: "lobby", date: "01/03/2022", witnesses: "1pm", severity: "Danger", description: "The 1st report is ...", parties: "joe blogs", status: "Reported"));
    add(Reportpad(
        location: "lobby", date: "01/03/2022", witnesses: "1pm", severity: "Danger", description: "The 2nd report is ...", parties: "joe blogs", status: "Reported"));
    add(Reportpad(
        location: "lobby", date: "01/03/2022", witnesses: "1pm", severity: "Danger", description: "The 3rd report is ...", parties: "joe blogs", status: "Reported"));
    add(Reportpad(
        location: "lobby", date: "01/03/2022", witnesses: "1pm", severity: "Danger", description: "The 4th report is ...", parties: "joe blogs", status: "Reported"));
    add(Reportpad(
        location: "lobby", date: "01/03/2022", witnesses: "1pm", severity: "Danger", description: "The 5th report is ...", parties: "joe blogs", status: "Reported"));
  }

  void add(Reportpad item) {
    reportItems.add(item);
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
