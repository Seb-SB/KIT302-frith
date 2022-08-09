import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_frith/punchClock/punchClock.dart';
import 'package:provider/provider.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({Key? key, required this.id}) : super(key: key);
  final int id; //Add this line
  @override
  _BusinessDetailsState createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var notepads = Provider.of<PunchClockModel>(context, listen: false).items;
    var company = notepads[widget.id];

    titleController.text = company.title;
    dateController.text = company.date.toString();
    detailsController.text = company.address;

    return Consumer<PunchClockModel>(builder: (context, notepadModel, _) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("detail"),
            centerTitle: true,
          ),
          body: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            '${company.title}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            width: 300,
                            height: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: ListView.builder(
                                itemBuilder: (_, index) {
                                  return ListTile(
                                    title: Text(
                                        'name: gard1,location: xxxxxxxxxxxxxxx'),
                                    //leading: Image.network(image),
                                    //added this line, this should be familiar from last week:
                                  );
                                },
                                itemCount: notepadModel.items.length)),
                        DropdownButton<String>(
                          style: TextStyle(color: Colors.green),
                          items: [
                            DropdownMenuItem(
                              child: Text('location1'),
                              value: 'location1',
                            ),
                            DropdownMenuItem(
                              child: Text('location2'),
                              value: 'location2',
                            ),
                            DropdownMenuItem(
                              child: Text('location3'),
                              value: 'location3',
                            )
                          ],
                          onChanged: (value) {},
                          value: 'location1',
                        ),
                        Container(
                            width: 300,
                            height: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: ListView.builder(
                                itemBuilder: (_, index) {
                                  return ListTile(
                                    title: Text('item 1'),
                                    //leading: Image.network(image),
                                    //added this line, this should be familiar from last week:
                                  );
                                },
                                itemCount: notepadModel.items.length)),
                        Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () => {},
                              child: Text('End Shift'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red)),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            ElevatedButton(
                              onPressed: () => {},
                              child: Text('Start Shift'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green)),
                            ),
                          ],
                        ),
                      ],
                    )
                    //Display movie id
                  ])));
    });
  }
}
