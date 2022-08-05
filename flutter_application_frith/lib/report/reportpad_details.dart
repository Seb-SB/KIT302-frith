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
  final locationController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final typeController = TextEditingController();
  final descriptionController = TextEditingController();
  final partiesController = TextEditingController();
  final statusController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var reportpads = Provider.of<ReportpadModel>(context, listen: false).reportItems;
    var reportpad = reportpads[widget.id];

    locationController.text = reportpad.location;
    dateController.text = reportpad.date;
    timeController.text = reportpad.time;
    typeController.text = reportpad.severity;
    descriptionController.text = reportpad.location;
    partiesController.text = reportpad.location;
    statusController.text = reportpad.status.toString();

    return Consumer<ReportpadModel>(builder: (context, reportpadModel, _) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Edit Reportpad"),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              controller: locationController,
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
                              controller: descriptionController,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      reportpad.location = locationController.text;
                                      reportpad.date = dateController
                                          .text; //good code would validate these
                                      reportpad.description = descriptionController
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
