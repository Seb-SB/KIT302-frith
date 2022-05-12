import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';


class SecurityGuards extends StatefulWidget {
  const SecurityGuards({Key? key}) : super(key: key);

  @override
  State<SecurityGuards> createState() => _SecurityGuardsState();
}

class _SecurityGuardsState extends State<SecurityGuards> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Security Guards"),
        actions: [
          IconButton(
              onPressed: () {
                //
                print("button is pressed!");
              },
              icon: Icon(Icons.camera_alt_sharp)),

          IconButton(
              onPressed: () {
                //
                print("button is pressed!");
              },
              icon: Icon(Icons.more_horiz)),
        ],
      ),
      drawer: Drawer(
            child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    //crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
          onPressed: () {
            //
            print("button is pressed!");
          },
          icon: Icon(Icons.person)),
    Container(
    color: Colors.blueAccent,
    width: 300,
    height: 50,
    child: Text("Home",
    style: TextStyle(
    fontSize: 15,
    color: Colors.white,
    fontWeight: FontWeight.bold,),
    )),
      SizedBox(height: 30),
    Container(
    color: Colors.blueAccent,
    width: 300,
    height: 50,
    child: Text("Profile",
    style: TextStyle(
    fontSize: 15,
    color: Colors.white,
    fontWeight: FontWeight.bold,),
    )),
      SizedBox(height: 30),
      Container(
          color: Colors.blueAccent,
          width: 300,
          height: 50,
          child: Text("Settings",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,),
          )),
      SizedBox(height: 30),
      Container(
          color: Colors.blueAccent,
          width: 300,
          height: 50,
          child: Text("Feedback",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,),
          )),
      SizedBox(height: 30),
      Container(
          color: Colors.blueAccent,
          width: 300,
          height: 50,
          child: Text("Share",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,),
          )),
      SizedBox(height: 30),
      Container(
          color: Colors.blueAccent,
          width: 300,
          height: 50,
          child: Text("Logout",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,),
          )),
    ],
    ),
    ],
    ),
    ),


        //bottomNavigationBar: BottomNavigationBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    color: Colors.blueAccent,
                    width: 150,
                    height: 100,
                    child: Text("Flashlight",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          textBaseline: TextBaseline.ideographic,
                          fontWeight: FontWeight.bold,),
                    )),
                Container(
                    color: Colors.blueAccent,
                    width: 150,
                    height: 100,
                    child: Text("Notepad",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,),
                    )),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  //alignment: Alignment.centerLeft,
                    color: Colors.blueAccent,
                    width: 150,
                    height: 100,
                    child: Text("Incident Report",
                      style:TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,),
                    )),
                Container(
                  // alignment: Alignment.centerRight,

                    width: 150,
                    height: 100,
                    color: Colors.blueAccent,
                    child: Text("Request Backup",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        fontWeight: FontWeight.bold,),
                    )),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // alignment: Alignment.centerLeft,
                    color: Colors.blueAccent,
                    width: 150,
                    height: 100,
                    child: Text("Information Pool",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        fontWeight: FontWeight.bold,),
                    )),
                Container(
                  //alignment: Alignment.centerRight,

                    width: 150,
                    height: 100,
                    color: Colors.blueAccent,
                    child: Text("Start/end Shift",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ],
        ),
      )

    );

  }

}
