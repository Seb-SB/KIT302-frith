import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../View/security_guards.dart';
import 'Backup.dart';
import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;
import 'package:http/http.dart' as http;

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
  // List<Backup> items = [];
  List<Backup> backupList = [];
  //  BackupModel backupModel;

  /// 获取列表数据
  Future<void> _getbackdata() async {
    // Future<List<Backup>?> _getbackdata() async {
    var url =
        'http://' + globals.GLOBAL_IP + '/frith/connection/backup_list.php';

    // List<Backup> backupList;
    // Map data = {'name': name, 'location': location, 'time': time};

    var jsonData = null;

    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        // body: jsonEncode(data),
        encoding: Encoding.getByName("utf-8"));
    if (response.statusCode == 200) {
      //  print('request: '+ response.body.toString() + 'request success data');
      jsonData = await jsonDecode(response.body.toString());
      Map<String, dynamic> map = await json.decode(response.body.toString());



        // Map mapres = map['arr'];

        // _backupList = (jsonData as List<dynamic>)
        //     .map((e) => Backup.fromJSON(e as Map<String, dynamic>))
        //     .toList();
        // print(_backupList.toString() + 'request success data');

        // print('JsonData: ' + jsonData.toString() + 'jsonData success data');
        print('arr: ' + map['arr'].runtimeType.toString() + ' arr success data');
        print('arr[0]: ' + map['arr'][0].toString() + ' arr success data');
        // Map map2 = map['arr'][0];
        // print("map['First'] = "+map2['Firstname'].toString());
        for(var i=0; i<3; i++){
          Map maptemp = map['arr'][i];
          print("maptemp: "+maptemp.toString());
          backupList.add(Backup(
              Firstname: maptemp['Firstname'].toString(),
              Lastname: maptemp['Lastname'].toString(),
              Location:maptemp['Location'].toString(),
              Time:maptemp['Time'].toString(),
              test:maptemp['test'].toString(),
              id:maptemp['id'].toString(),
          ));

        }



        // listMap.forEach((element) {
        //
        //     Backup b = new Backup(
        //         Firstname: element['Firstname'],
        //         Lastname: element['Lastname'],
        //         Location: element['Location'],
        //         Time: element['Time'],
        //         test: element['test'],
        //         id: element['id']);
        //     backupList.add(b);
        // });
        // backupList = List<Backup>.from(map['arr']);
        // List<Backup> res =json.decode(mapres.toString());
        // List<Backup> res =map['arr'];
        // for(var i = 0; i<3; i++) {
        //   Backup b = map['arr'][i];
        //   // Backup b = new Backup(
        //   //     Firstname: i.Firstname,
        //   //     Lastname: i.Lastname,
        //   //     Location: i.Location,
        //   //     Time: i.Time,
        //   //     test: i.test,
        //   //     id: i.id);
        //   backupList.add(b);
        // }
        // backupList = json.decode(map['arr'].toString());
        // map = json.decode(jsonData);
        //  map = jsonData;
        // String arr = map['arr'];
        // _backupList = json.decode(arr);
        // for (var i; i < _backupList.length;i++)
        // print("backup List $i:" + _backupList[i].toString());
        // return backupList;




    } else {
      print(jsonData["errmsg"]);
    }
    // return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getbackdata();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BackupModel>(builder: buildScaffold);
  }

  Scaffold buildScaffold(BuildContext context, BackupModel backupModel1, _) {
    for (var item in backupList) {
      print("item :" + item.Lastname.toString());
      backupModel1.add(Backup(
          Firstname: item.Firstname,
          Lastname: item.Lastname,
          Location: item.Location,
          test: item.test,
          id: item.id,
          Time: item.Time));
    }
    // setState(() {
    //      backupModel. add(Backup(
    // Firstname: "Guard22", Lastname: "Ron", Location: "Launceston", Time: "NA", test: "", id: ""));

    // });
    print("Navigator to backup page!");
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
                        var backupOne = backupModel1.items[index];
                        return ListTile(
                          title: Text(backupOne.Firstname +
                              "  " +
                              backupOne.Lastname +
                              "   " +
                              backupOne.Location +
                              "   " +
                              backupOne.Time),
                          //leading: Image.network(image),
                          //added this line, this should be familiar from last week:
                        );
                      },
                      itemCount: backupModel1.items.length)),
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
