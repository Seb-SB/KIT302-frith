//mport 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/Model/securityGuard.dart';
import 'package:flutter_application_frith/notepad/notepad.dart';
import 'package:provider/provider.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  TextEditingController titleOfNote = TextEditingController();
  TextEditingController dateOfNote = TextEditingController();
  TextEditingController detailsOfNote = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Widget _buildtitleOfNoteTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: titleOfNote,
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
  /*
  Widget _buildDateOfNoteTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: dateOfNote,
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
  }*/

  Widget _buildDetailsOfNoteTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: detailsOfNote,
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

  Widget _onSubmit(BuildContext context, List<Notepad> notepads) {
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
                final time = DateTime.now().toString();
                _addToList(titleOfNote.text, time, detailsOfNote.text, context,
                    notepads);
                Provider.of<NotepadModel>(context, listen: false).update();
                Navigator.pop(context);
              }
            },
            child: const Text('SUBMIT')),
      ],
    );
  }

  void _addToList(String titleOfNote, String dateOfNote, String detailsOfNote,
      BuildContext context, List<Notepad> notepads) {
    Notepad note =
        Notepad(title: titleOfNote, date: dateOfNote, details: detailsOfNote);
    notepads.add(note);
  }

  @override
  Widget build(BuildContext context) {
    var notepads = Provider.of<NotepadModel>(context, listen: false).items;
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
                  'Create New Note',
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
                _buildtitleOfNoteTextField(),
                //_buildDateOfNoteTextField(),
                _buildDetailsOfNoteTextField(),
                _onSubmit(context, notepads)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
