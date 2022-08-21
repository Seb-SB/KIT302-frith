import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/InformationPool/event_details.dart';
import 'package:flutter_application_frith/InformationPool/information_homepage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'event_information_pool.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  TextEditingController eventTitleController = TextEditingController();
  TextEditingController numberOfPerpetratorsController =
      TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController severityOfEventController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var sessionManager = SessionManager();

  String? dropdownValue;
  var _isLoading = false;

  Widget _buildSeverityLevelOfEventDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60.0,
              child: const Text("Select Severity Level:   "),
            ),
            //const SizedBox(width: 20),
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
                    severityOfEventController.text = dropdownValue.toString();
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

  Widget _buildEventTitleTextFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: eventTitleController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a title.";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'Title of Event',
              prefixIcon: Icon(Icons.title),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEventDescriptionTextFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 100.0,
          child: TextFormField(
            controller: eventDescriptionController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter an event description.";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'Description of Event',
              prefixIcon: Icon(Icons.info_outline),
            ),
            minLines: 1,
            maxLines: 4,
          ),
        )
      ],
    );
  }

  Widget _buildEventNumberOfPerpetratorsTextFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: numberOfPerpetratorsController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid number.";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'Number of Perpetrators',
              prefixIcon: Icon(Icons.person_add_alt_1_outlined),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSubmitFormButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              if (!formkey.currentState!.validate()) {
                ///TODO: manage loading state etc.
              } else {
                // print(eventTitleController.text);
                // print(eventDescriptionController.text);
                // print(severityOfEventController.text);
                // print(int.parse(numberOfPerpetratorsController.text));
                _submitToDatabase(
                    eventTitleController.text,
                    eventDescriptionController.text,
                    numberOfPerpetratorsController.text,
                    severityOfEventController.text,
                    context);
              }
            },
            child: const Text("SUBMIT")),
      ],
    );
  }

  Future<void> _submitToDatabase(
      String eventTitle,
      String eventDescription,
      String numberOfPerpetrators,
      String severityOfEvent,
      BuildContext context) async {
    var url = 'http://' +
        globals.GLOBAL_IP +
        '/frith/connection/create_new_event.php';

    dynamic businessID = await SessionManager().get("BusinessID");

    var currentTime = DateTime.now();
    var timeFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    String submissionDateTime = timeFormatter.format(currentTime);

    Map data = <String, dynamic>{};

    data['BusinessID'] = businessID;
    data['Severity'] = severityOfEvent;
    data['TimeSubmitted'] = submissionDateTime;
    data['EventTitle'] = eventTitle;
    data['NumPerpetrators'] = numberOfPerpetrators;
    data['Description'] = eventDescription;

    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
        encoding: Encoding.getByName("utf-8"));

    print(response.body);

    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(jsonEncode(response.body));

      print(jsonData);

      ///testing

      jsonData = jsonDecode(jsonData);
      if (jsonData["error"] == true) {
        //print(jsonData);
        ///errorMessage = await jsonData["message"];
        setState(() {
          _isLoading = false;
        });
        //create scaffold

      } else {
        setState(() {
          _isLoading = false;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InformationHomepage()),
          );

          ///errorMessage = "";
        });
      }
    } else {
      ///print(jsonData["message"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Event"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Create New Event",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    _buildEventTitleTextFormField(),
                    _buildSeverityLevelOfEventDropDown(),
                    _buildEventNumberOfPerpetratorsTextFormField(),
                    _buildEventDescriptionTextFormField(),
                    _buildSubmitFormButton(context)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
