import 'package:flutter/cupertino.dart';
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
  //电话
  String url  = "tel:000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("Emergency Call"),
          ),
      body: Container(
          child: GestureDetector(
              onTap: () {
                //拨打电话
              launch(url);
              },
              child: Text("Call Emergency..."))),
    );
  }
}

class EmergencyPhoneModel {}
