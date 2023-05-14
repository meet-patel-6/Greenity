// ignore_for_file: camel_case_types, depend_on_referenced_packages, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greener_v1/controllers/auth_controller.dart';
import 'package:intl/intl.dart';

class Slot_Login extends StatefulWidget {
  const Slot_Login({Key? key, required this.area}) : super(key: key);
  final String area;

  @override
  State<Slot_Login> createState() => _Slot_LoginState();
}

class _Slot_LoginState extends State<Slot_Login> {
  late String place_name = "Mota Varachha", name, mno;
  String dob = '18-02-2003';
  FirebaseAuth auth = FirebaseAuth.instance;
  List<String> items = [
    "9:00 To 10:00",
    "10:00 To 11:00",
    "4:00 To 5:00",
    "5:00 To 6:00"
  ];
  String? selectedItem = '9:00 To 10:00';
  var nameController = TextEditingController();
  var mnoController = TextEditingController();
  var dateController = TextEditingController();

  int? free, subscription;
  late DatabaseReference dbRef;
  CollectionReference users =
      FirebaseFirestore.instance.collection('AskToPlant');

  late String token;

  void getUserFromDBUsert() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: auth.currentUser!.email.toString())
        .get();

    for (var doc in querySnapshot.docs) {
      token = doc.get('token');
    }
    setState(() {});
  }

  getUserFromDBUser() async {
    final vari = await FirebaseFirestore.instance
        .collection('counter')
        .doc('Zc46be3BLL4nniTDk72R')
        .get();
    setState(() {
      free = vari.data()!['free'];
      subscription = vari.data()!['paid'];
    });
    return 1;
  }

  void getNameAndNumber() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: auth.currentUser!.email.toString())
        .get();

    for (var doc in querySnapshot.docs) {
      nameController.text = doc.get('fname');
      mnoController.text = doc.get('mobile').toString();
    }

    setState(() {});
  }

  void toast(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  List<String> plan = ["Free", "Subscription"];
  String? selectedPlan = 'Free';

  var collection = FirebaseFirestore.instance.collection('counter');

  @override
  Widget build(BuildContext context) {
    getUserFromDBUser();
    getUserFromDBUsert();
    getNameAndNumber();
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text("Slot Booking", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.area,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Divider(
                height: 20,
                thickness: 4,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Name:",
                    style: TextStyle(fontSize: 20, color: Colors.green[600]),
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
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: "Enter Your First Name",
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
                    "Mobile Number:",
                    style: TextStyle(fontSize: 20, color: Colors.green[600]),
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
                    controller: mnoController,
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
                    "Date:",
                    style: TextStyle(fontSize: 20, color: Colors.green[600]),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
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
                    "Time:",
                    style: TextStyle(fontSize: 20, color: Colors.green[600]),
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
                margin: const EdgeInsets.only(top: 5, left: 3),
                child: PhysicalModel(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  elevation: 18,
                  shadowColor: Colors.black,
                  child: SizedBox(
                      width: w * 0.99,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          // enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color:Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                        ),
                        value: selectedItem,
                        items: items
                            .map((item) =>
                                DropdownMenuItem(value: item, child: Text(item)))
                            .toList(),
                        onChanged: (item) => setState(() => selectedItem = item),
                      )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () async {
                    AuthController.instance.slotBook(
                      nameController.text.trim(),
                      widget.area,
                      auth.currentUser!.email.toString(),
                      mnoController.text.trim(),
                      dob,
                      selectedItem.toString(),
                      selectedPlan.toString(),
                      free,
                      subscription,
                      selectedItem.toString(),
                      token.toString(),
                    );
                  },
                  child: const Text(
                    "Book Now",
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
