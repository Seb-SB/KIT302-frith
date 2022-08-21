import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/InformationPool/create_event_view.dart';
import 'package:flutter_application_frith/InformationPool/event_details.dart';
import 'package:flutter_application_frith/View/business_owners.dart';
import 'package:provider/provider.dart';
import 'event_information_pool.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;

class InformationHomepage extends StatefulWidget {
  InformationHomepage({Key? key}) : super(key: key);

  @override
  _InformationHomepageState createState() => _InformationHomepageState();
}

Widget _list_view_builder(AsyncSnapshot snapshot) {
  if (!snapshot.hasData) {
    return const Center(child: CircularProgressIndicator());
  } else {
    return Expanded(
      //height: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8.0),
        itemExtent: 80,
        itemBuilder: (BuildContext context, index) {
          //var eventItem = informationPoolModel.informationItems[index];
          return ListTile(
            trailing: SizedBox(
              width: 25.0,
              height: 25.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: HexColor(snapshot.data[index].eventColour)),
              ),
            ),
            title: Text(snapshot.data[index].eventTitle),
            subtitle: Text(snapshot.data[index].dateTime),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EventDetailsPanel(event: snapshot.data[index]);
              }));
            },
          );
        },
        itemCount: snapshot.data.length,
      ),
    );
  }
}

class _InformationHomepageState extends State<InformationHomepage> {
  var sessionManager = SessionManager(); //instantiate session
  InformationPoolModel event = InformationPoolModel();

  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  var url =
      'http://' + globals.GLOBAL_IP + '/frith/connection/event_details.php';

  Future<List<EventInformationPool>> _fetch_events() async {
    var data = await http.get(Uri.parse(url));

    var jsonData = json.decode(data.body);

    List<EventInformationPool> events = [];

    for (var v in jsonData) {
      EventInformationPool event = EventInformationPool(
          businessID: int.parse(v['businessID']),
          dateTime: v['dateTime'],
          eventDescription: v['eventDescription'],
          eventTitle: v['eventTitle'],
          levelID: v['levelID'],
          numberOfPerpetrators: int.parse(v['numberOfPerpetrators']),
          eventColour: v['eventColour']);

      events.add(event);

      events.sort((a, b) =>
          DateTime.parse(b.dateTime).compareTo(DateTime.parse(a.dateTime)));
    }

    return events;
  }

  //CreateEvent
  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BusinessOwners()));
          },
        ),
        title: const Text("List of Events"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateEvent()));
                },
                child: Row(
                  children: const [
                    Icon(Icons.create),
                    Text("Create New Event"),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              FutureBuilder(
                future: _fetch_events(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return _list_view_builder(snapshot);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//A little helper widget to avoid runtime errors -- we can't just display a Text() by itself if not inside a MaterialApp, so this workaround does the job
class FullScreenText extends StatelessWidget {
  final String text;

  const FullScreenText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Column(children: [Expanded(child: Center(child: Text(text)))]));
  }
}
/*
  Scaffold buildScaffold(
      BuildContext context, InformationPoolModel informationPoolModel, _) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Events"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemExtent: 80,
                itemBuilder: (_, index) {
                  var eventItem = informationPoolModel.informationItems[index];
                  return ListTile(
                    trailing: SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: HexColor(eventItem.eventColour)),
                      ),
                    ),
                    title: Text(eventItem.eventTitle),
                    subtitle: Text(eventItem.dateTime),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EventDetailsPanel(id: index);
                      }));
                    },
                  );
                },
                itemCount: informationPoolModel.informationItems.length,
              ))
            ]),
      ),
    );
  }
}*/
