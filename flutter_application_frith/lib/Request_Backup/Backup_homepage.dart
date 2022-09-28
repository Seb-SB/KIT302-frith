import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../View/security_guards.dart';
import 'Backup.dart';

class BackupPage extends StatefulWidget {
  const BackupPage({Key? key}) : super(key: key);

  @override
  _BackupPageState createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  int cnt = 0;
  int cnt_new = 0;
  bool boolReq = true;
  Color buttonColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Consumer<BackupModel>(builder: buildScaffold);
  }

  Scaffold buildScaffold(BuildContext context, BackupModel backupModel, _) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back up requested'),
        // actions: [_popupMenuButton(context)],
        centerTitle: true,
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
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: ListView.builder(
                      itemBuilder: (_, index) {
                        var notepad = backupModel.items[index];
                        return ListTile(
                          title: Text(notepad.title +
                              "  " +
                              notepad.name +
                              "   " +
                              notepad.location +
                              "   " +
                              notepad.status),
                          //leading: Image.network(image),
                          //added this line, this should be familiar from last week:
                        );
                      },
                      itemCount: backupModel.items.length)),
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
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestPage(title: "title")));
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
  // PopupMenuButton _popupMenuButton(BuildContext context){
  // return PopupMenuButton(
  //    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>
  //  )
  // }
}
