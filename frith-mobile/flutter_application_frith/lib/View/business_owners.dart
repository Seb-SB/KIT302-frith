import 'package:flutter/material.dart';


class  BusinessOwners extends StatefulWidget {
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
                      child: Text("Share Information Pool",
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          fontWeight: FontWeight.bold,),
                      )),
                  Container(
                      color: Colors.blueAccent,
                      width: 150,
                      height: 100,
                      child: Text("Incident Report",
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
                      child: Text("Business Event",
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
                      child: Text("Emergency",
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                           fontWeight: FontWeight.bold,),
                      )),
                ],
              ),
            ],
          ),
        )

    );
  }
}
