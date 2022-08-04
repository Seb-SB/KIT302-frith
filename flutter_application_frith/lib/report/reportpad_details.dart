import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'reportpad.dart';

class ReportpadDetails extends StatefulWidget {
  const ReportpadDetails({Key? key, required this.id}) : super(key: key);
  final int id; //Add this line
  @override
  _ReportpadDetailsState createState() => _ReportpadDetailsState();
}

class _ReportpadDetailsState extends State<ReportpadDetails> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var reportpads = Provider.of<ReportpadModel>(context, listen: false).reportItems;
    var reportpad = reportpads[widget.id];

    titleController.text = reportpad.location;
    dateController.text = reportpad.date.toString();
    detailsController.text = reportpad.description;

    return Consumer<ReportpadModel>(builder: (context, reportpadModel, _) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Edit Reportpad"),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //Display movie id
                    Text("Reportpad Index ${widget.id}"),
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
                                  const InputDecoration(labelText: "Date"),
                              controller: dateController,
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
                                      reportpad.location = titleController.text;
                                      reportpad.date = dateController
                                          .text; //good code would validate these
                                      reportpad.description = detailsController
                                          .text; //good code would validate these

                                      //update the model

                                      Provider.of<ReportpadModel>(context,
                                              listen: false)
                                          .update();

                                      //return to previous screen
                                      Navigator.pop(context);
                                    }
                                  },
                                  icon: const Icon(Icons.save),
                                  label: const Text("Save Values")),
                            )

                            //we will add form fields etc here
                          ],
                        ),
                      ),
                    )
                  ])));
    });
  }
}
