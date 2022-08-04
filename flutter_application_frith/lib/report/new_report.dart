//mport 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/report/reportpad.dart';
import 'package:provider/provider.dart';

class NewReport extends StatefulWidget {
  const NewReport({Key? key}) : super(key: key);

  @override
  _NewReportState createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  TextEditingController locationOfReport = TextEditingController();
  TextEditingController dateOfReport = TextEditingController();
  TextEditingController timeOfReport = TextEditingController();
  TextEditingController typeOfReport = TextEditingController();
  TextEditingController detailsOfReport = TextEditingController();
  TextEditingController partiesOfReport = TextEditingController();
  TextEditingController statusOfReport = TextEditingController();


  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Widget _buildlocationOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              hintText: 'Location',
              prefixIcon: Icon(Icons.title),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDateOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              hintText: 'Date',
              prefixIcon: Icon(Icons.date_range),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildtimeOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: timeOfReport,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a Time";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'Time',
              prefixIcon: Icon(Icons.title),
            ),
          ),
        )
      ],
    );
  }
  Widget _buildtypeOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: typeOfReport,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a type";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'type',
              prefixIcon: Icon(Icons.title),
            ),
          ),
        )
      ],
    );
  }
  Widget _buildDetailsOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: detailsOfReport,
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
              hintText: 'Details',
              prefixIcon: Icon(Icons.details),
            ),
          ),
        )
      ],
    );
  }
  Widget _buildPartiesOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                return "Please enter a people involved";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'people',
              prefixIcon: Icon(Icons.title),
            ),
          ),
        )
      ],
    );
  }
  Widget _buildstatusOfReportTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: statusOfReport,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter police status";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'status',
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
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              print("pressed");
              if (!formkey.currentState!.validate()) {
                print("invalid entry");
              } else {
                _addToList(locationOfReport.text, dateOfReport.text, timeOfReport.text, int.parse(typeOfReport.text),
                    detailsOfReport.text, partiesOfReport.text,int.parse(statusOfReport.text),  context, reportpads);
                Provider.of<ReportpadModel>(context, listen: false).update();
                Navigator.pop(context);
              }
            },
            child: const Text('SUBMIT')),
      ],
    );
  }

  void _addToList(String locationOfReport, String dateOfReport, String timeOfReport, int typeOfReport, String detailsOfReport, String partiesOfReport, int statusOfReport,
      BuildContext context, List<Reportpad> reportpads) {
    Reportpad report =
        Reportpad(location: locationOfReport, date: dateOfReport, time: timeOfReport, type: typeOfReport, description: detailsOfReport, parties: partiesOfReport, status: statusOfReport);

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
            Form(
              key: formkey,
              child: Column(children: <Widget>[
                _buildlocationOfReportTextField(),
                _buildDateOfReportTextField(),
                _buildtimeOfReportTextField(),
                _buildtypeOfReportTextField(),
                _buildDetailsOfReportTextField(),
                _buildPartiesOfReportTextField(),
                _buildstatusOfReportTextField(),
                _onSubmit(context, reportpads)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
