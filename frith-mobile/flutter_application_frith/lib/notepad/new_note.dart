import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  _NewNoteState createState() => _NewNoteState();
}


class _NewNoteState extends State<NewNote> {
  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: TextField(
                    decoration: InputDecoration(
                      hintText: 'First name',
                      // ignore: prefer_const_constructors
                      prefixIcon: Icon(Icons.person),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Last name',
                      prefixIcon: Icon(Icons.person),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Title',
                      prefixIcon: Icon(Icons.title),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Date',
                      prefixIcon: Icon(Icons.date_range),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Details',
                      prefixIcon: Icon(Icons.details),
                    )),
              ),
            ),


            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text('SUBMIT')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

