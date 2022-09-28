import 'package:flutter/material.dart';
import 'package:flutter_application_frith/Request_Backup/backup_list.dart';
import 'package:provider/provider.dart';
import '../View/security_guards.dart';
import 'Backup.dart';
import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;
import 'package:http/http.dart' as http;

class BackupPage extends StatefulWidget {
  Backup backup;
  BackupPage(this.backup);

  @override
  _BackupPageState createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  int cnt = 0;
  int cnt_new = 0;
  bool boolReq = true;
  Color buttonColor = Colors.green;
  // List<Backup> items = [];
  List<Backup> backupList = [];
  //  BackupModel backupModel;
  late Backup backup;

  @override
  void initState() {
    super.initState();
    backup = widget.backup;
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back up requested'),
        // actions: [_popupMenuButton(context)],
        //centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Back up requested',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 80),
              child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${backup.Firstname} ${backup.Lastname}'),
                      SizedBox(height: 5),
                      Text('${backup.Location}'),
                      SizedBox(height: 5),
                      Text('${backup.Time}'),
                    ],
                  )),
            )),
            Container(
              alignment: Alignment.center,
              height: 30,
              child: (Text(
                  "Attention:  There are now $cnt_new people on the way. ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent))),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  color: buttonColor,
                  height: 80,
                  width: 180,
                  child: InkWell(
                      enableFeedback: boolReq,
                      child: Text('On my way',
                          style: TextStyle(fontSize: 26, color: Colors.white)),
                      onTap: () {
                        print("Request Backup");
                        setState(() {
                          cnt_new = cnt + 1;
                          boolReq = false;
                          buttonColor = Colors.grey;
                        });
                      }),
                ),
                SizedBox(height: 40),
                Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: 180,
                  color: Colors.redAccent,
                  child: InkWell(
                      child: Text('Unable',
                          style: TextStyle(fontSize: 26, color: Colors.white)),
                      onTap: () {
                        //print("Request Backup");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => backup_list ()));
                      }),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

}
