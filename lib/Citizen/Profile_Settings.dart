// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile_Settings extends StatefulWidget {
  const Profile_Settings({Key? key}) : super(key: key);

  @override
  State<Profile_Settings> createState() => _Profile_SettingsState();
}

class _Profile_SettingsState extends State<Profile_Settings> {
  bool isLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  void getUserFromDBUser() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: auth.currentUser!.email.toString())
        .get();

    for (var doc in querySnapshot.docs) {
      // Getting data directly
      fnameController.text = doc.get('fname');
      lnameController.text = doc.get('lname');
      mobileController.text = doc.get('mobile').toString();
      dobController.text = doc.get('birthDate');
      marriageController.text = doc.get('marriageDate');
    }

    setState(() {});
  }

  @override
  void initState() {
    getUserFromDBUser();
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController marriageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text('Edit Profile', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.green.shade100,
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
                      child: TextField(
                        controller: fnameController,
                        decoration: InputDecoration(
                            hintText: "Firstname",
                            // prefixIcon: Icon(Icons.nam, color:Colors.green),
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
                      child: TextField(
                        controller: lnameController,
                        decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.email, color:Colors.green),
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
                      child: TextField(
                        controller: mobileController,
                        decoration: InputDecoration(
                            prefixText: "+91  ",
                            // prefixIcon: Icon(Icons.email, color:Colors.green),
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
                        keyboardType: TextInputType.number,
                      ),
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
                      child: TextField(
                        controller: dobController,
                        decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.email, color:Colors.green),
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
                    height: 30,
                  ),
                  Center(
                    child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 60,

                        // elevated button created and given style
                        // and decoration properties
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            User? user = FirebaseAuth.instance.currentUser;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(user?.uid)
                                .update({
                              "fname": fnameController.text,
                              "lname": lnameController.text,
                              "mobile": mobileController.text,
                              "birthDate": dobController.text,
                              "marriageDate": marriageController.text,
                            });

                            Future.delayed(const Duration(seconds: 1), () {
                              setState(() {
                                isLoading = false;
                              });
                            });
                            Fluttertoast.showToast(
                                msg: "Updated",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.white,
                                fontSize: 16.0,
                                backgroundColor: Colors.black38);
                          },
                          child: isLoading
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  // as elevated button gets clicked we will see text"Loading..."
                                  // on the screen with circular progress indicator white in color.
                                  //as loading gets stopped "Submit" will be displayed
                                  children: const [
                                    Text(
                                      'Loading...',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              : const Text(
                                  'Update',
                                  style: TextStyle(fontSize: 20),
                                ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
