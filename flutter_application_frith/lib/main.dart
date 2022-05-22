import 'package:flutter/material.dart';
import 'package:flutter_application_frith/View/home_page.dart';
import 'package:flutter_application_frith/View/security_login.dart';
import 'package:flutter_application_frith/View/business_login.dart';
import 'package:flutter_application_frith/notepad/notepad.dart';
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
    return ChangeNotifierProvider(
      create: (context) => NotepadModel(),
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
