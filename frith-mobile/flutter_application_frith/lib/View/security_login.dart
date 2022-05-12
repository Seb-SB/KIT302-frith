import 'package:flutter/material.dart';
import 'signup_security.dart';
import 'security_guards.dart';

class SecLogin extends StatefulWidget {
  const SecLogin({Key? key}) : super(key: key);

  @override
  _SecLoginState createState() => _SecLoginState();
}

class _SecLoginState extends State<SecLogin> {
  String email = ""; //Temporary solution for email
  String password = ""; //Temporary solution for password

  Widget _buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.horizontal()),
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Enter your Email',
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
        Text(
          'Password',
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextField(
            obscureText: true,
            onChanged: (value) => password = value,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.horizontal()),
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Enter your Password',
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
            MaterialPageRoute(builder: (context) => const SecurityGuards()),
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
            MaterialPageRoute(builder: (context) => const SignUp()),
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
                        'Security Guard',
                        style: TextStyle(
                          fontSize: 30.0,
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
