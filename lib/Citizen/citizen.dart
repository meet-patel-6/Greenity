// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controllers/auth_controller.dart';

class Citizen_Signup extends StatefulWidget {
  const Citizen_Signup({Key? key}) : super(key: key);

  @override
  State<Citizen_Signup> createState() => _Citizen_SignupState();
}

class _Citizen_SignupState extends State<Citizen_Signup> {
  final Stream<QuerySnapshot> citizenStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  String? get email => '';
  String? get password => '';

  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
    });
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final mobileController = TextEditingController();
  String dob = '18-02-2003';

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text('Sign up for Citizen',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "First Name:",
                          style:
                              TextStyle(fontSize: 20, color: Colors.green[600]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 4,
                              offset: const Offset(0, 5),
                              color: Colors.black.withOpacity(0.4))
                        ]
                      ),

                      child: TextField(
                          controller: fnameController,
                          decoration: InputDecoration(
                              hintText: "Enter Your First Name",
                              // prefixIcon: Icon(Icons.nam, color:Colors.green),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 3.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.0)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Last Name:",
                          style:
                              TextStyle(fontSize: 20, color: Colors.green[600]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 4,
                                offset: const Offset(0, 5),
                                color: Colors.black.withOpacity(0.4))
                          ]
                      ),
                        child: TextField(
                        controller: lnameController,
                        decoration: InputDecoration(
                        hintText: "Enter Your Last Name",
                        // prefixIcon: Icon(Icons.email, color:Colors.green),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.green, width: 3.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Mobile Number:",
                          style:
                              TextStyle(fontSize: 20, color: Colors.green[600]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 4,
                                offset: const Offset(0, 5),
                                color: Colors.black.withOpacity(0.4))
                          ]
                      ),
                      child: TextField(
                        controller: mobileController,
                        decoration: InputDecoration(
                          prefixText: "+91  ",
                          // prefixIcon: Icon(Icons.email, color:Colors.green),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 3.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "E-mail:",
                          style:
                              TextStyle(fontSize: 20, color: Colors.green[600]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 4,
                                offset: const Offset(0, 5),
                                color: Colors.black.withOpacity(0.4))
                          ]
                      ),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: "xyz@gmail.com",
                              // prefixIcon: Icon(Icons.email, color:Colors.green),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.green, width: 3.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [AutofillHints.email],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Birth Date:",
                          style:
                              TextStyle(fontSize: 20, color: Colors.green[600]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.transparent),
                      child: SizedBox(
                        height: 75,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: DateTime(2003, 2, 18),
                          onDateTimeChanged: (DateTime newDateTime) {
                            // Do something
                            dob = DateFormat('dd-MM-yyyy').format(newDateTime);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Password:",
                          style:
                              TextStyle(fontSize: 20, color: Colors.green[600]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 4,
                                offset: const Offset(0, 5),
                                color: Colors.black.withOpacity(0.4))
                          ]
                      ),
                        child: TextField(
                          controller: passwordController,
                          onChanged: (password) => onPasswordChanged(password),
                          obscureText: !_isVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              icon: _isVisible
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.green,
                                    ),
                            ),

                            hintText: "Password",
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 3.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.0)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: _isPasswordEightCharacters
                                  ? Colors.green
                                  : Colors.transparent,
                              border: _isPasswordEightCharacters
                                  ? Border.all(color: Colors.transparent)
                                  : Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Contains at least 8 characters")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: _hasPasswordOneNumber
                                  ? Colors.green
                                  : Colors.transparent,
                              border: _hasPasswordOneNumber
                                  ? Border.all(color: Colors.transparent)
                                  : Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Contains at least 1 number")
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    AuthController.instance.registerCitizen(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      fnameController.text.trim(),
                      lnameController.text.trim(),
                      mobileController.text.trim(),
                      dob,
                    );
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      // backgroundColor: Colors.green[600],
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
