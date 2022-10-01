// ignore_for_file: unnecessary_null_comparison
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_frith/Model/securityGuard.dart';
import 'home_page.dart';
import 'signup_security.dart';
import 'security_guards.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_frith/global_ip.dart' as globals;

//import 'shared_preferences/shared_preferences.dart';

class SecLogin extends StatefulWidget {
  late Future<SecurityGuard> futureSecurityGuard;
  late LoggedInGuard guard = LoggedInGuard();

  SecLogin({Key? key}) : super(key: key);

  @override
  _SecLoginState createState() => _SecLoginState();
}

class _SecLoginState extends State<SecLogin> {
  GlobalKey<FormState> formkey =
      GlobalKey<FormState>(); //keep track of form state

  bool _isLoading = false;
  String errorMessage = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late SecurityGuard current_guard;
  var sessionManager = SessionManager();

  @override
  void initState() {
    super.initState();
  }

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
            MaterialPageRoute(builder: (context) => const SecurityGuards()),
          ),
        }, //TESTING */

          ),
    );
  }

  Future<void> _logIn(String email, String password) async {
    var url = 'http://' +
        globals.GLOBAL_IP +
        '/frith/connection/security_guard_login.php';

    Map data = {'email': email, 'password': password};

    final response = await http.post(Uri.parse(url),
        headers: {
          ///'Content-Type': 'application/x-www-form-urlencoded',
          ///'Accept': 'application/json'
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
        encoding: Encoding.getByName("utf-8"));

    print(response.body);

    if (response.statusCode == 200) {
      //jsonData = await jsonDecode(jsonEncode(response.body));
      //print(jsonData);

      //new line here
      //current_guard = SecurityGuard.fromJSON(jsonData);

      var jsonData = await json.decode(response.body);
      current_guard = SecurityGuard.fromJSON(jsonData);
      widget.guard.setGuardValue(current_guard);
      print("----");
      print(widget.guard.getGuardValue().FirstName);

      await sessionManager.set(
          "GuardKey", widget.guard.getGuardValue().GuardKey);

      await sessionManager.set(
          "FirstName", widget.guard.getGuardValue().FirstName);

      await sessionManager.set(
          "LastName", widget.guard.getGuardValue().LastName);

      await sessionManager.set(
          "EmailAddress", widget.guard.getGuardValue().EmailAddress);

      await sessionManager.set(
          "Password", widget.guard.getGuardValue().Password);

      await sessionManager.set(
          "PhoneNumber", widget.guard.getGuardValue().PhoneNumber);

      //dynamic guardKey = await SessionManager().get("GuardKey");

      //print(guardKey);

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
            MaterialPageRoute(
                builder: (context) => const SecurityGuards(
                      title: '',
                    )),
          );
        });
      }
    } else {
      //print(jsonData["errmsg"]);
    }
  }

  Widget _buildSignUpButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        child: const Text("SIGNUP"),
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

  void _handleSubmittedValue() async {
    //var _formKey;
    //final FormState form = _formKey.currentState;

    if (formkey.currentState!.validate()) {
      //ApiResponse _apiResponse =
      //await authenticateSecurityGuard(email, password);
      //_saveAndRedirectToHome();
      //if ((_apiResponse.ApiError as ApiError).error == "") {
      //if (_apiResponse.Data != null) {
      //_saveAndRedirectToHome();
      //} else {
      //print((_apiResponse.ApiError as ApiError).error);
      //}
    }
  }
  /*
  void _saveAndRedirectToHome() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecurityGuards()),
    );
  }*/

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
                              'Security Guard',
                              style: TextStyle(
                                fontSize: 30.0,
                              ),
                            ),
                            Form(
                                key: formkey,
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: 30.0),
                                    _buildEmailTextField(),
                                    const SizedBox(height: 30.0),
                                    _buildPasswordTextField(),
                                    _buildLoginButton(),
                                    _buildSignUpButton(),
                                  ],
                                )),
                          ],
                        ),
                      ))
          ],
        ));
  }
}
