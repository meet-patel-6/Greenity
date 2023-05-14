// ignore_for_file: depend_on_referenced_packages, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class AMC_Completed extends StatefulWidget {
  const AMC_Completed({Key? key}) : super(key: key);

  @override
  State<AMC_Completed> createState() => _AMC_CompletedState();
}

class _AMC_CompletedState extends State<AMC_Completed> {
  var acceptRequest = FirebaseDatabase.instance.ref().child('Accepted');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Accepted');

  int? count;
  getPlan() async {
    final vari = await FirebaseFirestore.instance
        .collection('counter')
        .doc('Zc46be3BLL4nniTDk72R')
        .get();
    setState(() {
      count = vari.data()!['accepted'];
    });
    return 1;
  }

  Widget listItem({required Map request}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8),
      height: 205,
      // color: Colors.green[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Name : ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              Text(
                request['Name'],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Place Name : ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              Text(
                request['PlaceName'],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Date : ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              Text(
                request['date'],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'email : ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              Text(
                request['email'],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Mobile Number : ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              Text(
                request['mobile_number'],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Time Slot : ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              Text(
                request['time_slot'],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Accepted by: ${request['MName']}  TID : ${request['TID']}',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getPlan();
    return Scaffold(
      appBar: AppBar(
          title: const Text("Completed"),
          backgroundColor: Colors.green,
          actions: [
            Center(
              child: Text(
                "Total: $count  ",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ]),
      body: Container(
        color: Colors.green[200],
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: acceptRequest,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map request = snapshot.value as Map;
            request['key'] = snapshot.key;

            return listItem(request: request);
          },
        ),
      ),
    );
  }
}
