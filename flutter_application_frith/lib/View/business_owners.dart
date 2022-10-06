import 'package:flutter/material.dart';
import 'package:flutter_application_frith/View/business_login.dart';
import 'package:flutter_application_frith/InformationPool/information_homepage.dart';

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
          title: const Text("Business Owner"),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InformationHomepage()));
                      },
                      child: Container(
                          color: Colors.blueAccent,
                          width: 140,
                          height: 90,
                          child: const Icon(
                            //change informationpoolpool icon
                            Icons.insert_comment,
                            color: Colors.white,
                            size: 80,
                          ))),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 125),
                  Container(
                      width: 150,
                      alignment: Alignment.center,
                      child: const Text('EVENT LOG')),
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
            // ignore: avoid_print
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
                            title: const Text("Notice"),
                            content: const Text(
                                "Are you sure you would like to Logout?"),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("No"),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              TextButton(
                                child: const Text("Yes"),
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
                  child: const Text('Logout')),
            ],
          ),
          //value: 'logout',
        ),
      ],
    );
  }
}
