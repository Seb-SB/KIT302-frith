import 'package:flutter/material.dart';
import 'information_homepage.dart';

class EventInformationPool {
  int businessID;
  String dateTime;
  String levelID;
  String eventTitle;
  int numberOfPerpetrators;
  String eventDescription;
  String eventColour;
  //TODO get colour from database

  EventInformationPool(
      {required this.businessID,
      required this.dateTime,
      required this.eventDescription,
      required this.eventTitle,
      required this.levelID,
      required this.numberOfPerpetrators,
      required this.eventColour});

  factory EventInformationPool.fromJSON(Map<String, dynamic> json) {
    return EventInformationPool(
        businessID: json["businessID"],
        dateTime: json["dateTime"],
        eventDescription: json["eventDescription"],
        eventTitle: json["eventTitle"],
        levelID: json["levelID"],
        numberOfPerpetrators: json["numberOfPerpetrators"],
        eventColour: json["eventColour"]);
  }
}

class InformationPoolModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<EventInformationPool> informationItems = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  InformationPoolModel() {
    add(EventInformationPool(
        businessID: 1,
        dateTime: "2021-07-23 12:00:02.000",
        eventDescription: "This happened!!",
        eventTitle: "EVENT TITLE",
        levelID: "H",
        numberOfPerpetrators: 6,
        eventColour: "#eb4034"));
    add(EventInformationPool(
        businessID: 30,
        dateTime: "2022-07-23 12:00:02.000",
        eventDescription: "This happened!! erer",
        eventTitle: "EVENT TITLE2",
        levelID: "D",
        numberOfPerpetrators: 4,
        eventColour: "#262424"));
  }

  void add(EventInformationPool item) {
    informationItems.add(item);
    update();
  }
  /*
  void sort() {
    informationItems.sort(
        (a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));
  }

  void removeAll() {
    informationItems.clear();
    update();
  }*/

  //update any listeners
  // This call tells the widgets that are listening to this model to rebuild.
  void update() {
    notifyListeners();
  }

  /*get(String? id) {}*/
}
