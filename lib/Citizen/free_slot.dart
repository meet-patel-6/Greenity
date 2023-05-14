// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'Slot_Login.dart';

class Plantation extends StatefulWidget {
  const Plantation({Key? key}) : super(key: key);

  @override
  State<Plantation> createState() => _PlantationState();
}

class _PlantationState extends State<Plantation> {
  Query addNewSlot = FirebaseDatabase.instance.ref().child('AddNewSlot');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('AddNewSlot');

  Widget listItem({required Map availableSlot}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.green,
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      // padding: const EdgeInsets.all(8),
      height: 100,
      // color: Colors.green[300],
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade100,
        elevation: 18,
        shadowColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${availableSlot['slot_address']} slot details.',
                  style: const TextStyle(color: Color(0xff005703), fontSize: 20),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Total Slot ${availableSlot['total_slot']}',
                      style: const TextStyle(color: Color(0xff005703), fontSize: 16),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Slot_Login(area: availableSlot['slot_address'])));
                  },
                  child: const Text('Plant')),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        title: const Text("Available Slot", style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: addNewSlot,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map availableSlot = snapshot.value as Map;
            availableSlot['key'] = snapshot.key;

            return listItem(availableSlot: availableSlot);
          },
        ),
      ),
    );
  }
}
