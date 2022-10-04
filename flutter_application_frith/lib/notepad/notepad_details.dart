import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notepad.dart';

class NotepadDetails extends StatefulWidget {
  const NotepadDetails({Key? key, required this.id}) : super(key: key);
  final int id; //Add this line
  @override
  _NotepadDetailsState createState() => _NotepadDetailsState();
}

class _NotepadDetailsState extends State<NotepadDetails> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var notepads = Provider.of<NotepadModel>(context, listen: false).items;
    var notepad = notepads[widget.id];

    titleController.text = notepad.title;
    dateController.text = notepad.date.toString();
    detailsController.text = notepad.details;

    return Consumer<NotepadModel>(builder: (context, notepadModel, _) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Edit Notepad"),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ///Text("Notepad Index ${widget.id}"),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: "Title"),
                              controller: titleController,
                              autofocus: true,
                            ),
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: "Details"),
                              controller: detailsController,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      notepad.title = titleController.text;
                                      notepad.date = DateTime.now().toString();
                                      notepad.details = detailsController.text;
                                      //update the model
                                      Provider.of<NotepadModel>(context,
                                              listen: false)
                                          .update();
                                      //return to previous screen
                                      Navigator.pop(context);
                                    }
                                  },
                                  icon: const Icon(Icons.save),
                                  label: const Text("Save Values")),
                            )
                          ],
                        ),
                      ),
                    )
                  ])));
    });
  }
}
