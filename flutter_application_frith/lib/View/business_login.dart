import 'package:flutter/material.dart';
import 'package:flutter_application_frith/InformationPool/event_information_pool.dart';
import 'package:flutter_application_frith/View/backup_alert.dart';
import 'signup_business.dart';
import 'business_owners.dart';
import 'dart:convert';
import 'package:flutter_application_frith/Model/business_owner.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;

class BusLogin extends StatefulWidget {
  late LoggedInBusiness business = LoggedInBusiness();

  BusLogin({Key? key}) : super(key: key);

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

  var sessionManager = SessionManager();
  late business_owner logged_in_business;

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
          }
          /*onPressed: () => { //TESTING
          print("login button pressed"),
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BusinessOwners()),
          ),
        },*/ //TESTING

          ),
    );
  }

  Future<void> _logIn(String email, String password) async {
    var url = 'http://' +
        globals.GLOBAL_IP +
        '/frith/connection/business_owner_login.php';

    Map data = {'email': email, 'password': password};

    var jsonData = null;

    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
        encoding: Encoding.getByName("utf-8"));

    print(response.body);

    if (response.statusCode == 200) {
      jsonData = await jsonDecode(response.body);
      logged_in_business = business_owner.fromJSON(jsonData);
      widget.business.setLoggedInBusinessValue(logged_in_business);

      /*
      * Assign session values for current business
      */

      await sessionManager.set(
          "BusinessID", widget.business.getLoggedInBusinessValue().BusinessID);

      await sessionManager.set("BusinessEmail",
          widget.business.getLoggedInBusinessValue().BusinessEmail);

      await sessionManager.set("BusinessABN",
          widget.business.getLoggedInBusinessValue().BusinessABN);

      await sessionManager.set("BusinessName",
          widget.business.getLoggedInBusinessValue().BusinessName);

      await sessionManager.set("BusinessNumber",
          widget.business.getLoggedInBusinessValue().BusinessNumber);

      await sessionManager.set("ManagerFirstName",
          widget.business.getLoggedInBusinessValue().ManagerFirstName);

      await sessionManager.set("ManagerLastName",
          widget.business.getLoggedInBusinessValue().ManagerLastName);

      dynamic busEmail = await SessionManager().get("BusinessEmail");
      print(busEmail);

      if (jsonData["error"] == true) {
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
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
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
