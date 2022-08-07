import 'package:flutter/material.dart';
import 'package:flutter_application_frith/InformationPool/event_details.dart';
import 'package:provider/provider.dart';
import 'event_information_pool.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';

class InformationHomepage extends StatefulWidget {
  InformationHomepage({Key? key}) : super(key: key);

  @override
  _InformationHomepageState createState() => _InformationHomepageState();
}

class _InformationHomepageState extends State<InformationHomepage> {
  var sessionManager = SessionManager(); //instantiate session

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<InformationPoolModel>(builder: buildScaffold);
  }

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
class CustomListItem extends StatelessElement {
  const CustomListItem({
    Key? key,
    required this.thumbnail, //colour block
    required this.title,
    required this.time,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: thumbnail,
            flex: 3,
          ),
          Expanded(
            flex: 2,
            child: _EventDescription(
              title: title,
              time: time,
            ),
          ),
          const Icon(Icons.more_vert, size: 10.0),
        ],
      ),
    );
  }
}

class _EventDescription extends StatelessWidget {
  const _EventDescription({
    required this.title,
    required this.time,
  }) : super(key: key);

  final String title;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            time,
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }*/

