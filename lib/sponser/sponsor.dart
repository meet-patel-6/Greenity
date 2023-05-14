// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controllers/auth_controller.dart';

class Sponsor_Signup extends StatefulWidget {
  const Sponsor_Signup({Key? key}) : super(key: key);

  @override
  State<Sponsor_Signup> createState() => _Sponsor_SignupState();
}

String valueChoose = list.first;
const List<String> list = <String>[
  'Clothing',
  'Jewellery',
  'Food and Drinks',
  'Services',
  'Cosmetics',
  'Education',
  'Others'
];

class _Sponsor_SignupState extends State<Sponsor_Signup> {
  final Stream<QuerySnapshot> sponsorStream =
      FirebaseFirestore.instance.collection('sponsor').snapshots();
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
  final nameController = TextEditingController();
  final headNameController = TextEditingController();
  final mobileController = TextEditingController();
  final gstController = TextEditingController();
  final pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: const Text('Greener'),
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
                    Text(
                      "Sign up for Sponsor",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text(
                          "Name of Company:",
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
                          ]),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "Enter Your Company",
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
                          "Name of Head:",
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
                          ]),
                      child: TextField(
                        controller: headNameController,
                        decoration: InputDecoration(
                            hintText: "Enter Name of Head",
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
                          "GST Number:",
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
                          ]),
                      child: TextField(
                        controller: gstController,
                        decoration: InputDecoration(
                            hintText: "**",
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
                          "E-mail ID:",
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
                          ]),
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
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Mobile No.:",
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
                          ]),
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
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "PinCode:",
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
                          ]),
                      child: TextField(
                        controller: pinController,
                        decoration: InputDecoration(
                            hintText: "PINCODE",
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
                          "Category of  products :",
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
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // margin: const EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: const Offset(1, 1),
                                    color: Colors.white.withOpacity(0.2))
                              ]),
                          child: DropdownButton<String>(
                            hint: const Text('Select Item'),
                            value: valueChoose,
                            dropdownColor: Colors.green[300],
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 36,
                            isExpanded: true,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                            onChanged: (String? newValue) {
                              setState(() {
                                valueChoose = newValue.toString();
                              });
                            },
                            items: list.map<DropdownMenuItem<String>>(
                                (String valueItem) {
                              return DropdownMenuItem<String>(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
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
                          ]),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 3.0)),
                          hintText: "Password",
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
              GestureDetector(
                onTap: () {
                  AuthController.instance.registerSponsor(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      nameController.text.trim(),
                      headNameController.text.trim(),
                      mobileController.text.trim(),
                      pinController.text.trim(),
                      valueChoose.trim(),
                      gstController.text.trim());
                },
                child: Container(
                    width: w * 0.5,
                    height: h * 0.08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage("img/g.jpg"), fit: BoxFit.cover)),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          // backgroundColor: Colors.green[600],
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}
