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
          _popupMenuButton(context)


        ],
      ),

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

  PopupMenuButton _popupMenuButton(BuildContext context) {
    return    PopupMenuButton(


      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          onTap: (){
            //
            print("Logout");


          },
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                  onTap:(){
                    showDialog(context: context, builder: (context) {
                      return   AlertDialog(
                        title: Text("Notice"),
                        content: Text("Are you sure you would like to Logout?"),
                        actions: <Widget>[
                          TextButton(

                            child: Text("No"),
                            onPressed: () => Navigator.of(context).pop(), //关闭对话框SecLogin
                            // onPressed: () {
                            //   // Navigator.push(
                            //   //    context,
                            //   //  MaterialPageRoute(builder: (context) => const (HomePage))); //go back to security login page SecLogin
                            // },
                          ),
                          TextButton(
                            child: Text("Yes"),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                 MaterialPageRoute(builder: (context) =>SecLogin())); //go back to security login page SecLogin
                            },
                          ),
                        ],
                      );
                    });
                  },
                  child: new Text('Logout')),
            ],

          ),
          //value: 'logout',

        ),
      ],
    );
  }
}

