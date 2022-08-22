import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_frith/notepad/new_note.dart';
import 'package:flutter_application_frith/punchClock/punchClock_details.dart';
import 'package:provider/provider.dart';
import 'punchClock.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;
import 'package:http/http.dart' as http;


class PunchClockPage extends StatefulWidget {
  const PunchClockPage({Key? key}) : super(key: key);

  @override
  _PunchClockPageState createState() => _PunchClockPageState();
}

class _PunchClockPageState extends State<PunchClockPage> {
  @override
  Widget build(BuildContext context) {

    return Consumer<PunchClockModel>(builder: buildScaffold);
  }

  Scaffold buildScaffold(BuildContext context, PunchClockModel notepadModel,
      _) {
    return Scaffold(
      appBar: AppBar(
        title: Text('start-end'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            // 显示带有边框的列表

            const Center(
              child: Text(
                'Start-End Shirt',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 100),
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: ListView.builder(
                          itemBuilder: (_, index) {
                            var notepad = notepadModel.items[index];
                            return ListTile(
                              title: Text(notepad.title),
                              //leading: Image.network(image),
                              //added this line, this should be familiar from last week:
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return GuardClockDetails(id: index);
                                    }));
                              },
                            );
                          },
                          itemCount: notepadModel.items.length)),
                ))
          ],
        ),
      ),
    );
  }


}
