import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:flutter_application_frith/View/business_login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_frith/InformationPool/informationPool.dart';
import 'package:flutter_application_frith/InformationPool/information_homepage.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class BusinessOwners extends StatefulWidget {
  const BusinessOwners({Key? key}) : super(key: key);

  @override
  State<BusinessOwners> createState() => _BusinessOwnersState();
}

class _BusinessOwnersState extends State<BusinessOwners> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Business Owner"),
          actions: [_popupMenuButton(context)],
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                //information Pool Function
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => InformationHomepage()));
                      },
                      child: Container(
                          color: Colors.blueAccent,
                          width: 140,
                          height: 90,
                          child: Icon(
                            //change informationpoolpool icon
                            Icons.insert_comment,
                            color: Colors.white,
                            size: 80,
                          ))),
                ],
              ),
              SizedBox(height: 60),
              Row(
                //"Business Event",
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //alignment: Alignment.centerLeft,
                    color: Colors.blueAccent,
                    width: 150,
                    height: 100,
                    child: Icon(
                      //change business event icon
                      Icons.event_available,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
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
                                              BusLogin())); //go back to security login page SecLogin
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
