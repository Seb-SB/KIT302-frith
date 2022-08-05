import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'inforPool.dart';
import 'information_homepage.dart';

class InformationDetails extends StatefulWidget {
  const InformationDetails({Key? key, required this.id}) : super(key: key);
  final int id; //Add this line
  @override
  _InformationDetailsState createState() => _InformationDetailsState();
}

class _InformationDetailsState extends State<InformationDetails> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();
  final detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var informationpool =
        Provider.of<InformationPoolModel>(context, listen: false).items;
    var information= informationpool[widget.id];

    titleController.text = information.title;
    timeController.text = information.time;
    dateController.text = information.date;
    detailsController.text = information.details;

    return Consumer<InformationPoolModel>(builder: (context, informationPoolModel, _) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Edit Information"),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //Display movie id
                    Text("Information Index ${widget.id}"),
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
                                  const InputDecoration(labelText: "Time"),
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
                                      information.title = titleController.text;
                                      information.time = timeController.text;
                                      information.date = dateController
                                          .text; //good code would validate these
                                      information.details = detailsController
                                          .text; //good code would validate these

                                      //update the model

                                      Provider.of<InformationPoolModel>(context,
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
