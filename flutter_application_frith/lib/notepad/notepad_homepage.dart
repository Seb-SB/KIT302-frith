import 'package:flutter/material.dart';
import 'package:flutter_application_frith/Model/securityGuard.dart';
import 'package:flutter_application_frith/notepad/new_note.dart';
import 'package:provider/provider.dart';
import 'notepad.dart';
import 'notepad_details.dart';
import 'package:intl/intl.dart';

class NotepadPage extends StatefulWidget {
  NotepadPage({Key? key}) : super(key: key);

  ///late LoggedInGuard guard = LoggedInGuard();

  @override
  _NotepadPageState createState() => _NotepadPageState();
}

class _NotepadPageState extends State<NotepadPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotepadModel>(builder: buildScaffold);
  }

  Scaffold buildScaffold(BuildContext context, NotepadModel notepadModel, _) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //new notepad
                    print("object");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ///print("----");
                          ///print(widget.guard.getGuardValue().FirstName);
                          //
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NewNote()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.create),
                            Text("Create New Note")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (_, index) {
                    notepadModel.sort();
                    var notepad = notepadModel.items[index];
                    return ListTile(
                      title: Text(notepad.title),
                      subtitle: Text(DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.parse(notepad.date)).toString() +
                          " - " +
                          notepad.details.toString() +
                          " ..."),
                      //leading: Image.network(image),

                      //added this line, this should be familiar from last week:
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NotepadDetails(id: index);
                        }));
                      },
                    );
                  },
                  itemCount: notepadModel.items.length),
            )
            //ListTile(
            //  title: Text("Notepad one"),
            //subtitle: Text("one subtitle"),
            //   onTap: () {

            // },
            //),
          ],
        ),
      ),
    );
  }
}
