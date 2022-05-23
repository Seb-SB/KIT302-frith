import 'package:flutter/material.dart';
import 'package:flutter_application_frith/View/security_login.dart';
import 'package:flutter_application_frith/View/business_login.dart';

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Frith'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Security Guard'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecLogin()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Business Owner'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BusLogin()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
