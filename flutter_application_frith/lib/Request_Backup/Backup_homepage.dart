import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../View/security_guards.dart';
import 'Backup.dart';

class BackupPage extends StatefulWidget {
  const BackupPage({Key? key}) : super(key: key);

  @override
  _BackupPageState createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {

  
  @override
  Widget build(BuildContext context) {
    return Consumer<BackupModel>(builder: buildScaffold);
  }

  Scaffold buildScaffold(BuildContext context, BackupModel backupModel, _) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Back up requested'),
         // actions: [_popupMenuButton(context)],
          centerTitle: true,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Back up requested',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 80),
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
                            var notepad = backupModel.items[index];
                            return ListTile(
                              title: Text(notepad.title +"  "+notepad.name +"   "+ notepad.location+"   "+notepad.status),
                              //leading: Image.network(image),
                              //added this line, this should be familiar from last week:
                            );
                          },
                          itemCount: backupModel.items.length)),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => {
                        //Navigator.push(context, MaterialPageRoute(builder: ((context) => SecurityGuards)))
                        Navigator.pop(context)
                      },
                      
                      child: const Text('Delete Request'),
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(80, 40)),
                          minimumSize:
                              MaterialStateProperty.all(Size(200, 100)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
              ]),
        ));
  }
   // PopupMenuButton _popupMenuButton(BuildContext context){
     // return PopupMenuButton(
    //    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>
    //  )
   // }
}
