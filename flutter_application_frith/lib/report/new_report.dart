import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/report/Report_Draft_Page.dart';
import 'package:flutter_application_frith/report/reportpad.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;
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
  TextEditingController severityOfReport = TextEditingController();
  TextEditingController descriptionOfReport = TextEditingController();
  var reportFiledOfReport = 'Y';
  var sessionManager = SessionManager();
  final reportFiledItems = ['Danger', 'High', 'Informative', 'low', 'medium'];
  String? dropdownValue;
  var errorMessage = "";
  var _isLoading = false;
  var dateOfReport = DateTime.now();

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
                        dateOfReport,
                        severityOfReport.text,
                        descriptionOfReport.text,
                        reportFiledOfReport,
                        context,
                        reportpads);
                    //DateTime timeNow = DateTime.now();
                    //String timeNow =
                    //DateFormat('yyyy-MM-dd – kk:mm:ss').format(now);
                    var timeNow = new DateTime.now();
                    var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
                    String formatted =
                        formatter.format(timeNow); // Save this to DB
                    var guardKey = 1;
                    //print(formatted); // Output: 2021-05-11 08:52:45
                    //print(formatter.parse(formatted)); // Convert back to DateTime object

                    //reportFiledOfReport = 'y';
                    _submit(
                        guardKey.toString(),
                        formatted,
                        severityOfReport.text,
                        specificAreaOfReport.text,
                        descriptionOfReport.text,
                        reportFiledOfReport);

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
                      dateOfReport,
                      severityOfReport.text,
                      descriptionOfReport.text,
                      reportFiledOfReport,
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
                  dateOfReport = DateTime.now();
                  _addToList(
                      specificAreaOfReport.text,
                      dateOfReport,
                      severityOfReport.text,
                      descriptionOfReport.text,
                      reportFiledOfReport,
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
      DateTime dateOfReport,
      String severityOfReport,
      String detailsOfReport,
      String reportFiledOfReport,
      BuildContext context,
      List<Reportpad> reportpads) {
    Reportpad report = Reportpad(
        specificArea: specificAreaOfReport,
        date: dateOfReport,
        severity: severityOfReport,
        description: detailsOfReport,
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
                _builddescriptionOfReportTextField(),
                _buildseverityOfReportTextField(),
                _onSubmit(context, reportpads)
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submit(String guardKey, timeSubmitted, String incidentType,
      String specificArea, String description, String reportFiled) async {
    //var url = 'http://192.168.1.21/frith/connection/test_report.php';
    var url = 'http://' +
        globals.GLOBAL_IP +
        '/frith/connection/incident_report_submit.php';

    Map data1 = <String, dynamic>{};
    dynamic guardKey = await SessionManager().get("GuardKey");
    data1['GuardKey'] = guardKey.toString();
    data1['TimeSubmitted'] = timeSubmitted;
    data1['IncidentType'] = incidentType;
    data1['SpecificArea'] = specificArea;
    data1['Description'] = description;
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
            MaterialPageRoute(builder: (context) => SecurityGuards(title: '',)),
          );
          errorMessage = "";
        });
      }
    } else {
      print(jsonData["message"]);
    }
  }
}
