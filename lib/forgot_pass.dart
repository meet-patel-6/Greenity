// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Forgot_Pass extends StatefulWidget {
  const Forgot_Pass({Key? key}) : super(key: key);

  @override
  State<Forgot_Pass> createState() => _Forgot_PassState();
}

class _Forgot_PassState extends State<Forgot_Pass> {
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    const backgroundColor = Color(0xFFE7ECEF);
    Offset distance = const Offset(28, 28);
    double blur = 30.0;
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.green[900],
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'Forgot Password',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Column (
        children: [
          Container(
            margin: const EdgeInsets.only(left: 0, right: 0),
            width: w,
            height: h * 0.60,

            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Wrap(
                  children:[
                     Text("E-mail:",
                      style: TextStyle(
                        fontSize: 25,
                          color: Colors.green[600],
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      width: w * 0.9
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow:  [
                      BoxShadow(
                        blurRadius: blur,
                        offset: -distance,
                        color: Colors.white,
                      ),
                      BoxShadow(
                          blurRadius: blur,
                          offset: distance,
                          color: const Color(0xFFA7A9AF)
                      ),
                    ],
                  ),
                    child:
                    PhysicalModel(
                      borderRadius: BorderRadius.circular(30),
                      color: backgroundColor,
                      child: TextField(
                        style:const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "xyz@gmail.com",
                          hintStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          prefixIcon:
                          const Icon(Icons.email, color: Colors.green),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 0
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0
                              )
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: h * 0.08,
                ),

                Container(
                  width: 200,
                  height: 60,

                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow:  [
                      BoxShadow(
                        blurRadius: blur,
                        offset: -distance,
                        color: Colors.white,
                      ),
                      BoxShadow(
                          blurRadius: blur,
                          offset: distance,
                          color: const Color(0xFFA7A9AF)
                      ),
                    ],
                  ),

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: const StadiumBorder()
                    ),
                    onPressed: () {
                      auth.sendPasswordResetEmail(email: emailController.text.trim());
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(msg: "Check your mail for password reset link.");
                    },
                    child: const Text(
                      "Get Reset Link",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
