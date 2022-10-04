import 'package:flutter/material.dart';

/**
 * successful request backup
 *
 */
class SuccessfulResponsePage extends StatefulWidget {
  const SuccessfulResponsePage({key, required this.title});
  final String title;

  @override
  State<SuccessfulResponsePage> createState() => _SuccessfulResponsePageState();
}

class _SuccessfulResponsePageState extends State<SuccessfulResponsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Successful"),
      ),
      //body: Center(child: Text("Your request for backup has been received.", style:TextStyle(fontSize: 30,color: Colors.black),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //icons
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 150,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: InkWell(
                      //child: Text('Request Backup', style: TextStyle(fontSize: 26),),
                      //child: Text("SOS", style: TextStyle(color: Colors.white, fontSize: 50),),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 80,
                      ),
                      onTap: () {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (s(title: "title")));
                      }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Text(
                    "Thank you. ",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 400,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Text(
                    "Your request for backup has been received.",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
