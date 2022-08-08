import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/report/Report_Draft_Page.dart';
import 'package:flutter_application_frith/report/reportpad.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../View/security_guards.dart';

class NewReport extends StatefulWidget {
  const NewReport({Key? key}) : super(key: key);

  ///const NewReport({key, required this.guard});

  ///final SecurityGuard guard;

  @override
  _NewReportState createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  TextEditingController specificAreaOfReport = TextEditingController();
  //TextEditingController dateOfReport = TextEditingController();
  TextEditingController witnessesOfReport = TextEditingController();
  TextEditingController severityOfReport = TextEditingController();
  TextEditingController descriptionOfReport = TextEditingController();
  TextEditingController partiesInvolvedOfReport = TextEditingController();
  TextEditingController reportFiledOfReport = TextEditingController();
  var sessionManager = SessionManager();
  final reportFiledItems = ['Danger', 'High', 'Informative', 'low', 'medium'];
  String? dropdownValue;
  var errorMessage = "";
  var _isLoading = false;
  var timeNow;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Widget _buildspecificAreaOfReportTextField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: specificAreaOfReport,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a Location";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'Location:',
              prefixIcon: Icon(Icons.location_on),
            ),
          ),
        )
      ],
    );
  }

  // Widget _buildDateOfReportTextField() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: <Widget>[
  //       const SizedBox(height: 10.0),
  //       Container(
  //         alignment: Alignment.center,
  //         height: 60.0,
  //         child: TextFormField(
  //           controller: dateOfReport,
  //           keyboardType: TextInputType.text,
  //           validator: (value) {
  //             if (value == null || value.isEmpty) {
  //               return "Please enter a date";
  //             }
  //             return null;
  //           },
  //           decoration: const InputDecoration(
  //             contentPadding: EdgeInsets.symmetric(vertical: 15),
  //             border: InputBorder.none,
  //             hintText: 'Date:',
  //             prefixIcon: Icon(Icons.date_range),
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  Widget _buildwitnessesOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: witnessesOfReport,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a type";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'witnesses:',
              prefixIcon: Icon(Icons.title),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildseverityOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60.0,
              child: Text("Enter severity Level:   "),
            ),
            SizedBox(width: 20),
            Container(
              alignment: Alignment.center,
              height: 60.0,
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_upward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    severityOfReport.text = dropdownValue.toString();
                  });
                },
                hint: const Center(child: Text("None")),
                items: <String>[
                  'Danger',
                  'High',
                  'Informative',
                  'Low',
                  'Medium'
                ].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _builddescriptionOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: descriptionOfReport,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter some reports";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'Details of incident:',
              prefixIcon: Icon(Icons.title),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPartiesOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: partiesInvolvedOfReport,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter people involved";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'Details of Parties Involved:',
              prefixIcon: Icon(Icons.title),
            ),
          ),
        )
      ],
    );
  }

  // Widget _buildreportFiledOfReportTextField() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: <Widget>[
  //       const SizedBox(height: 10.0),
  //       Row(
  //         children: [
  //           Container(
  //             alignment: Alignment.center,
  //             height: 60.0,
  //             child: Text("Police Status:   "),
  //           ),
  //           SizedBox(width: 60),
  //           Container(
  //             alignment: Alignment.center,
  //             height: 60.0,
  //             child: DropdownButton<String>(
  //               value: dropdownValue,
  //               icon: const Icon(Icons.arrow_upward),
  //               elevation: 16,
  //               style: const TextStyle(color: Colors.deepPurple),
  //               underline: Container(
  //                 height: 2,
  //                 color: Colors.deepPurpleAccent,
  //               ),
  //               onChanged: (String? newValue) {
  //                 setState(() {
  //                   dropdownValue = newValue!;
  //                   reportFiledOfReport.text = dropdownValue;
  //                 });
  //               },
  //               items: <String>[
  //                 'Reported',
  //                 'Under Investigation',
  //                 'Solved',
  //                 'Closed',
  //                 'None'
  //               ].map<DropdownMenuItem<String>>((String value) {
  //                 return DropdownMenuItem<String>(
  //                   value: value,
  //                   child: Text(value),
  //                 );
  //               }).toList(),
  //             ),
  //           )
  //         ],
  //       )
  //     ],
  //   );
  // }

  Widget _onSubmit(BuildContext context, List<Reportpad> reportpads) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            SizedBox(width: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  print(severityOfReport.text);
                  if (!formkey.currentState!.validate()) {
                    print("invalid entry");
                  } else {
                    _addToList(
                        specificAreaOfReport.text,
                        //dateOfReport.text,
                        witnessesOfReport.text,
                        severityOfReport.text,
                        descriptionOfReport.text,
                        partiesInvolvedOfReport.text,
                        reportFiledOfReport.text,
                        context,
                        reportpads);
                    //DateTime timeNow = DateTime.now();
                    //String timeNow =
                    //DateFormat('yyyy-MM-dd – kk:mm:ss').format(now);
                    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
                    String timeNow = dateFormat.format(DateTime.now());

                    //reportFiledOfReport = 'y';
                    _submit(
                      timeNow,
                      severityOfReport.text,
                      specificAreaOfReport.text,
                      witnessesOfReport.text,
                      descriptionOfReport.text,
                      partiesInvolvedOfReport.text,
                      //reportFiledOfReport.text
                    );

                    Provider.of<ReportpadModel>(context, listen: false)
                        .update();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit')),
            SizedBox(width: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  _addToList(
                      specificAreaOfReport.text,
                      //dateOfReport.text,
                      witnessesOfReport.text,
                      severityOfReport.text,
                      descriptionOfReport.text,
                      partiesInvolvedOfReport.text,
                      reportFiledOfReport.text,
                      context,
                      reportpads);
                  Provider.of<ReportpadModel>(context, listen: false).update();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportDraftPage()),
                  );
                },
                child: const Text('Load Draft')),
            SizedBox(width: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  _addToList(
                      specificAreaOfReport.text,
                      //dateOfReport.text,
                      witnessesOfReport.text,
                      severityOfReport.text,
                      descriptionOfReport.text,
                      partiesInvolvedOfReport.text,
                      reportFiledOfReport.text,
                      context,
                      reportpads);
                  Provider.of<ReportpadModel>(context, listen: false).update();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportDraftPage()),
                  );
                },
                child: const Text('Save Draft')),
          ],
        )
      ],
    );
  }

  void _addToList(
      String specificAreaOfReport,
      //String dateOfReport,
      String witnessesOfReport,
      String severityOfReport,
      String detailsOfReport,
      String partiesInvolvedOfReport,
      String reportFiledOfReport,
      BuildContext context,
      List<Reportpad> reportpads) {
    Reportpad report = Reportpad(
        specificArea: specificAreaOfReport,
        //date: dateOfReport,
        witnesses: witnessesOfReport,
        severity: severityOfReport,
        description: detailsOfReport,
        partiesInvolved: partiesInvolvedOfReport,
        reportFiled: reportFiledOfReport);

    reportpads.add(report);
  }

  @override
  Widget build(BuildContext context) {
    var reportpads =
        Provider.of<ReportpadModel>(context, listen: false).reportItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Report"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: [
                SizedBox(width: 80),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Create New Report',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  child: const Text('Delete'),
                  onPressed: () {
                    Navigator.pop(context);
                    /* TESTING
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecurityGuards(guard: null,)),
                    );*/
                  },
                )
              ],
            ),
            Form(
              key: formkey,
              child: Column(children: <Widget>[
                _buildspecificAreaOfReportTextField(),
                //_buildDateOfReportTextField(),
                _buildwitnessesOfReportTextField(),
                _builddescriptionOfReportTextField(),
                _buildPartiesOfReportTextField(),
                //_buildreportFiledOfReportTextField(),
                _buildseverityOfReportTextField(),
                _onSubmit(context, reportpads)
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submit(
      //String timeSubmitted,
      String incidentType,
      String specificArea,
      String description,
      String partiesInvolvedInvolved,
      String witnesses,
      String reportFiled) async {
    var url = 'http://192.168.1.21/frith/connection/incident_report_submit.php';

    Map data1 = <String, dynamic>{};
    dynamic guardKey = await SessionManager().get("GuardKey");

    data1['GuardKey'] = guardKey;
    //data1['TimeSubmitted'] = timeSubmitted;
    data1['IncidentType'] = incidentType;
    data1['SpecificArea'] = specificArea;
    data1['Description'] = description;
    data1['PartiesInvolved'] = partiesInvolvedInvolved;
    data1['Witnesses'] = witnesses;
    data1['ReportFiled'] = reportFiled;

    var jsonData = null;

    ///print(data.entries);

    final response = await http.post(Uri.parse(url),
        headers: {
          // 'Content-Type': 'application/x-www-form-urlencoded',
          // 'Accept': 'application/json'
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data1),
        encoding: Encoding.getByName("utf-8"));

    print(response.body);

    if (response.statusCode == 200) {
      jsonData = await jsonDecode(jsonEncode(response.body));
      print(jsonData);
      jsonData = jsonDecode(jsonData);
      //print(jsonData["error"]);
      if (jsonData["error"] == true) {
        //print(jsonData);
        errorMessage = await jsonData["message"];
        setState(() {
          _isLoading = false;
        });
        //create scaffold

      } else {
        setState(() {
          _isLoading = false;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecurityGuards()),
          );
          errorMessage = "";
        });
      }
    } else {
      print(jsonData["message"]);
    }
  }
}
