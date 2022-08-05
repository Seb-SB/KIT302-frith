import 'package:flutter/material.dart';
import 'signup_business.dart';
import 'business_owners.dart';
import 'dart:convert';
import 'package:flutter_application_frith/Model/business_owner.dart';
import 'package:http/http.dart' as http;

class BusLogin extends StatefulWidget {
  const BusLogin({Key? key}) : super(key: key);

  @override
  _BusLoginState createState() => _BusLoginState();
}

class _BusLoginState extends State<BusLogin> {
  GlobalKey<FormState> formkey =
      GlobalKey<FormState>(); //keep track of form state

  bool _isLoading = false;
  String errorMessage = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  ///String email = ""; //Temporary solution for email
  ///String password = ""; //Temporary solution for password

  Widget _buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid email";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
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
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid password";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: 'Enter your Password',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
          child: const Text("LOGIN"),
          //onPressed: _handleSubmittedValue,
          onPressed: () {
            setState(() {
              _isLoading = true;
            });

            if (!formkey.currentState!.validate()) {
              setState(() {
                _isLoading = false;
              });
            } else {
              _logIn(emailController.text, passwordController.text);

              final snackbar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(errorMessage));
              if (errorMessage.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            }
          }),
    );
  }

  Future<void> _logIn(String email, String password) async {
    var url = 'http://192.168.0.128/frith/connection/business_owner_login.php';

    Map data = {'email': email, 'password': password};

    var jsonData = null;

    ///print(data.entries);

    final response = await http.post(Uri.parse(url),
        headers: {
          //'Content-Type': 'application/x-www-form-urlencoded',
          'Content-Type': 'application/json; charset=UTF-8',
          //'Accept': 'application/json'
        },
        //body: data,
        body: jsonEncode(data),
        encoding: Encoding.getByName("utf-8"));

    /*var response =
        await http.get(Uri.parse('$url?email=$email&password=$password'));*/

    print(response.body);

    if (response.statusCode == 200) {
      jsonData = await jsonDecode(jsonEncode(response.body));
      //print(jsonData);
      jsonData = jsonDecode(jsonData);
      //print(jsonData["error"]);
      if (jsonData["error"] == true) {
        //print(jsonData);
        errorMessage = await jsonData["errmsg"];
        setState(() {
          _isLoading = false;
        });
        //create scaffold

      } else {
        setState(() {
          _isLoading = false;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BusinessOwners()),
          );
        });
      }
    } else {
      print(jsonData["errmsg"]);
    }
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
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 120.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Business Owner',
                              style: TextStyle(
                                fontSize: 30.0,
                              ),
                            ),
                            Form(
                              key: formkey,
                              child: Column(children: <Widget>[
                                SizedBox(height: 30.0),
                                _buildEmailTextField(),
                                SizedBox(height: 30.0),
                                _buildPasswordTextField(),
                                _buildLoginButton(),
                                _buildSignUpButton(),
                              ]),
                            )
                          ],
                        ),
                      ))
          ],
        ));
  }
}
