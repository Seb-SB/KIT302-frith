import 'package:flutter/material.dart';
import 'reportpad_details.dart';
import 'reportpad_homepage.dart';

class Reportpad {
  String location;
  String date;
  String time;
  int type;
  String description;
  String parties;
  int status;

  Reportpad({required this.location, required this.date, required this.time, required this.type, required this.description,
      required this.parties, required this.status});
}

class ReportpadModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Reportpad> reportItems = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  ReportpadModel() {
    add(Reportpad(
        location: "lobby", date: "01/03/2022", time: "1pm", type: 2, description: "The 1st report is ...", parties: "joe blogs", status: 4));
    add(Reportpad(
        location: "lobby", date: "01/03/2022", time: "1pm", type: 2, description: "The 2nd report is ...", parties: "joe blogs", status: 4));
    add(Reportpad(
        location: "lobby", date: "01/03/2022", time: "1pm", type: 2, description: "The 3rd report is ...", parties: "joe blogs", status: 4));
    add(Reportpad(
        location: "lobby", date: "01/03/2022", time: "1pm", type: 2, description: "The 4th report is ...", parties: "joe blogs", status: 4));
    add(Reportpad(
        location: "lobby", date: "01/03/2022", time: "1pm", type: 2, description: "The 5th report is ...", parties: "joe blogs", status: 4));
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
