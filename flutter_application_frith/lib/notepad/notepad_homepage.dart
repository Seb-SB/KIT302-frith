import 'package:flutter/material.dart';
import 'package:flutter_application_frith/notepad/new_note.dart';
import 'package:provider/provider.dart';
import 'notepad.dart';
import 'notepad_details.dart';

///
/// Notepad
///
///
//void main() {
//  runApp(const NotepadPage());
//}

class NotepadPage extends StatefulWidget {
  const NotepadPage({Key? key}) : super(key: key);

  @override
  _NotepadPageState createState() => _NotepadPageState();
}

class _NotepadPageState extends State<NotepadPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotepadModel>(builder: buildScaffold);
  }

  Scaffold buildScaffold(
      BuildContext context, NotepadModel notepadModel, _) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
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
                    var notepad = notepadModel.items[index];
                    return ListTile(
                      title: Text(notepad.title),
                      subtitle: Text(notepad.date.toString() +
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
            //笔记详情页面
            // },
            //),
          ],
        ),
      ),
    );
  }
}
