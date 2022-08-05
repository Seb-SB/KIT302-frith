import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'new_report.dart';
import 'reportpad.dart';
import 'reportpad_details.dart';

///
/// Reportpad
///
///

class ReportpadPage extends StatefulWidget {
  const ReportpadPage({Key? key}) : super(key: key);

  @override
  _ReportpadPageState createState() => _ReportpadPageState();
}

class _ReportpadPageState extends State<ReportpadPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReportpadModel>(builder: buildScaffold);
  }

  Scaffold buildScaffold(
      BuildContext context, ReportpadModel reportpadModel, _) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incident Report'),
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
                    //new reportpad
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
                                  builder: (context) => const NewReport()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.create),
                            Text("Create New Report")
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
                    var reportpad = reportpadModel.reportItems[index];
                    return ListTile(
                      title: Text(reportpad.location),
                      subtitle: Text(reportpad.date.toString()),
                      //leading: Image.network(image),

                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ReportpadDetails(id: index);
                        }));
                      },
                    );
                  },
                  itemCount: reportpadModel.reportItems.length),
            )
          ],
        ),
      ),
    );
  }
}
