import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:flutter_application_frith/View/security_login.dart';
import 'package:url_launcher/url_launcher.dart';
import '../emergency/emergencyphone.dart';
import '../notepad/notepad_homepage.dart';
import 'package:torch_light/torch_light.dart';

class SecurityGuards extends StatefulWidget {
  const SecurityGuards({Key? key}) : super(key: key);

  @override
  State<SecurityGuards> createState() => _SecurityGuardsState();
}

class _SecurityGuardsState extends State<SecurityGuards> {
  bool light = false;

  Future<bool> _checkIfLightExists() async {
    try {
      final isTorchAvailable = await TorchLight.isTorchAvailable();
      return Future.value(isTorchAvailable);
    } on Exception catch (_) {
      return Future.value(false);
    }
  }

  Future<void> _turnOnLight() async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      print("unable to turn on light");
    }
  }

  Future<void> _turnOffLight() async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      print("unable to turn off light");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Security Guards"),
          actions: [_popupMenuButton(context)],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //flashlight function
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          light = !light;

                          if (light) {
                            _turnOffLight();
                          } else {
                            _turnOffLight();
                          }
                          //TODO turn on flashlight
                        });
                      },
                      child: Container(
                        color: Colors.blueAccent,
                        width: 150,
                        height: 100,
                        child: light
                            ? Icon(
                                Icons.lightbulb,
                                color: Colors.yellow,
                                size: 80,
                              )
                            : Icon(
                                Icons.lightbulb_outline,
                                color: Colors.white,
                                size: 80,
                              ),
                      )),

                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NotepadPage(

                                    ///title: '',
                                    )));
                      },
                      child: Container(
                          color: Colors.blueAccent,
                          width: 150,
                          height: 100,
                          child: Icon(
                            Icons.event_note_rounded,
                            color: Colors.white,
                            size: 80,
                          ))),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //emergency function
                  GestureDetector(
                    onTap: () {
                      launch('tel:000');
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
                    onTap: () {
                      /*
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PhonePage()));*/
                    },
                    child: Container(
                        // alignment: Alignment.centerRight,

                        width: 150,
                        height: 100,
                        color: Colors.blueAccent,
                        child: Icon(
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
                        size: 80,
                      ) //"Incident Report"
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
        ));
  }

  PopupMenuButton _popupMenuButton(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          onTap: () {
            //
            print("Logout");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Notice"),
                            content:
                                Text("Are you sure you would like to Logout?"),
                            actions: <Widget>[
                              TextButton(
                                child: Text("No"),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              TextButton(
                                child: Text("Yes"),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SecLogin())); //go back to security login page SecLogin
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
