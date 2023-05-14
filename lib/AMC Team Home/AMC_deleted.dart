// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class AMC_Deleted extends StatefulWidget {
  const AMC_Deleted({Key? key}) : super(key: key);

  @override
  State<AMC_Deleted> createState() => _AMC_DeletedState();
}

class _AMC_DeletedState extends State<AMC_Deleted> {
  var deletedRequest = FirebaseDatabase.instance.ref().child('Deleted');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Deleted');

  int? count;
  getPlan() async {
    final vari = await FirebaseFirestore.instance
        .collection('counter')
        .doc('Zc46be3BLL4nniTDk72R')
        .get();
    setState(() {
      count = vari.data()!['deleted'];
    });
    return 1;
  }

  Widget listItem({required Map deleted}) {
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
                deleted['Name'],
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
                deleted['PlaceName'],
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
                deleted['date'],
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
                deleted['email'],
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
                deleted['mobile_number'],
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
                deleted['time_slot'],
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
            'Deleted by : ${deleted['MName']}  TID :  ${deleted['TID']}',
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
          title: const Text("Deleted"),
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
          query: deletedRequest,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map deleted = snapshot.value as Map;
            deleted['key'] = snapshot.key;

            return listItem(deleted: deleted);
          },
        ),
      ),
    );
  }
}
