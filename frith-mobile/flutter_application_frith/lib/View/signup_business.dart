import 'package:flutter/material.dart';

class SignUpBusiness extends StatefulWidget {
  const SignUpBusiness({Key? key}) : super(key: key);

  @override
  State<SignUpBusiness> createState() => _SignUpBusinessState();
}

class _SignUpBusinessState extends State<SignUpBusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Owner"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: TextField(
                    decoration: InputDecoration(
                  hintText: 'Business Name',
                  // ignore: prefer_const_constructors
                  prefixIcon: Icon(Icons.person),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: TextField(
                    decoration: InputDecoration(
                  hintText: 'Business ABN/ACN',
                  prefixIcon: Icon(Icons.numbers),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: TextField(
                    decoration: InputDecoration(
                  hintText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: TextField(
                    decoration: InputDecoration(
                  hintText: 'Fist name of Manager',
                  prefixIcon: Icon(Icons.person),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: TextField(
                    decoration: InputDecoration(
                  hintText: 'Last name of Manager',
                  prefixIcon: Icon(Icons.person),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Business Contact Number',
                        prefixIcon: Icon(Icons.contact_phone))),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have account?',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('LOGIN')),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text('SUBMIT')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
