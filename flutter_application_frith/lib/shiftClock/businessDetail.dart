import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/shiftClock/businessModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
/**
 * Shift status: 0 = not on shift, 1 = on shift
 */

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({Key? key, required this.id}) : super(key: key);

  final int id;
  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final businessNameController = TextEditingController();
  final phoneController = TextEditingController();
  final businessIDController = TextEditingController();
  bool _isLoading = true;
  static List shiftData = List.empty();

  List location = List.empty();
  List selectedArea = List.empty();
  String selectedListValue = "1";
  static int selectedGuard = -1;
  int _selectedIndex = 0;
  bool _isStartAble = false;
  bool _isEndAble = false;
  bool _isOnDuty = false;
  bool _isChange = false;
  late int selfKey;

  @override
  Widget build(BuildContext context) {
    var business = Provider.of<BusinessModel>(context, listen: false).items;
    var item = business[widget.id];

    businessNameController.text = item.name;
    businessIDController.text = item.id;

    if (_isLoading) {
      /*print(item.id); //Testing*/
      initData(item.id);
      _isLoading = false;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Text(
                      businessNameController
                          .text /* + '\n' + dateController.text + '\n' + detailsController.text*/,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 5,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: shiftData.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          leading: const Icon(Icons.people),
                          title: Text(shiftData[index]['areaName']),
                          subtitle: Text(shiftData[index]['FirstName'] +
                              " " +
                              shiftData[index]['LastName']),
                        ));
                      },
                    ),
                  ),
                  //Listview version of Locations
                  /*Center(
                      child:
                      Text('Location',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/5,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red.withOpacity(0),
                        ),
                      ),
                      child: ListView.builder(
                          itemBuilder: (_, index) {
                            return ListTile(
                              title: Text(location[index]['AreaName']),
                              selected: index == _selectedIndex,
                              onTap: () {
                                setState(() {
                                  _isStartAble = false;
                                  _isEndAble = false;
                                  selectedListValue = location[index]['AreaID'].toString();
                                  selectedArea = data.where((item) => (item['areaID'] as String) == selectedListValue.toString()).toList();
                                  print(selectedListValue.toString());
                                  _selectedIndex = index;
                                  if(selectedArea.isEmpty){
                                    _isStartAble = true;
                                  }else{
                                    _isEndAble = true;
                                  }
                                    });
                                  },
                            );
                          },
                          itemCount: location.length),
                    ),*/
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    child: DropdownButton<String>(
                      style: TextStyle(color: Colors.black, fontSize: 50),
                      isExpanded: true,
                      itemHeight: 100.0,
                      iconSize: 50,
                      items: location.map((item) {
                        return DropdownMenuItem(
                          child: Text(item['AreaName']),
                          value: item['AreaID'].toString(),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _isStartAble = false;
                          _isEndAble = false;
                          selectedListValue = value!;
                          selectedArea = shiftData
                              .where((item) =>
                                  (item['areaID'] as String) ==
                                  selectedListValue.toString())
                              .toList();
                          print("selectedListValue: (int)" +
                              selectedListValue.toString() +
                              "/selectedArea" +
                              selectedArea.toString());
                          if (!_isOnDuty) {
                            _isStartAble = true;
                          } else {
                            changeEnd();
                          }
                        });
                      },
                      value: selectedListValue,
                    ),
                  ),

                  /*Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height/5,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 5,
                        ),
                      ),
                        child: ListView.builder(
                            itemBuilder: (_, index) {
                              return ListTile(
                                selected: selectedGuard == index + 1,
                                title: Text(selectedArea[index]['FirstName'] + ' ' + selectedArea[index]['LastName']),
                                onTap: () {
                                  setState(() {
                                    selectedGuard = index + 1;
                                    isStartAble(selectedArea[selectedGuard - 1]['Status']);
                                    isEndAble(selectedArea[selectedGuard - 1]['Status']);
                                  });
                                  print(selectedArea[selectedGuard - 1]['Status']);
                                },
                              );
                            },
                            itemCount: selectedArea.length)
                    ),*/
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 3.5,
                          height: MediaQuery.of(context).size.height / 6,
                          child: ElevatedButton(
                            onPressed: _isStartAble ? startShiftImpl : null,
                            child: new Text(
                              'Start Shift',
                              style: new TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            height: MediaQuery.of(context).size.height / 6,
                            child: ElevatedButton(
                                onPressed: _isEndAble ? endShiftImpl : null,
                                child: new Text(
                                  'End Shift',
                                  style: new TextStyle(fontSize: 20.0),
                                ))),
                      ])
                ])));
  }

  initData(id) async {
    dynamic guardKey = await SessionManager().get("GuardKey");
    selfKey = guardKey;
    var url = 'http://' +
        globals.GLOBAL_IP +
        '/frith/connection/bussiness_gard_show.php?bussinessId=' +
        id;
    var response = await http.get(Uri.parse(url), headers: {
      ///'Content-Type': 'application/x-www-form-urlencoded',
      ///'Accept': 'application/json'
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) {
      var shift = jsonDecode(response.body);
      print(shift);
      setState(() {
        shiftData = shift;
      });
    }
    for (int i = 0; i < shiftData.length; i++) {
      shiftData[i]['GuardKey'] == guardKey;
      _isOnDuty = true;
    }
    print(_isOnDuty);

    var url2 = 'http://' +
        globals.GLOBAL_IP +
        '/frith/connection/getArea.php?bussinessId=' +
        id;
    response = await http.get(Uri.parse(url2), headers: {
      ///'Content-Type': 'application/x-www-form-urlencoded',
      ///'Accept': 'application/json'
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      setState(() {
        location = json;
        //intitialize the default list item, otherwise the page will crush
        if (location.isNotEmpty) {
          selectedListValue = location[0]['AreaID'].toString();
        }
      });

      final result = shiftData
          .where((item) =>
              (item['areaID'] as String) == location[0]['AreaID'].toString())
          .toList();
      setState(() {
        //print(businessIDController.text);  //testing
        selectedArea = result;
        print(selectedArea);
      });
    }
  }

  //check change location or end shift
  void changeEnd() {
    _isStartAble = true;
    _isEndAble = false;
    _isChange = true;
    for (int i = 0; i < selectedArea.length; i++) {
      if (selfKey.toString() == selectedArea[i]['GuardKey']) {
        _isEndAble = true;
        _isStartAble = false;
      }
    }
  }

  //start shift function
  void startShiftImpl() async {
    //if onshift security guard want to change location, needs to end the old shift first
    if (_isChange) {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('ddMMM,yyyy kk:mm:ss').format(now);

      var url = 'http://' +
          globals.GLOBAL_IP +
          '/frith/connection/updateShiftDetail.php';
      var json = {
        "TimeFinished": formattedDate,
        "Status": "0",
        "GuardKey": selfKey.toString(),
      };
      print(json);
      var response = await http.post(
        Uri.parse(url),
        headers: {
          ///'Content-Type': 'application/x-www-form-urlencoded',
          ///'Accept': 'application/json'
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(json),
      );

      if (response.statusCode == 200) {
        print("successfully end shift first");
      }
    }
    dynamic guardKey = await SessionManager().get("GuardKey");
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('ddMMM,yyyy kk:mm:ss').format(now);
    //print(formattedDate);
    var url =
        'http://' + globals.GLOBAL_IP + '/frith/connection/startShift.php';
    var json = {
      "TimeStarted": formattedDate,
      "GuardKey": guardKey,
      "BusinessID": businessIDController.text,
      "AreaID": selectedListValue,
    };
    var response = await http.post(
      Uri.parse(url),
      headers: {
        ///'Content-Type': 'application/x-www-form-urlencoded',
        ///'Accept': 'application/json'
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(json),
    );

    if (response.statusCode == 200) {
      setState(() {
        Navigator.pop(context, true);
      });
    }
  }

  //end shift function
  void endShiftImpl() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('ddMMM,yyyy kk:mm:ss').format(now);

    var url = 'http://' +
        globals.GLOBAL_IP +
        '/frith/connection/updateShiftDetail.php';
    var json = {
      "TimeFinished": formattedDate,
      "Status": "0",
      "GuardKey": selfKey.toString(),
    };
    print(json);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        ///'Content-Type': 'application/x-www-form-urlencoded',
        ///'Accept': 'application/json'
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(json),
    );

    if (response.statusCode == 200) {
      setState(() {
        Navigator.pop(context, true);
      });
    }
  }
}
