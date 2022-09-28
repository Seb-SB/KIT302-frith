import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;
import 'package:http/http.dart' as http;

import 'Backup.dart';
import 'Backup_homepage.dart';

class backup_list extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return backup_listState();
  }
}

class backup_listState extends State<backup_list> {
  List<Backup> backupList = [];

  @override
  void initState() {
    super.initState();
    _getbackdata();
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
      print('result:$map');

      for (var i = 0; i < map['arr'].length; i++) {
        Map maptemp = map['arr'][i];

        backupList.add(Backup(
          Firstname: maptemp['Firstname'].toString(),
          Lastname: maptemp['Lastname'].toString(),
          Location: maptemp['Location'].toString(),
          Time: maptemp['Time'].toString(),
          test: maptemp['test'].toString(),
          id: maptemp['id'].toString(),
        ));
      }

      setState(() {});
    } else {
      //print(response.body.);
    }
    // return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backup page'),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        margin: EdgeInsets.all(30),
        color: Colors.white,
        child: ListView.builder(
            itemBuilder: ((context, index) {
              return getItem(index);
            }),
            itemCount: backupList.length),
      ),
    );
  }

  getItem(int index) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BackupPage(backupList[index]);
          }));
        },
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${backupList[index].Firstname} ${backupList[index].Lastname}'),
                  SizedBox(height: 5),
                  Text('${backupList[index].Location}'),
                  SizedBox(height: 5),
                  Text('${backupList[index].Time}'),
                ],
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ));
  }
}
