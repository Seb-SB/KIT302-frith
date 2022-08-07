import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_frith/InformationPool/event_information_pool.dart';
import 'package:provider/provider.dart';

class EventDetailsPanel extends StatefulWidget {
  const EventDetailsPanel({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<EventDetailsPanel> createState() => _EventDetailsPanelState();
}

class _EventDetailsPanelState extends State<EventDetailsPanel> {
  @override
  Widget build(BuildContext context) {
    var event_details =
        Provider.of<InformationPoolModel>(context, listen: false)
            .informationItems;
    var event = event_details[widget.id];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    event.eventTitle,
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Reported:  " + event.dateTime,
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Number of Perpetrators:  " +
                        event.numberOfPerpetrators.toString(),
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    event.eventDescription,
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
