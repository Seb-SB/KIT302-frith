//mport 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/report/reportpad.dart';
import 'package:flutter_application_frith/report/reportpad_homepage.dart';
import 'package:provider/provider.dart';

import '../View/security_guards.dart';

class NewReport extends StatefulWidget {
  const NewReport({Key? key}) : super(key: key);

  @override
  _NewReportState createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  TextEditingController locationOfReport = TextEditingController();
  TextEditingController dateOfReport = TextEditingController();
  TextEditingController witnessesOfReport = TextEditingController();
  TextEditingController severityOfReport = TextEditingController();
  TextEditingController descriptionOfReport = TextEditingController();
  TextEditingController partiesOfReport = TextEditingController();
  TextEditingController statusOfReport = TextEditingController();
  final statusItems = ['Danger', 'High', 'Informative', 'low', 'medium'];
  String dropdownValue = 'None';
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Widget _buildlocationOfReportTextField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: locationOfReport,
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

  Widget _buildDateOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: dateOfReport,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a date";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'Date:',
              prefixIcon: Icon(Icons.date_range),
            ),
          ),
        )
      ],
    );
  }
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
                    dropdownValue = newValue!;
                    severityOfReport.text = dropdownValue;
                  });
                },
                items: <String>['Danger', 'High', 'Informative', 'Low', 'Medium', 'None']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
            controller: partiesOfReport,
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
              hintText: 'Details of parties Involved:',
              prefixIcon: Icon(Icons.title),
            ),
          ),
        )
      ],
    );
  }
  Widget _buildstatusOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60.0,
              child: Text("Police Status:   "),
            ),
            SizedBox(width: 60),
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
                    dropdownValue = newValue!;
                    statusOfReport.text = dropdownValue;
                  });
                },
                items: <String>['Reported', 'Under Investigation', 'Solved', 'Closed', 'None']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
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
                  print("pressed");
                  print(severityOfReport.text);
                  if (!formkey.currentState!.validate()) {
                    print("invalid entry");
                  } else {
                    _addToList(locationOfReport.text, dateOfReport.text, witnessesOfReport.text, severityOfReport.text,
                        descriptionOfReport.text, partiesOfReport.text,statusOfReport.text,  context, reportpads);
                    Provider.of<ReportpadModel>(context, listen: false).update();
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
                  _addToList(locationOfReport.text, dateOfReport.text, witnessesOfReport.text, severityOfReport.text,
                      descriptionOfReport.text, partiesOfReport.text,statusOfReport.text,  context, reportpads);
                  Provider.of<ReportpadModel>(context, listen: false).update();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportpadPage()),
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
                  _addToList(locationOfReport.text, dateOfReport.text, witnessesOfReport.text, severityOfReport.text,
                      descriptionOfReport.text, partiesOfReport.text,statusOfReport.text,  context, reportpads);
                  Provider.of<ReportpadModel>(context, listen: false).update();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportpadPage()),
                  );

                },
                child: const Text('Save Draft')),
          ],
        )
      ],
    );
  }

  void _addToList(String locationOfReport, String dateOfReport, String witnessesOfReport, String severityOfReport, String detailsOfReport, String partiesOfReport, String statusOfReport,
      BuildContext context, List<Reportpad> reportpads) {
    Reportpad report =
        Reportpad(location: locationOfReport, date: dateOfReport, witnesses: witnessesOfReport, severity: severityOfReport, description: detailsOfReport, parties: partiesOfReport, status: statusOfReport);

    reportpads.add(report);
  }

  @override
  Widget build(BuildContext context) {
    var reportpads = Provider.of<ReportpadModel>(context, listen: false).reportItems;
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SecurityGuards()),
                    );
                  },
                )
              ],
            ),
            Form(
              key: formkey,
              child: Column(children: <Widget>[
                _buildlocationOfReportTextField(),
                _buildDateOfReportTextField(),
                _buildwitnessesOfReportTextField(),
                _builddescriptionOfReportTextField(),
                _buildPartiesOfReportTextField(),
                _buildstatusOfReportTextField(),
                _buildseverityOfReportTextField(),
                _onSubmit(context, reportpads)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
