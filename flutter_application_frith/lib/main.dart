import 'package:flutter/material.dart';
import 'package:flutter_application_frith/InformationPool/event_information_pool.dart';
import 'package:flutter_application_frith/InformationPool/information_homepage.dart';
import 'package:flutter_application_frith/View/home_page.dart';
import 'package:flutter_application_frith/View/security_login.dart';
import 'package:flutter_application_frith/View/business_login.dart';
import 'package:flutter_application_frith/notepad/notepad.dart';
import 'package:flutter_application_frith/punchClock/GardList.dart';
import 'package:flutter_application_frith/report/reportpad.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ReportpadModel()),
        ChangeNotifierProvider(create: (context) => NotepadModel()),
        ChangeNotifierProvider(create: (context) => InformationPoolModel()),
        ChangeNotifierProvider(create: (context) => GardListModel())

        ///Provider(create: (context) => InformationpoolPage())
      ],
      child: MaterialApp(
        title: 'Frith',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
