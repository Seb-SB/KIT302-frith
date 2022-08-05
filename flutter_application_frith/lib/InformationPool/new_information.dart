//import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/InformationPool/inforPool.dart';
import 'package:provider/provider.dart';

class NewInformation extends StatefulWidget {
  const NewInformation({Key? key}) : super(key: key);

  @override
  _NewInformationState createState() => _NewInformationState();
}

class _NewInformationState extends State<NewInformation> {
  TextEditingController titleOfInformation = TextEditingController();
  TextEditingController timeOfInformation = TextEditingController();
  TextEditingController dateOfInformation = TextEditingController();
  TextEditingController detailsOfInformation = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Widget _buildtitleOfInformationTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: titleOfInformation,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a title";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'Title',
              prefixIcon: Icon(Icons.title),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildtimeOfInformationTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: timeOfInformation,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter the time";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'Time',
              prefixIcon: Icon(Icons.timeline_rounded),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDateOfInformationTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: dateOfInformation,
            keyboardType: TextInputType.datetime,
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

  Widget _buildDetailsOfInformationTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: detailsOfInformation,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter some notes";
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

  Widget _onSubmit(BuildContext context, List<InformationPool> information) {
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
                _addToList(titleOfInformation.text, timeOfInformation.text, dateOfInformation.text,
                    detailsOfInformation.text, context, information);
                Provider.of<InformationPoolModel>(context, listen: false).update();
                Navigator.pop(context);
              }
            },
            child: const Text('SUBMIT')),
      ],
    );
  }

  void _addToList(String titleOfInformation, String timeOfInformation, String dateOfInformation,
      String detailsOfInformation, BuildContext context, List<InformationPool> information) {
    InformationPool infor = InformationPool(
        title: titleOfInformation,
        time: timeOfInformation,
        date: dateOfInformation,
        details: detailsOfInformation);
    information.add(infor);
  }

  @override
  Widget build(BuildContext context) {
    var information = Provider.of<InformationPoolModel>(context, listen: false).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
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
                  'Create New Information',
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
                _buildtitleOfInformationTextField(),
                _buildtimeOfInformationTextField(),
                _buildDateOfInformationTextField(),
                _buildDetailsOfInformationTextField(),
                _onSubmit(context, information)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
