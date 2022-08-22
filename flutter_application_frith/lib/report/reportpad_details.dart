import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/report/reportpad.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;
import '../View/security_guards.dart';
import 'reportpad.dart';

GlobalKey<FormState> formkey = GlobalKey<FormState>();

class ReportpadDetails extends StatefulWidget {
  const ReportpadDetails({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  _ReportpadDetailsState createState() => _ReportpadDetailsState();
}

class _ReportpadDetailsState extends State<ReportpadDetails> {
  final _formKey = GlobalKey<FormState>();
  final specificAreaController = TextEditingController();
  //final dateController = TextEditingController();
  final severityController = TextEditingController();
  final descriptionController = TextEditingController();
  var reportFiledController = 'Y';
  var errorMessage = "";
  var _isLoading = false;
  var timeNow;
  @override
  Widget build(BuildContext context) {
    var reportpads =
        Provider.of<ReportpadModel>(context, listen: false).reportItems;
    var reportpad = reportpads[widget.id];

    specificAreaController.text = reportpad.specificArea;
    //dateController.text = reportpad.date;
    severityController.text = reportpad.severity;
    descriptionController.text = reportpad.description;
    reportFiledController = reportpad.reportFiled;

    return Consumer<ReportpadModel>(builder: (context, reportpadModel, _) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Edit Incident Report"),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Report Index ${widget.id}"),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: "Location"),
                              controller: specificAreaController,
                              autofocus: true,
                            ),
                            // TextFormField(
                            //   decoration:
                            //       const InputDecoration(labelText: "Date"),
                            //   controller: dateController,
                            // ),
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: "Severity"),
                              controller: severityController,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Description"),
                              controller: descriptionController,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      onPrimary: Colors.white,
                                    ),
                                    onPressed: () {
                                      reportpad.specificArea =
                                          specificAreaController.text;
                                      reportpad.date = DateTime.now();
                                      reportpad.severity =
                                          severityController.text;
                                      reportpad.description =
                                          descriptionController.text;
                                      reportpad.reportFiled =
                                          reportFiledController;
                                      _deleteFromList(
                                          reportpad.specificArea,
                                          reportpad.date,
                                          reportpad.severity,
                                          reportpad.description,
                                          reportpad.reportFiled,
                                          context,
                                          reportpads);
                                      var timeNow = new DateTime.now();
                                      var formatter =
                                          new DateFormat('yyyy-MM-dd HH:mm:ss');
                                      String formatted = formatter
                                          .format(timeNow); // Save this to DB
                                      var guardKey = 1;
                                      _submit(
                                          guardKey.toString(),
                                          formatted,
                                          reportpad.severity,
                                          reportpad.specificArea,
                                          reportpad.description,
                                          reportpad.reportFiled);

                                      Provider.of<ReportpadModel>(context,
                                              listen: false)
                                          .update();
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Submit')),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    reportpad.specificArea =
                                        specificAreaController.text;
                                    reportpad.date = DateTime.now();
                                    reportpad.severity =
                                        severityController.text;
                                    reportpad.description =
                                        descriptionController.text;
                                    reportpad.reportFiled =
                                        reportFiledController;

                                    //update the model

                                    Provider.of<ReportpadModel>(context,
                                            listen: false)
                                        .update();
                                    //return to previous screen
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.save),
                                  label: const Text("Save Values")),
                            ),
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

                            //we will add form fields etc here
                          ],
                        ),
                      ),
                    )
                  ])));
    });
  }

  void _deleteFromList(
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

    reportpads.remove(report);
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
