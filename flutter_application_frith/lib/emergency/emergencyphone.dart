import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyPhone extends StatefulWidget {
  const EmergencyPhone({Key? key, required this.phone}) : super(key: key);

  final String phone;

  @override
  _EmergencyPhoneState createState() => _EmergencyPhoneState();
}

class _EmergencyPhoneState extends State<EmergencyPhone> {
  String get phone => '000';
  //call 000
  String url = "tel:000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency Call"),
      ),
      body: Container(
        child: GestureDetector(
          child: AlertDialog(
            title: Text("Notice"),
            content: Text("Are you sure you would like to call Emergency?"),
            actions: <Widget>[
              TextButton(
                child: Text("No"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text("Yes"),
                onPressed: () {
                  launch(url);
                },
              ),
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

class EmergencyPhoneModel {}
