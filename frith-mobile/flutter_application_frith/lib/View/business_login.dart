import 'package:flutter/material.dart';
import 'signup_business.dart';
import 'business_owners.dart';

class BusLogin extends StatefulWidget {
  const BusLogin({Key? key}) : super(key: key);

  @override
  _BusLoginState createState() => _BusLoginState();
}

class _BusLoginState extends State<BusLogin> {
  String email = ""; //Temporary solution for email
  String password = ""; //Temporary solution for password

  Widget _buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
              hintText: 'Enter your Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextField(
            obscureText: true,
            onChanged: (value) => password = value,
            decoration: InputDecoration(
              hintText: 'Enter your Password',
              prefixIcon: Icon(Icons.password),
            ),
          ),
        )
      ],
    );
  }

  /*
  TODO: onPressed > check that both textfields have valid values
  Store somewhere
  ...
  LATER - check database with those values -> if valid then send to logged in view
  
  */
  Widget _buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        child: const Text("LOGIN"),
        onPressed: () => {
          print("login button pressed"),
          print("email: ${email}"),
          print("password: ${password}"),
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BusinessOwners()),
          ),
        }, //TESTING
      ),
    );
  }

  // TODO: Map to Security Guard Sign Up Page!!
  Widget _buildSignUpButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        child: const Text("Signup"),
        onPressed: () => {
          print("signup button pressed"),
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUpBusiness()),
          ),
        }, //TESTING
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Business Owner',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTextField(),
                      SizedBox(height: 30.0),
                      _buildPasswordTextField(),
                      _buildLoginButton(),
                      _buildSignUpButton(),
                    ],
                  ),
                ))
          ],
        ));
  }
}
