import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'informationPool.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

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
    throw UnimplementedError();
  }
}
