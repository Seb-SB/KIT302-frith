import 'package:flutter/material.dart';
import 'package:flutter_application_frith/InformationPool/new_information.dart';
import 'package:provider/provider.dart';
import 'inforpool.dart';
import 'information_details.dart';


class InformationpoolPage extends StatefulWidget {
  const InformationpoolPage({Key? key}) : super(key: key);

  @override
  _InformationpoolPageState createState() => _InformationpoolPageState();
}

class _InformationpoolPageState extends State<InformationpoolPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InformationPoolModel>(builder: buildScaffold);
  }

  Scaffold buildScaffold(
      BuildContext context, InformationPoolModel informationPoolModel, _) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information Pool'),
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
                    print("dynamic");
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
                                  builder: (context) => const NewInformation()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.create),
                            Text("Create New Post")
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
                    //informationPoolModel.sort();
                    var informationpool = informationPoolModel.items[index];
                    return ListTile(
                      title: Text(informationpool.title),
                      subtitle: Text(informationpool.time.toString() +
                          "-" +
                          informationpool.date.toString() +
                          " - " +
                          informationpool.details.toString() +
                          " ..."),
                      //leading: Image.network(image),

                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return InformationDetails(id: index);
                        }));
                      },
                    );
                  },
                  itemCount: informationPoolModel.items.length),
            )
            //ListTile(
            //  title: Text("Notepad one"),
            //subtitle: Text("one subtitle"),
            //   onTap: () {
            //
            // },
            //),
          ],
        ),
      ),
    );
  }
}
