import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:flutter_application_frith/ui/View/phone_page.dart';
import 'package:flutter_application_frith/ui/notepad/notepad_homepage.dart';
import 'package:flutter_application_frith/ui/torch/flashlight_page.dart';
import '../emergency/emergencyphone.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
                GestureDetector(
                  onTap: (){
                    //
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FlashLghtPage()));
                  },
                  child: Container(
                      color: Colors.blueAccent,
                      width: 150,
                      height: 100,
                      child: Icon(
                        Icons.lightbulb,
                        color: Colors.white,
                        size: 80,
                      )
                      )),

                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NotepadPage(title: '',)));
                  },
                  child: Container(
                      color: Colors.blueAccent,
                      width: 150,
                      height: 100,
                      child: Icon(
                        Icons.event_note_rounded,
                        color: Colors.white,
                        size: 80,
                      ))

                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EmergencyPhone(phone: '000',)));
                  },
                  child: Container(
                    //alignment: Alignment.centerLeft,
                      color: Colors.blueAccent,
                      width: 150,
                      height: 100,
                      child: Icon(
                          Icons.warning_amber_outlined,
                          color: Colors.white,
                          size: 80,
                      )),
                ),
                GestureDetector(
                  onTap: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PhonePage()));
                  },
                  child: Container(
                    // alignment: Alignment.centerRight,

                      width: 150,
                      height: 100,
                      color: Colors.blueAccent,
                      child:Icon(
                          Icons.time_to_leave_outlined, //request back up
                          color: Colors.white,
                          size: 80,
                      )),
                ),
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
                    child: Icon(
                      Icons.note,
                      color: Colors.white,
                      size: 80, )//"Incident Report"
                    ),
                Container(
                  //alignment: Alignment.centerRight,

                    width: 150,
                    height: 100,
                    color: Colors.blueAccent,
                    child: Icon(
                      Icons.access_time_outlined, //start/end/shift
                      color: Colors.white,
                      size: 80,
                    )),
              ],
            ),
          ],
        ),
      )

    );

  }

}
