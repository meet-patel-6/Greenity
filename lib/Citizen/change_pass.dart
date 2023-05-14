// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  bool login = false;

  var email = TextEditingController();
  var password = TextEditingController();

  var displayName = TextEditingController();

  var currentPass = TextEditingController();
  var newPass = TextEditingController();
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          login = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text('Change Password', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.green.shade100,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // const Text('Home Page'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  FirebaseAuth.instance.currentUser!.email!,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: PhysicalModel(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  elevation: 18,
                  shadowColor: Colors.black,
                  child: TextFormField(
                    obscureText: true,
                    controller: currentPass,
                    decoration: InputDecoration(
                        hintText: "Enter The Current Password",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: PhysicalModel(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  elevation: 18,
                  shadowColor: Colors.black,
                  child: TextFormField(
                    obscureText: true,
                    controller: newPass,
                    decoration: InputDecoration(
                        hintText: "Enter The New Password",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () async {
                    if (displayName.value.text.isNotEmpty) {
                      try {
                        FirebaseAuth.instance.currentUser!
                            .updateDisplayName(displayName.text);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChangePass()));
                      } catch (e) {
                        if (kDebugMode) {
                          print(e);
                        }
                      }
                    }
                    if (currentPass.value.text.isNotEmpty &&
                        newPass.value.text.isNotEmpty) {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: FirebaseAuth.instance.currentUser!.email!,
                          password: currentPass.text);
                      await FirebaseAuth.instance.currentUser!
                          .updatePassword(newPass.text);
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Update Success')));
                    }
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(
                      // backgroundColor: Colors.green[600],
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
