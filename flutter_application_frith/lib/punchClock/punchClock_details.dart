import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/punchClock/punchClock.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;
import 'package:http/http.dart' as http;


class GuardClockDetails extends StatefulWidget {
  const GuardClockDetails({Key? key, required this.id}) : super(key: key);
  final int id; //Add this line
  @override
  _GuardClockDetailsState createState() => _GuardClockDetailsState();
}

class _GuardClockDetailsState extends State<GuardClockDetails> {


  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final detailsController = TextEditingController();
  static List data = List.empty();
  List location = List.empty();
  String selectedLocation = "1";
  List locationAndGuard = List.empty();

  bool _isLoading = true;
  static int selectedGuard = -1;

  VoidCallback? cancelFunc = null;
  VoidCallback? sureFunc = null;



  VoidCallback cancalFuncImpl = () async{
    var url = 'http://' +
        globals.GLOBAL_IP +
        '/frith-backend/connection/updateShipDetail.php';
    var json = {
      "status" : "0",
      "ShiftID" : data[selectedGuard - 1]['ShiftID'],
    };
    var response = await http.post(Uri.parse(url),
        headers: {
          ///'Content-Type': 'application/x-www-form-urlencoded',
          ///'Accept': 'application/json'
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(json),
    );
    if (response.statusCode == 200) {
      _this.updateUi('0');
    }
  };

  VoidCallback sureFuncImpl = () async {
    var url = 'http://' +
        globals.GLOBAL_IP +
        '/frith-backend/connection/updateShipDetail.php';
    var json = {
      "status" : "1",
      "ShiftID" : data[selectedGuard - 1]['ShiftID'],
    };
    var response = await http.post(Uri.parse(url),
      headers: {
        ///'Content-Type': 'application/x-www-form-urlencoded',
        ///'Accept': 'application/json'
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(json),
    );
    if (response.statusCode == 200) {
      _this.updateUi('1');
    }
  };

  static late _GuardClockDetailsState _this;

  @override
  Widget build(BuildContext context) {
    _this = this;
    var business = Provider.of<PunchClockModel>(context, listen: false).items;
    var bussiness = business[widget.id];

    titleController.text = bussiness.title;
    dateController.text = bussiness.date.toString();
    detailsController.text = bussiness.address;

    if(_isLoading){
      initData(bussiness.id);
      _isLoading = false;
    }
    // load guards

    return Consumer<PunchClockModel>(builder: (context, notepadModel, _) {

      return Scaffold(
          appBar: AppBar(
            title: const Text("detail"),
            centerTitle: true,
          ),
          body: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            '${bussiness.title}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            width: 300,
                            height: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: ListView.builder(
                                itemBuilder: (_, index) {
                                  return ListTile(
                                    title: Text(
                                          'guard name: ${data[index]['FirstName']} ${data[index]['LastName']} location: ${data[index]['areaName']}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    //leading: Image.network(image),
                                    //added this line, this should be familiar from last week:
                                  );
                                },
                                itemCount: data.length)),
                        DropdownButton<String>(
                          style: TextStyle(color: Colors.green),
                          items: location.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item['AreaName']),
                              value: item['AreaID'].toString(),
                            );
                          }).toList(),
                          onChanged: (value) {
                            print('change v=$value');
                            setState(() {
                              selectedLocation = value!;
                            });
                            final result = data
                                .where((item) => (item['areaID'] as String) == value.toString())
                                .toList();
                            print('result=' + result.toString());
                            setState(() {
                              locationAndGuard = result;
                            });
                          },
                          value: selectedLocation,
                        ),
                        Container(
                            width: 300,
                            height: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: ListView.builder(
                                itemBuilder: (_, index) {
                                  return ListTile(
                                    selected: selectedGuard == index + 1,
                                    title: Text('guard name:' + locationAndGuard[index]['FirstName'] + ' ' + locationAndGuard[index]['LastName']),
                                    onTap: () {
                                      setState(() {
                                        selectedGuard = index + 1;
                                      });
                                      // set button status
                                      if (locationAndGuard[selectedGuard - 1]['status'] == '0') {
                                        setState(() {
                                          sureFunc = sureFuncImpl;
                                          cancelFunc = null;
                                        });
                                      } else {
                                        setState(() {
                                          cancelFunc = cancalFuncImpl;
                                          sureFunc = null;
                                        });
                                      }
                                    },
                                    //leading: Image.network(image),
                                    //added this line, this should be familiar from last week:
                                  );
                                },
                                itemCount: locationAndGuard.length)),

                        Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: cancelFunc,
                              child: Text('End Shift'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red)),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            ElevatedButton(
                              onPressed: sureFunc,
                              child: Text('Start Shift'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green)),
                            ),
                          ],
                        ),
                      ],
                    )
                    //Display movie id
                  ])));
    });
  }

  void initData(id) async {
    var url = 'http://' +
        globals.GLOBAL_IP +
        '/frith-backend/connection/bussiness_gard_show.php?bussinessId=' + id;
    var response = await http.get(Uri.parse(url),
        headers: {
          ///'Content-Type': 'application/x-www-form-urlencoded',
          ///'Accept': 'application/json'
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      var ret = jsonDecode(response.body);
      print(ret);
      setState(() {
        data = ret;
      });
    }

    var url2 = 'http://' +
        globals.GLOBAL_IP +
        '/frith-backend/connection/getArea.php';
    response = await http.get(Uri.parse(url2),
        headers: {
          ///'Content-Type': 'application/x-www-form-urlencoded',
          ///'Accept': 'application/json'
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      setState(() {
        location = json;
      });

      final result = data
          .where((item) => (item['areaID'] as String) == location[0]['AreaID'].toString())
          .toList();
      setState(() {
        locationAndGuard = result;
      });
    }

  }

  void updateUi(status) {
    if (status == '0') {
      setState(() {
        sureFunc = sureFuncImpl;
        cancelFunc = null;
      });
    } else {
      setState(() {
        cancelFunc = cancalFuncImpl;
        sureFunc = null;
      });
    }
    setState(() {
      data[selectedGuard - 1]['status'] = status;
    });

  }



}
