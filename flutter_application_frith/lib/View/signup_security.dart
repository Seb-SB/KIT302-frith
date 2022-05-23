import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_application_frith/Model/securityGuard.dart';
import 'package:flutter_application_frith/View/security_login.dart';
import 'signup_security.dart';
import 'security_guards.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formkey =
      GlobalKey<FormState>(); //keep track of form state

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController uniqueKeyController = TextEditingController();

  var errorMessage = "";
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildFirstNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: firstNameController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your first name";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: "Enter your first name",
              prefixIcon: Icon(Icons.person),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLastNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: lastNameController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your last name";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: "Enter your last name",
              prefixIcon: Icon(Icons.person),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPhoneNumberTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: phoneNumberController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid phone number";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: "Enter your phone number",
              prefixIcon: Icon(Icons.contact_phone),
            ),
          ),
        )
      ],
    );
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
            controller: emailAddressController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid email address";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: "Enter your email address",
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
            keyboardType: TextInputType.text,
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
              hintText: "Enter password",
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: confirmPasswordController,
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid password";
              } else if (value != passwordController.text) {
                return "Passwords do not match!";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: "Confirm password",
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildUniqueIDTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: uniqueKeyController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter an ID";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: "Enter assigned ID",
              prefixIcon: Icon(Icons.key),
            ),
          ),
        )
      ],
    );
  }

  Widget _loginRedirectButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Already have an account?',
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
    );
  }

  Widget _submitFormButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              final snackbar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              setState(() {
                _isLoading = true;
              });
              if (!formkey.currentState!.validate()) {
                setState(() {
                  _isLoading = false;
                });
              } else {
                _submit(
                    firstNameController.text,
                    lastNameController.text,
                    phoneNumberController.text,
                    emailAddressController.text,
                    passwordController.text,
                    uniqueKeyController.text);
              }
            },
            child: const Text('SUBMIT')),
      ],
    );
  }

  Future<void> _submit(String firstName, String lastName, String phoneNumber,
      String email, String password, String id) async {
    var url = 'http://192.168.0.128/frith/connection/security_guard_create.php';

    Map data = {
      'FirstName': firstName,
      'LastName': lastName,
      'Phone': phoneNumber,
      'Email': email,
      'Password': password,
      'UniqueKey': id
    };

    Map data1 = <String, dynamic>{};

    data1['FirstName'] = firstName;
    data1['LastName'] = lastName;
    data1['Phone'] = phoneNumber;
    data1['Email'] = email;
    data1['Password'] = password;
    data1['UniqueKey'] = id;

    var jsonData = null;

    ///print(data.entries);

    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json'
        },
        body: data1,
        encoding: Encoding.getByName("utf-8"));

    print(response.body);

    if (response.statusCode == 200) {
      jsonData = await jsonDecode(jsonEncode(response.body));
      print(jsonData);
      jsonData = jsonDecode(jsonData);
      //print(jsonData["error"]);
      if (jsonData["error"] == true) {
        //print(jsonData);
        errorMessage = await jsonData["message"];
        setState(() {
          _isLoading = false;
        });
        //create scaffold

      } else {
        setState(() {
          _isLoading = false;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecLogin()),
          );
          errorMessage = "";
        });
      }
    } else {
      print(jsonData["message"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Security Guard"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Form(
                      key: formkey,
                      child: Column(
                        children: <Widget>[
                          _buildFirstNameTextField(),
                          _buildLastNameTextField(),
                          _buildPhoneNumberTextField(),
                          _buildEmailTextField(),
                          _buildPasswordTextField(),
                          _buildConfirmPasswordTextField(),
                          _buildUniqueIDTextField(),
                          _loginRedirectButton(),
                          _submitFormButton()
                        ],
                      ))
                ],
              ),
      ),
    );
  }
}
