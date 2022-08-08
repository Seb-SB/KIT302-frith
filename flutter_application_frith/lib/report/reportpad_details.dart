import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/Model/securityGuard.dart';
import 'package:flutter_application_frith/report/reportpad.dart';
import 'package:flutter_application_frith/report/Report_Draft_Page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_application_frith/Model/securityGuard.dart';
import 'package:flutter_application_frith/View/security_login.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import '../View/security_guards.dart';
import 'package:intl/intl.dart';
import 'reportpad.dart';

GlobalKey<FormState> formkey = GlobalKey<FormState>();

class ReportpadDetails extends StatefulWidget {
  const ReportpadDetails({Key? key, required this.id}) : super(key: key);
  final int id; //Add this line
  @override
  _ReportpadDetailsState createState() => _ReportpadDetailsState();
}

class _ReportpadDetailsState extends State<ReportpadDetails> {
  final _formKey = GlobalKey<FormState>();
  final specificAreaController = TextEditingController();
  //final dateController = TextEditingController();
  final witnessesController = TextEditingController();
  final severityController = TextEditingController();
  final descriptionController = TextEditingController();
  final partiesInvolvedController = TextEditingController();
  final reportFiledController = TextEditingController();
  var errorMessage = "";
  var _isLoading = false;
  //var timeNow;
  @override
  Widget build(BuildContext context) {
    var reportpads =
        Provider.of<ReportpadModel>(context, listen: false).reportItems;
    var reportpad = reportpads[widget.id];

    specificAreaController.text = reportpad.specificArea;
    //dateController.text = reportpad.date;
    witnessesController.text = reportpad.witnesses;
    severityController.text = reportpad.severity;
    descriptionController.text = reportpad.description;
    partiesInvolvedController.text = reportpad.partiesInvolved;
    reportFiledController.text = reportpad.reportFiled;

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
                    //Display movie id
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
                                  const InputDecoration(labelText: "Witnesses"),
                              controller: witnessesController,
                              autofocus: true,
                            ),
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
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Parties Involved"),
                              controller: partiesInvolvedController,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  onPrimary: Colors.white,
                                ),
                                onPressed: () {
                                  if (!formkey.currentState!.validate()) {
                                    print("invalid entry");
                                  } else {
                                    //DateTime timeNow = DateTime.now();
                                    //String timeNow =
                                    //DateFormat('yyyy-MM-dd – kk:mm:ss').format(now);
                                    DateFormat dateFormat =
                                        DateFormat("yyyy-MM-dd HH:mm:ss");
                                    String timeNow =
                                        dateFormat.format(DateTime.now());

                                    //reportFiledOfReport = 'y';
                                    _submit(
                                        //timeNow,
                                        specificAreaController.text,
                                        witnessesController.text,
                                        severityController.text,
                                        descriptionController.text,
                                        partiesInvolvedController.text,
                                        reportFiledController.text);

                                    Provider.of<ReportpadModel>(context,
                                            listen: false)
                                        .update();
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('Submit')),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      reportpad.specificArea =
                                          specificAreaController.text;
                                      //reportpad.date = dateController.text;
                                      reportpad.witnesses =
                                          witnessesController.text;
                                      reportpad.severity =
                                          severityController.text;
                                      reportpad.description =
                                          descriptionController.text;
                                      reportpad.partiesInvolved =
                                          partiesInvolvedController.text;
                                      reportpad.reportFiled =
                                          reportFiledController.text;

                                      //update the model

                                      Provider.of<ReportpadModel>(context,
                                              listen: false)
                                          .update();

                                      //return to previous screen
                                      Navigator.pop(context);
                                    }
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
