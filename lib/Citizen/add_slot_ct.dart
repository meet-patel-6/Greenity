// ignore_for_file: camel_case_types, depend_on_referenced_packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Add_Slot_Ct extends StatefulWidget {
  const Add_Slot_Ct({Key? key}) : super(key: key);

  @override
  State<Add_Slot_Ct> createState() => _Add_Slot_CtState();
}

class _Add_Slot_CtState extends State<Add_Slot_Ct> {
  late DatabaseReference adNewSlot;

  CollectionReference addNewSlot =
      FirebaseFirestore.instance.collection('AddNewSlot');

  final emailController = TextEditingController();
  final pinController = TextEditingController();
  final nameController = TextEditingController();
  final addController = TextEditingController();
  final mobileController = TextEditingController();
  final slotController = TextEditingController();

  late String oname, date, email, address, tname, tid;
  late int onumber, pin, nslot;

  String dob = '18-02-2003';

  @override
  void initState() {
    super.initState();
    adNewSlot = FirebaseDatabase.instance.ref().child('AddNewSlot');
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text('Add New Slot', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.green.shade100,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
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
                          "Owner Name:",
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
                          onChanged: (value) {
                            oname = value;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                              hintText: "Enter Owner Name",
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
                          "Owner Mobile Number:",
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
                          onChanged: (value) {
                            onumber = value as int;
                          },
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
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Owner E-mail:",
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
                          onChanged: (value) {
                            email = value;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: "xyz@gmail.com",
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
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [AutofillHints.email],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Slot Address:",
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
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: PhysicalModel(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        elevation: 18,
                        shadowColor: Colors.black,
                        child: TextField(
                          onChanged: (value) {
                            address = value;
                          },
                          controller: addController,
                          decoration: InputDecoration(
                              hintText: "Enter the Address",
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
                          "Pincode:",
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
                          onChanged: (value) {
                            pin = value as int;
                          },
                          controller: pinController,
                          decoration: InputDecoration(
                              hintText: "Enter the Pincode",
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
                          "Number of Slot:",
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
                          onChanged: (value) {
                            nslot = value as int;
                          },
                          controller: slotController,
                          decoration: InputDecoration(
                              hintText: "Enter the Minimum slot to Plant a Tree",
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
                          "Slot Add Date:",
                          style:
                              TextStyle(fontSize: 20, color: Colors.green[600]),
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
                  onPressed: () async {
                    Map<String, String> addNewSlot = {
                      'owner_name': nameController.text,
                      'owner_email': emailController.text,
                      'owner_mobile_number': mobileController.text,
                      'slot_address': addController.text,
                      'slot_pincode': pinController.text,
                      'total_slot': slotController.text,
                      'free_slot': slotController.text,
                      'date': '26/11/2002'
                    };

                    adNewSlot.push().set(addNewSlot);
                    Fluttertoast.showToast(
                        msg: "Slot Added",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0,
                        backgroundColor: Colors.black38);

                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Add_Slot_Ct()));
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
