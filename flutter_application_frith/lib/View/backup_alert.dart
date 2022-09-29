import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/View/security_login.dart';

import 'package:flutter_application_frith/global_ip.dart' as globals;
import 'package:http/http.dart' as http;
import 'business_login.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int oldLength = -1;
  bool showTiping = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (!showTiping) {
        _getbackdata();
      }
    });
  }

  Future<void> _getbackdata() async {
    // Future<List<Backup>?> _getbackdata() async {
    var url =
        'http://' + globals.GLOBAL_IP + '/frith/connection/backup_list.php';

    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        encoding: Encoding.getByName("utf-8"));
    if (response.statusCode == 200) {
      //  print('request: '+ response.body.toString() + 'request success data');
      var jsonData = await jsonDecode(response.body.toString());
      Map<String, dynamic> map = await json.decode(response.body.toString());
      if (oldLength == -1) {
        oldLength = map['arr'].length;
      } else {
        if (oldLength != map['arr'].length) {
          oldLength = map['arr'].length;
          showTip();
        }
      }
    }
  }

  showTip() {
    showTiping = true;
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Yow have a New Request Backup Message, please check.'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('Yes')),
            ],
          );
        }).then((value) => showTiping = false);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

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
                  MaterialPageRoute(builder: (context) => BusLogin()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
