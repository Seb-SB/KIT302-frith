import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_frith/View/business_login.dart';
import 'package:flutter_application_frith/global_ip.dart' as globals;

class SignUpBusiness extends StatefulWidget {
  const SignUpBusiness({Key? key}) : super(key: key);

  @override
  State<SignUpBusiness> createState() => _SignUpBusinessState();
}

class _SignUpBusinessState extends State<SignUpBusiness> {
  GlobalKey<FormState> formkey =
      GlobalKey<FormState>(); //keep track of form state

  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessAbnController = TextEditingController();
  TextEditingController businessEmailController = TextEditingController();
  TextEditingController businessNumberController = TextEditingController();
  TextEditingController businessManagerFirstNameController =
      TextEditingController();
  TextEditingController businessManagerLastNameController =
      TextEditingController();
  TextEditingController businessPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController poolIDController = TextEditingController();

  var errorMessage = "";
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildBusinessNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: businessNameController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter the name of the business";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: "Enter the business name",
              prefixIcon: Icon(Icons.home_outlined),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBusinessEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: businessEmailController,
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

  Widget _buildBusinessNumberTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: businessNumberController,
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
              hintText: "Enter phone number of business",
              prefixIcon: Icon(Icons.contact_phone),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBusinessABNTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: businessAbnController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid ABN";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: "Enter your ABN/ACN",
              prefixIcon: Icon(Icons.numbers),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBusinessManagerFirstNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: businessManagerFirstNameController,
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

  Widget _buildBusinessManagerLastNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: businessManagerLastNameController,
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

  Widget _buildBusinessPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: businessPasswordController,
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

  Widget _buildBusinessConfirmPasswordTextField() {
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
                return "Please enter a password";
              } else if (value != businessPasswordController.text) {
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

  Widget _buildBusinessPoolIDTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: 60.0,
          child: TextFormField(
            controller: poolIDController,
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a pool ID";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              hintText: "Enter Pool ID",
              prefixIcon: Icon(Icons.access_time_sharp),
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

              if (errorMessage.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }

              setState(() {
                _isLoading = true;
              });
              if (!formkey.currentState!.validate()) {
                setState(() {
                  _isLoading = false;
                });
              } else {
                _submit(
                    businessNameController.text,
                    businessAbnController.text,
                    businessEmailController.text,
                    businessNumberController.text,
                    businessManagerFirstNameController.text,
                    businessManagerLastNameController.text,
                    businessPasswordController.text,
                    int.parse(poolIDController.text));
              }
            },
            child: const Text('SUBMIT')),
      ],
    );
  }

  Future<void> _submit(
      String busName,
      String busABN,
      String busEmail,
      String busPhoneNumber,
      String busFirstName,
      String busLastName,
      String busPassword,
      int busPoolID) async {
    var url = 'http://' +
        globals.GLOBAL_IP +
        '/frith/connection/business_owner_create.php';

    Map data = {
      'BusinessName': busName,
      'ABN': busABN,
      'PhoneNumber': busPhoneNumber,
      'EmailAddress': busEmail,
      'Password': busPassword,
      'ManagerFirstName': busFirstName,
      'ManagerLastName': busLastName,
      'PoolID': busPoolID
    };

    var jsonData = null;

    ///print(data.entries);

    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          //'Accept': 'application/json'
        },
        body: jsonEncode(data),
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
            MaterialPageRoute(builder: (context) => BusLogin()),
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
        title: const Text("Business Owner"),
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
                          _buildBusinessNameTextField(),
                          _buildBusinessEmailTextField(),
                          _buildBusinessNumberTextField(),
                          _buildBusinessABNTextField(),
                          _buildBusinessManagerFirstNameTextField(),
                          _buildBusinessManagerLastNameTextField(),
                          _buildBusinessPasswordTextField(),
                          _buildBusinessConfirmPasswordTextField(),
                          _buildBusinessPoolIDTextField(),
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
