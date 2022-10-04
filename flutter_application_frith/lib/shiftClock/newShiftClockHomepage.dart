import 'package:flutter/material.dart';
import 'package:flutter_application_frith/shiftClock/businessDetail.dart';
import 'package:provider/provider.dart';
import 'businessModel.dart';

class NewShiftClockPage extends StatefulWidget {
  const NewShiftClockPage({Key? key}) : super(key: key);

  @override
  _NewShiftClockPageState createState() => _NewShiftClockPageState();
}

class _NewShiftClockPageState extends State<NewShiftClockPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessModel>(builder: buildScaffold);
  }

  Scaffold buildScaffold(BuildContext context, BusinessModel businesses, _) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shift Clock'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Start/End Shift',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 5,
                    ),
                  ),
                  child: ListView.builder(
                      itemBuilder: (_, index) {
                        var business = businesses.items[index];
                        return ListTile(
                          leading: const Icon(Icons.business_center_outlined),
                          title: Text(business.name),
                          subtitle:
                              Text(business.phone + '\n' + business.email),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BusinessDetails(id: index);
                            }));
                          },
                        );
                      },
                      itemCount: businesses.items.length)),
            ))
          ],
        ),
      ),
    );
  }
}
