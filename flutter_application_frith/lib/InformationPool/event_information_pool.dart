import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_frith/global_ip.dart' as globals;

class EventInformationPool {
  int businessID;
  String dateTime;
  String levelID;
  String eventTitle;
  int numberOfPerpetrators;
  String eventDescription;
  String eventColour;

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

  var url =
      'http://' + globals.GLOBAL_IP + '/frith/connection/event_details.php';

  Future<List<EventInformationPool>> _fetch_events() async {
    var data = await http.get(Uri.parse(url));

    var jsonData = json.decode(data.body);

    List<EventInformationPool> events = [];

    for (var v in jsonData) {
      EventInformationPool event = EventInformationPool(
          businessID: v['businessID'],
          dateTime: v['dateTime'],
          eventDescription: v['eventDescription'],
          eventTitle: v['eventTitle'],
          levelID: v['levelID'],
          numberOfPerpetrators: v['numberOfPerpetrators'],
          eventColour: v['eventColour']);

      events.add(event);
    }

    return events;
  }

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  InformationPoolModel() {
    /*
    add(EventInformationPool(
        businessID: 1,
        dateTime: "2022-03-23 20:00:02.000",
        eventDescription:
            "There was a fight between two groups, two people were knocked out.",
        eventTitle: "Fight in bar",
        levelID: "H",
        numberOfPerpetrators: 6,
        eventColour: "#eb4034"));
    add(EventInformationPool(
        businessID: 30,
        dateTime: "2022-10-23 12:30:02.000",
        eventDescription: "Fake ID displayed - removed from perp.",
        eventTitle: "Fake ID Used",
        levelID: "D",
        numberOfPerpetrators: 4,
        eventColour: "#262424"));
    add(EventInformationPool(
        businessID: 30,
        dateTime: "2022-03-23 04:30:02.000",
        eventDescription: "Perp broke multiple glasses and screamed at staff.",
        eventTitle: "Violent barhopper.",
        levelID: "L",
        numberOfPerpetrators: 1,
        eventColour: "#ebc924"));
    add(EventInformationPool(
        businessID: 30,
        dateTime: "2022-03-23 04:30:02.000",
        eventDescription: "Dangerous individual doing bad things.",
        eventTitle: "Dangerous Individual",
        levelID: "M",
        numberOfPerpetrators: 1,
        eventColour: "#eb9334"));
    add(EventInformationPool(
        businessID: 30,
        dateTime: "2022-03-23 04:30:02.000",
        eventDescription: "Large group leaving due to denial of service.",
        eventTitle: "Large inebriated group on the move",
        levelID: "I",
        numberOfPerpetrators: 10,
        eventColour: "#3489eb"));
        */
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
